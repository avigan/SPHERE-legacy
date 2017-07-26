VLT/SPHERE legacy IDL code
==========================

Introduction
------------

This repository contains IDL legacy code for the reduction and analysis of VLT/SPHERE data. These codes are slowly being migrated to a more modern Python module, `pySPHERE <https://github.com/avigan/pySPHERE>`_.

Required libraries
------------------

For the SPHERE tools to work properly, the following external IDL libraries must be installed and functionnal:

* `Astronomy user's library <http://idlastro.gsfc.nasa.gov/>`_
* `MPFIT <https://www.physics.wisc.edu/~craigm/idl/fitting.html>`_
* `Coyote library <http://www.idlcoyote.com/>`_

sphere_transmission: SPHERE near-infrared neutral densities
-----------------------------------------------------------

This code allows to compensate the effect of the neutral density filters that may have been used during SPHERE/IRDIFS observations, e.g. to avoid saturation when acquiring and off-axis PSF ("FLUX" in ESO templates and documentation). The code include a function dedicated to IRDIS, which gives the compensation factor to apply for a given filter combination, and a more generic function, which can be used to calibrate IFS or IRDIS/LSS spectroscopy data. The routines are based on (and include) the transmission curves of all IRDIS filters, which are available on the `SPHERE filters page <https://www.eso.org/sci/facilities/paranal/instruments/sphere/inst/filters.html>`_ at ESO.


ifs_reduction: SPHERE/IFS reduction pipeline
--------------------------------------------

`Vigan et al. 2015, MNRAS, 454, 129 <https://ui.adsabs.harvard.edu/#abs/2015MNRAS.454..129V/abstract>`_

This code includes a full data reduction pipeline for SPHERE/IFS data, which allows to go from the raw data, to the properly calibrated and aligned (x,y,λ) data cubes. It does not contain advanced data analysis routines (PCA, LOCI, etc). The pipeline is a combination between the `official SPHERE pipeline <https://www.eso.org/sci/software/pipelines/>`_ and additional custom IDL routines developed specifically. This pipeline and its implementation are described in `Vigan et al. (2015) <https://ui.adsabs.harvard.edu/#abs/2015MNRAS.454..129V/abstract>`_. The pipeline is released under the MIT license. You are free to use it for your research, but I kindly ask you to cite the above reference in your publication that made use of this pipeline (or parts of it). A more extensive documentation is included in the package.

irdis_lss_reduction: IRDIS/LSS reduction pipeline
-------------------------------------------------

`Vigan, 2016, ASCL, 1603.001 <https://ui.adsabs.harvard.edu/#abs/2016ascl.soft03001V/abstract>`_

This code is a full data reduction and analysis pipeline for the `SPHERE/IRDIS long-slit spectroscopy mode <https://ui.adsabs.harvard.edu/#abs/2008A&A...489.1345V/abstract>`_, which allows to go from the raw data to the extraction of the spectrum of a companion. The pipeline is a combination between the `official SPHERE pipeline <https://www.eso.org/sci/software/pipelines/>`_ and additional custom IDL routines developed specifically. The pipeline is released under the MIT license. You are free to use it for your research, but I kindly ask you to cite the above reference in your publication that made use of this pipeline (or parts of it). A more extensive documentation is included in the package.

Credits
-------

The development of the SPHERE instrument has demanded a tremendous effort from many scientists, who have devoted several years of their life to design, build, test and commission the instrument. To recognize this work, we kindly ask you to cite the relevant instrumental papers in your scientific work. The reference papers for the instrument and its observing mode are:

SPHERE:
 * general description: `Beuzit et al., 2008, SPIE, <https://ui.adsabs.harvard.edu/#abs/2008SPIE.7014E..18B/abstract>`_

IRDIS:
 * general description: `Dohlen et al., 2008, SPIE, 7014 <https://ui.adsabs.harvard.edu/#abs/2008SPIE.7014E..3LD/abstract>`_
 * Long-slit spectroscopy mode: `Vigan et al., 2008, A&A, 489, 1345 <https://ui.adsabs.harvard.edu/#abs/2008A&A...489.1345V/abstract>`_
 * Dual-Band Imaging mode: `Vigan et al., 2010, MNRAS, 407, 71 <https://ui.adsabs.harvard.edu/#abs/2010MNRAS.407...71V/abstract>`_
 * Dual-Polarization Imaging mode: `Langlois et al., 2014, SPIE, 9147 <https://ui.adsabs.harvard.edu/#abs/2014SPIE.9147E..1RL/abstract>`_

IFS:
 * general description: `Claudi et al., 2008, SPIE, 7014 <https://ui.adsabs.harvard.edu/#abs/2008SPIE.7014E..3EC/abstract>`_
 * performance: `Mesa et al., 2015, A&A, 576, 121 <https://ui.adsabs.harvard.edu/#abs/2015A&A...576A.121M/abstract>`_

We are grateful for your effort, and hope that these tools will contribute to your scientific work and discoveries. Please feel free to report any bug or possible improvement to the author(s).

Author
------

Arthur Vigan, `arthur.vigan@lam.fr <mailto:arthur.vigan@lam.fr>`_
