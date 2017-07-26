SPHERE/IFS reduction pipeline
=============================

Description
-----------

This repository contains the SPHERE/IFS reduction pipeline described in
the paper:

`Vigan et al. 2015, MNRAS, 454, 129 <https://ui.adsabs.harvard.edu/#abs/2015MNRAS.454..129V/abstract>`_

The starting point is the script *data_reduction_IFS.sh*, which contains most of the documentation and a step by step procedure to reduce an IFS data set. Then the IDL script *data_reduction_IFS.pro* can be used for the final steps. The pro/ subdirectory contains other IDL routines that are used in the data reduction.

No example data is included, but the `ESO archive <http://archive.eso.org/wdb/wdb/eso/sphere/form>`_ now contains a lot of public data, which can be used to test the pipeline.

Contact
-------

Do not hesitate to contact me if you have any problem using the reduction pipeline.

Arthur Vigan, `arthur.vigan@lam.fr <mailto:arthur.vigan@lam.fr>`_
