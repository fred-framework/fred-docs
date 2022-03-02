.. _getting_started:

==============================
Getting Started
==============================

This sections summarizes the FRED Framework workflow and the steps required to have an FRED-based application running on the FPGA. The proposed workflow can be divided into three distinct phases: hw/sw partitioning, hardware design, software deployment. 

The *hw/sw partitioning phase* is when the designer has to decide which parts of the target application will be offloaded to FPGA. Tipically this is decide based on profilling data fom the application, where the bottlenecks are usually good candidates for FPGA offloading. For each function to be offloaded there must have an equivalent hw IP, like the ones already provided in `dart_ip <https://github.com/fred-framework/dart_ips>`_ repository. Finally, the applications timing requirements shold also be extract in this phase.

Next, is the *hardware design phase*, where `DART <../02_dart>`_ is used to produce the bitstreams and hardware partitions. Note that it is also possible to work with `FRED Runtime <../03_runtime>`_ with a hardware designed with Xilinx DPR flow called `Dynamic Function eXchange <https://www.xilinx.com/support/documentation/sw_manuals/xilinx2020_2/ug909-vivado-partial-reconfiguration.pdf>`_ instead of DART. The difference is that it will require more time and experience with Xilinx tools to have an equivalent hardware design. Moreover, the timing analysis done by DART would not exist and the designer would need to do it himself.

The *software deployment phase* needs a FRED-ready Linux distribution, like the one created with the Yocto layers  `meta-fred <https://github.com/fred-framework/meta-fred>`_ and `meta-retis <https://github.com/fred-framework/meta-retis>`_ and Petalinux. Once the Linux image is ready, then starts the application software design itself. One can use a Yocto-based embedded software development flow, which is the recommended flow, or also design the software directly in the board. The Linux image designed for FRED works with both approaches. 

The tutorials in `DART repository <https://github.com/fred-framework/dart/blob/master/docs/example.md>`_ are a good starting point for a development flow based on DART and FRED. The alternative is this `other tutorial <https://gitlab.retis.santannapisa.it/m.pagani/fred-docs>`_ with in Viado Xilinx for the hardware design and FRED for the software deployment phase.
