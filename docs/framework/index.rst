.. _intro:

===================
The FRED Framework
===================

.. image:: ../images/fred-schema.png
    :width: 600px
    :align: center
    :alt: FRED schema

FRED is a *framework* to support the design, development, and execution of *predictable software* on FPGA system-on-chips. It exploits *dynamic partial reconfiguration* and recurrent execution to *virtualize* the FPGA fabric, enabling the user to allocate a larger number of hardware accelerators than could otherwise be fit into the physical fabric. It integrates automated *floorplanning* and a set of *runtime mechanisms* to enhance *predictability* by scheduling hardware resources and regulating bus/memory contention.

The following set of tools and mechanisms are available:

- FLORA: a floorplanner that optimizes the allocation of hardware accelerators on the FPGA fabric.

- `FRED runtime <../runtime>`_: a Linux support (exposed via both C and Python API) for managing hardware acceleration requests executing on a virtualized FPGA fabric with predictable response times.

- `FRED analizer <../analizer>`_: a schedulability analysis tool that verifies whether a set of real-time tasks and hardware accelerators can be executed within their timing constraints, taking into account all the sources of delays introduced by the architecture.

- Predictable bus manager: a bus control unit that allows achieving predictable arbitration, protection from timing attacks, and bandwidth isolation to shield the system from misbehaving accelerators.

- Bus synthetizer: an automatic synthesis tool that optimizes the Interconnect hierarchy to match timing constraints.

- A Preemptive reconfiguration port has also been implemented to reduce blocking times in high priority tasks caused by conflicting reconfiguration requests.

Programming model
-----------------

The FRED framework targets system-on-chips that include both general-purpose processors and an FPGA fabric, sharing a common memory.
The framework manages two kinds of computational activities:

- *software tasks* (SW-tasks), which are computational activities running on the processors; and
- *hardware tasks* (HW-tasks), which are hardware accelerators that can be programmed to execute on the FPGA fabric.

.. image:: ../images/model.png
    :width: 600px
    :align: center
    :alt: FRED programming model


The interaction between SW-tasks and HW-tasks is illustrated in the above figure. SW-tasks can request the execution of HW-tasks to accelerate specific computations. These acceleration requests are managed by the FRED framework to ensure that they are served with a predictable and bounded delay. A shared-memory communication paradigm with blocking synchronization is employed between SW-tasks and HW-tasks. Before requesting an acceleration, a SW-task must fill a buffer with the input data to be processed by the HW-task. The execution of the SW-task is then suspended when the acceleration request is issued. Once the corresponding HW-task will be programmed on the FPGA, it will autonomously access the shared memory to (*i*) retrieve the input data and (*ii*) store the output data it produces. Finally, once the acceleration request is completed, the SW-task is resumed and can access the output data produced by the HW-task in the shared memory.

SW-tasks are scheduled by the operating system that controls the processors. To ensure predictability in scheduling SW-tasks, FRED mandates the use of partitioned fixed-priority scheduling (each SW-task is statically allocated to a processor and assigned of a static priority).

Conversely, the acceleration requests are directly managed by the `FRED runtime <../runtime>`_ with a custom scheduling policy.
