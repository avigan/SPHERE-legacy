;+
; NAME:
;
;  SYNTHETIC_SYMMETRY
;
; AUTHOR:
;
;   Arthur Vigan
;   Laboratoire d'Astrophysique de Marseille
;   38, rue Frederic Joliot-Curie, 13388 Marseille Cedex 13, France
;   arthur.vigan@lam.fr
;
; PURPOSE:
;
;  Simple speckle subtraction based on symmetry around the star
;
; CALLING SEQUENCE:
;
;   synth = SYNTHETIC_SYMMETRY(sig_over,lambda,use_mask,pla_mask, $
;                              SILENT=silent)
;
; INPUTS:
;
;  SIG_OVER - 2D rescaled (and sometimes oversampled) spectrum
;
;  LAMBDA - wavelength vector; in nanometers
;
;  PLANET_MASK - binary mask for the planet, as created by the
;                SPH_IRD_LSS_RESCALE function
;
;  USE_MASK - binary mask of the "usable" area, as created by the
;             SPH_IRD_LSS_RESCALE function
;
;  PLA_MASK - planet mask. Not used in this function
;
;  SILENT - suppress verbose outputs
;
; OUTPUTS:
;
;  A synthetic spectrum representing the speckles and stellar halo in
;  the input SIG_OVER spectrum.
;
;-

function synthetic_symmetry,sig_over,lambda,use_mask,pla_mask, $
                            SILENT=silent
  nlambda = n_elements(lambda)
  w = (size(sig_over,/dim))[0]
  bigh = (size(sig_over,/dim))[1]

  ;; remove speckles
  if ~keyword_set(silent) then print,'Speckles attenuation with symmetry...'
  synthetic_over = fltarr(w,bigh)

  synthetic_over[*,0:bigh/2-1] = reverse(sig_over[*,bigh/2:*],2)
  synthetic_over[*,bigh/2:*]   = sig_over[*,bigh/2:*]

  if ~keyword_set(silent) then begin
     print,cr()+'  --> done!',format='($,a)'
     print
  endif

  return,synthetic_over
end
