IRDIS/LSS reduction and analysis pipeline
=========================================

Description
-----------

This repository contains a SPHERE/IRDIS reduction pipeline for long-slit spectroscopy (LSS) data.

The starting point is the script *sph_ird_lss.pro*, which contains most of the documentation and a step by step procedure to reduce an IRDIS/LSS data set. The pro/ subdirectory contains all the IDL routines that are used in the data reduction.

No example data is included, but the `ESO archive <http://archive.eso.org/wdb/wdb/eso/sphere/form>`_ now contains public data, which can be used to test the pipeline.

Do not hesitate to contact me if you have any problem using the reduction pipeline.

Credits
-------

If you use this pipeline, please cite the following reference:

.. image:: https://img.shields.io/badge/ascl-1603.001-blue.svg?colorB=262255

* `Vigan, 2016, ASCL, 1603.001 <https://ui.adsabs.harvard.edu/#abs/2016ascl.soft03001V/abstract>`_

<a href="http://ascl.net/1603.001"><img src="https://img.shields.io/badge/ascl-1603.001-blue.svg?colorB=262255" alt="ascl:1603.001" /></a>

The development of the SPHERE instrument has demanded a tremendous effort from many scientists, who have devoted several years of their life to design, build, test and commission the instrument. To recognize this work, we kindly ask you to cite the relevant instrumental papers in your scientific work. The reference papers for SPHERE and the IRDIS/LSS mode are:

* SPHERE general description: `Beuzit et al., 2008, SPIE, <https://ui.adsabs.harvard.edu/#abs/2008SPIE.7014E..18B/abstract>`_
* IRDIS general description: `Dohlen et al., 2008, SPIE, 7014 <https://ui.adsabs.harvard.edu/#abs/2008SPIE.7014E..3LD/abstract>`_
* Long-slit spectroscopy mode: `Vigan et al., 2008, A&A, 489, 1345 <https://ui.adsabs.harvard.edu/#abs/2008A&A...489.1345V/abstract>`_

We are grateful for your effort, and hope that these tools will contribute to your scientific work and discoveries. Please feel free to report any bug or possible improvement to the author(s).

Author
------

Arthur Vigan, `arthur.vigan@lam.fr <mailto:arthur.vigan@lam.fr>`_

