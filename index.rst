
=========
FRED Docs
=========

About FRED
----------

FRED is a framework to support the design, development, and execution of *predictable* software on **FPGA** system-on-chips platforms.

It exploits **dynamic partial reconfiguration** and recurrent execution to virtualize the FPGA fabric, enabling the user to allocate a larger number of hardware accelerators than could otherwise be fit into the physical fabric. It integrates *automated floorplanning* and a set of *runtime mechanisms* to enhance predictability by scheduling hardware resources and regulating bus/memory contention.

The project is in developed at the Real-Time Systems Laboratory (ReTiS Lab) (retis_), in Scuola Sant'Anna, Pisa, Italy.

.. _retis: https://retis.santannapisa.it/


.. toctree::
   :maxdepth: 2
   
   docs/getting-started/index
   docs/framework/index
   docs/dpr-design/index
   docs/analyzer/index
   docs/runtime/index   
   docs/bus-manager/index
   docs/reconfiguration/index
   docs/publications/index
   docs/about/index


Papers
------

If you are using FRED and/or its software on your research projects, please cite our papers:
	
.. code-block:: none

    @inproceedings{biondi2016framework,
    title={A framework for supporting real-time applications on dynamic reconfigurable FPGAs},
    author={Biondi, Alessandro and Balsini, Alessio and Pagani, Marco and Rossi, Enrico and Marinoni, Mauro and Buttazzo, Giorgio},
    booktitle={2016 IEEE Real-Time Systems Symposium (RTSS)},
    pages={1--12},
    year={2016},
    organization={IEEE}
    }

If you are using DART, please cite:

.. code-block:: none

    @inproceedings{seyoum2021automating,
    title={Automating the design flow under dynamic partial reconfiguration for hardware-software co-design in FPGA SoC},
    author={Seyoum, Biruk and Pagani, Marco and Biondi, Alessandro and Buttazzo, Giorgio},
    booktitle={Proceedings of the 36th Annual ACM Symposium on Applied Computing},
    pages={481--490},
    year={2021}
    }


Disclaimer
----------

FRED/DART and its software are protected under the MIT_ License:

.. _MIT: http://opensource.org/licences/MIT

Feedback
--------

Don't hesitate to ask about additional info or the next guides, and also if you find some mistakes, please let us know. Issues and push requests can be done on github_.

.. _github: http://github.com/fred-framework

