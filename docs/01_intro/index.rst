.. _intro:

===================
The FRED Framework
===================


FRED is a *framework* to support the design, development, and execution of *predictable software* on FPGA system-on-chips that include both general-purpose processors and an FPGA fabric, sharing a common memory. It exploits *dynamic partial reconfiguration* and recurrent execution to *virtualize* the FPGA fabric, enabling the user to allocate a larger number of hardware accelerators than could otherwise be fit into the physical fabric. It integrates automated *floorplanning* and a set of *runtime mechanisms* to enhance *predictability* by scheduling hardware resources and regulating bus/memory contention.

.. _fred_schema_fig:

.. figure:: ../images/fred-schema.png
    :width: 500px
    :align: center
    :alt: FRED schema

    FRED framework schema

The :ref:`fred_schema_fig` illustrates the overall architectural schema of FRED framework. 
The following set of tools are currently available:

- :ref:`dart`: a floorplanner that optimizes the allocation of hardware accelerators on the FPGA fabric and generated optimized partial bitstreams for dynamic partial reconfiguration;

- :ref:`runtime`: a Linux service for managing hardware acceleration requests executing on a virtualized FPGA fabric with predictable response times.

The :ref:`fred_schema_fig` also describes other parts of the FRED framework still under development. Please refer to the `Reseach Roadmap <../09_roadmap>`_.: 

- :ref:`analyzer`: a schedulability analysis tool that verifies whether a set of real-time tasks and hardware accelerators can be executed within their timing constraints, taking into account all the sources of delays introduced by the architecture.
  
- :ref:`busmanag`: a bus control unit that allows achieving predictable arbitration, protection from timing attacks, and bandwidth isolation to shield the system from misbehaving accelerators. This block is acompained by an automatic synthesis tool that optimizes the interconnect hierarchy to match timing constraints. 

- :ref:`bussyn`: **TODO**

The FRED framework manages two kinds of computational tasks:

- *software tasks* (SW-tasks), which are computational activities running on the processors; and
- *hardware tasks* (HW-tasks), which are hardware accelerators that can be programmed to execute on the FPGA fabric.

.. _fred_programming_fig:

.. figure:: ../images/model.png
    :width: 600px
    :align: center
    :alt: FRED programming model

    FRED programming model

The interaction between SW-tasks and HW-tasks is illustrated in the :ref:`fred_programming_fig` figure. SW-tasks can request the execution of HW-tasks to accelerate specific computations. In desgin time, the set of HW-tasks used by the application(s) is synthesized, mapped and floorplanned by :ref:`dart`, such that their corresponding bitstreams are managed in runtime by :ref:`runtime`. In runtime, the SW-tasks issue acceleration requests managed by the :ref:`runtime` to ensure that they are served with a predictable and bounded delay. A shared-memory communication paradigm with blocking synchronization is employed between SW-tasks and HW-tasks. Before requesting an acceleration, a SW-task must fill a buffer with the input data to be processed by the HW-task. The execution of the SW-task is then suspended when the acceleration request is issued. Next, the corresponding HW-task is programmed on the FPGA. The HW-task autonomously accesses the shared memory to retrieve the input data and to store the output data is produced. Finally, once the acceleration request is completed, the SW-task is resumed and can access the output data produced by the HW-task in the shared memory.

SW-tasks are scheduled by the operating system that controls the processors. To ensure predictability in scheduling SW-tasks, FRED mandates the use of partitioned fixed-priority scheduling (each SW-task is statically allocated to a processor and assigned of a static priority).
