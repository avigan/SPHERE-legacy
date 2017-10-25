;+
; NAME:
;
;   SPH_CPI_ND_TRANSMISSION
;
; PURPOSE:
;
;   Provides the neutral density values at any given wavelength
;
; CALLING SEQUENCE:
;
;   ND_values  = SPH_CPI_ND_TRANSMISSION( ND_filter, LAMBDA,
;                                         [ROOT=...] )
;
; DESCRIPTION:
;
;   The function provides the neutral density value as a function of
;   the CPI ND filter and for any wavelength provided by the user in
;   nanometers. It works for both IRDIS and IFS, within the range of
;   wavalength covered by SPHERE (0.95-2.3 microns)
;   
;   The possible values for the ND filter are:
;    - OPEN
;    - ND_1.0
;    - ND_2.0
;    - ND_3.5
;
;   The ND values are calculated by linearly interpolating the
;   transmission curves that have been calibrated from internal
;   measurements.
;
;   The input ND value for the function can be obtained directly from
;   the raw files FITS headers using the following keyword:
;
;    HIERARCH ESO INS4 FILT2 NAME ==> ND_filter
;
;   The returned value is in units of neutral density. To convert it
;   to the proper multiplicative factor, one has to apply 10^ND.
;
;   Please note that the primary use of this function is for
;   spectroscopic observations where the spectral bandwidth of the
;   channels can be neglected (IFS, IRDIS/LSS). For the analysis of
;   imaging data taken with IRDIS (CI, DBI, DPI), it is better to use
;   the sph_ird_transmission() function also provided with this
;   library.
;
; INPUTS:
;
;   ND_FILTER - CPI neutral density filter name from the list above,
;               or extracted from the header of raw IRDIS data;
;               format: text
;
;   LAMBDA - wavelength in nanometers; format: float (single value or
;            vector)
;
; KEYWORD PARAMETERS:
;
;   ROOT - root directory where the filter transmission files are
;          stored. The default value can be modified at the
;          beginning of the programe; format: text
;
; OUTPUTS:
;
;   Neutral density value at each wavelength. The output has the same
;   number of elements as the input LAMBDA vector
;
; EXAMPLE:
;
;   IDL> wave = 1000. + findgen(10)*100
;   IDL> ND_VAL = SPH_CPI_ND_TRANSMISSION('ND_2.0', wave)
;
;   In this case, the correction factors to apply to each spectral
;   channel of your data would be:
;
;   IDL> correction_factor = 10^ND_VAL
;
; MODIFICATION HISTORY:
;
;   arthur.vigan - 07/2017
;                  Code transitionned to GitHub for improved support
;                  
;   arthur.vigan - 07/2015 - additonnal documentation for distribution
;                            ND filter specified by its name rather
;                            than value
;                            added some safeguards
;
;   arthur.vigan - 03/2013 - original version developed for IRDIS LSS
;                            analysis
;   
; AUTHOR:
; 
;   Arthur Vigan
;   Laboratoire d'Astrophysique de Marseille
;   arthur.vigan@lam.fr
;
; LICENSE:
;
;   This code is released under the MIT license.
;
;-

function sph_cpi_nd_transmission, ND_filter, lambda, ROOT=root
  on_error,2
  
  if ~keyword_set(root) then root = '~/Work/IDL/Data/Filters/'
  
  ;; removing spaces and using uppercase
  ND_filter = strupcase(strtrim(ND_filter,2))
    
  ;; ND CPI
  test = file_test(root+'SPHERE_CPI_ND.txt')
  if (test eq 0) then message,'File not available. The ROOT variable is probably not set properly'
  
  readcol,root+'SPHERE_CPI_ND.txt',w_cpi_nd,t_cpi_nd_0,t_cpi_nd_1, $
          t_cpi_nd_2,t_cpi_nd_35,/silent
  case ND_filter of
     'OPEN':   t_cpi_nd = t_cpi_nd_0
     'ND_1.0': t_cpi_nd = t_cpi_nd_1
     'ND_2.0': t_cpi_nd = t_cpi_nd_2
     'ND_3.5': t_cpi_nd = t_cpi_nd_35
     else: message,ND_filter+' is not available.'
  endcase
  
  ;; interpolation
  tr = interpol(t_cpi_nd >0 ,w_cpi_nd,lambda)
  ND = -alog10(tr)
  
  return,ND
end
