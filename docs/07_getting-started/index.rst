.. _getting_started:

==============================
Getting Started
==============================

This section summarizes the FRED Framework workflow and the steps required to run a FRED-based application on the FPGA. The proposed workflow can be divided into three phases: hw/sw partitioning, hardware design, software deployment. 

The *hw/sw partitioning phase* is when the designer has to decide which parts of the target application will be offloaded to FPGA. Typically this is decided based on profiling data from the application, where the bottlenecks are usually good candidates for FPGA offloading. For each function to be offloaded there must have an equivalent hw IP, like those already provided in `dart_ip <https://github.com/fred-framework/dart_ips>`_ repository. Finally, the applications timing requirements should also be extracted in this phase.

Next, is the *hardware design phase*, where `DART <../02_dart>`_ produces the bitstreams and hardware partitions. Note that it is also possible to work with `FRED Runtime <../03_runtime>`_ with hardware designed with Xilinx DPR flow called `Dynamic Function eXchange <https://www.xilinx.com/support/documentation/sw_manuals/xilinx2020_2/ug909-vivado-partial-reconfiguration.pdf>`_ instead of DART. The difference is that it will require more time and experience with Xilinx tools to have an equivalent hardware design. Moreover, the timing analysis done by DART would not exist, and the designer would need to do it himself.

The *software deployment phase* needs a FRED-ready Linux distribution, like the one created with the Yocto layers  `meta-fred <https://github.com/fred-framework/meta-fred>`_ and `meta-retis <https://github.com/fred-framework/meta-retis>`_ and Petalinux. Once the Linux image is ready, then starts the application software design. One can use a Yocto-based embedded software development flow, the recommended flow, or design the software directly on the board. The Linux image designed for FRED works with both approaches. 

.. code-block:: 

  $ wget https://raw.githubusercontent.com/fred-framework/fred-docs/main/docs/07_getting-started/build_img.sh .
  $ chmod +x build_img.sh
  $ wget https://raw.githubusercontent.com/fred-framework/meta-fred/main/scripts/pt-config
  # wget bsp
  $ ./build_img.sh <prj-name> <full-path/bsp> <full-path/pt-config>



The tutorials in `DART repository <https://github.com/fred-framework/dart/blob/master/docs/example.md>`_ are a good starting point for a development flow based on DART and FRED. The alternative is this `other tutorial <https://gitlab.retis.santannapisa.it/m.pagani/fred-docs>`_ within Vivado Xilinx for the hardware design and FRED for the software deployment phase.
