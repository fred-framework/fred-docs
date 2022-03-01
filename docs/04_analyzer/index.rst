.. _analyzer:

===============
FRED Analyzer
===============

FRED-analyzer is a tool to analyze the timing properties of applications running upon the FRED framework.

The tool offers the following features:

- it provides analytical bounds on the maximum delay that can be experienced by a SW-task when requesting the execution of a hardware accelerator;

- it allows computing an upper-bound on the worst-case response time of a SW-task that requests the execution of hardware accelerators, and runs together with other SW-tasks under preemptive fixed-priority scheduling; and

- it allows bounding the worst-case delay experienced by hardware accelerators when accessing a shared memory through a series of hierarhically-connected bus interconnects (required to bound their worst-case execution times). The analysis can also take into account the presence of the `predictable bus manager <../bus-manager>`_.

The tool is capable of testing different configurations of the system to perform a design space exploration. Specifically, it allows controlling:

- the partitioning of the FPGA fabric and the affinities of the hardware accelerators;

- the priorities and the deadlines of SW-tasks;

- the structure of the bus hierarchy and its connections to hardware accelerators; and

- the configuration of the `predictable bus manager <../bus-manager>`_ (transaction budget, nominal burst size, and maximum number of outstanding transactions).

*Reference*:

  - Biondi, A. Balsini, M. Pagani, E. Rossi, M. Marinoni, and G. Buttazzo, *"A Framework for Supporting Real-Time Applications on Dynamic Reconfigurable FPGAs"*, Proc. of the IEEE Real-Time Systems Symposium (RTSS 2016), Porto, Portugal, Nov. 29 - Dec. 2, 2016.

