.. _runtime:

==============
FRED Runtime
==============

The *FRED runtime* is the reference implementation of the FRED framework for the GNU/Linux operating system. It has been designed to run on the *Xilinx Zynq-7000 and Zynq UltraScale+ SoC FPGAs platforms*. The FRED runtime consists of a *system support design* and a set of *software support* components.

System support design
----------------------

The system support design is a reference design for the FPGA side of the SoC that has been designed to support the deployment of dynamically-reconfigured hardware accelerators. The support design divides the FPGA into two regions: a *static region* and a *reconfigurable region*. The static region contains the logic needed to realize the communication infrastructure, namely a set of AXI Interconnects, which can be extended by the user by adding other support modules depending on the specific needs. The reconfigurable region is organized into a set of statically defined slots that are logically grouped into partitions.

.. image:: ../images/fred-linux-hw-arch.png
    :width: 500px
    :align: center
    :alt:  System support design

Software support
-----------------

The software support comprises a set of software components in charge of managing the FPGA and implementing the FRED scheduling policy on top of the system support design. The software support has been designed in a modular fashion, relying as much as possible on user space implementation to improve maintainability, safety, and expandability. The central component of the software support is a user-space server process, named the *FRED server*, which is in charge of managing acceleration requests from Linux processes (and threads) according to the FRED scheduling policy. Linux processes and hardware accelerators share data through a zero-copy mechanism implemented using physically contiguous (uncached) memory buffers. The FRED server relies on two custom kernel modules and the UIO framework for controlling the hardware accelerators.

.. image:: ../images/fred-linux-sw-arch.png
    :width: 600px
    :align: center
    :alt: Software support

Kernel space
^^^^^^^^^^^^^^

The first custom kernel module is used to allocate the contiguous memory buffers used to share data between software processes and dynamically-reconfigured hardware accelerators. The second custom kernel module manages the device reconfiguration in an optimized way with respect to the Xilinx&rsquo;s stock driver.

User space
^^^^^^^^^^^^

The FRED server initiates the FPGA support during the initialization phase and then manages requests coming from Linux processes and threads. Internally, the FRED server uses I/O multiplexing to monitor all hardware and software component events from a single event loop. The FRED server communicates with the software processes through a Unix domain socket using a simple messaging protocol. From a user perspective, the interactions between the software process and the FRED server are abstracted by a client support library, which is available in C and Python.

*Reference*:

  - M. Pagani, A. Balsini, A. Biondi, M. Marinoni, and G. Buttazzo, *"A Linux-based Support for Developing Real-Time Applications on Heterogeneous Platforms with Dynamic FPGA Reconfiguration"*, Proc. of the 30th IEEE Int. System-on-Chip Conference (SOCC 2017), Munich, Germany, September 5-8, 2017.