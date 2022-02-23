
=========
FRED Docs
=========

.. image:: ./docs/images/fred-frame-2.png
    :width: 400px
    :align: center
    :alt: FRED workflow figure

FRED is a framework to support the design, development, and execution of *predictable* software on **FPGA** system-on-chips platforms.

It exploits **dynamic partial reconfiguration** and recurrent execution to virtualize the FPGA fabric, enabling the user to allocate a larger number of hardware accelerators than could otherwise be fit into the physical fabric. It integrates *automated floorplanning* and a set of *runtime mechanisms* to enhance predictability by scheduling hardware resources and regulating bus/memory contention.

The project is in developed at the `Real-Time Systems Laboratory (RETIS Lab) <https://retis.santannapisa.it/>`_ of the `Scuola Superiore Sant’Anna <https://www.santannapisa.it/en>`_ of Pisa.

.. toctree::
   :maxdepth: 2
   
   docs/framework/index
   docs/dpr-design/index
   docs/case-studies/index
   docs/analyzer/index
   docs/runtime/index   
   docs/bus-manager/index
   docs/getting-started/index
   docs/roadmap/index
   docs/publications/index
   docs/about/index


Papers
------

If you are using FRED and/or its software on your research projects, please cite our papers:
	
.. code-block:: none

    @inproceedings{biondi2016framework,
    title={A framework for supporting real-time applications on dynamic reconfigurable FPGAs},
    author={Biondi, Alessandro and Balsini, Alessio and Pagani, Marco and Rossi, Enrico and Marinoni, Mauro and Buttazzo, Giorgio},
    booktitle={IEEE Real-Time Systems Symposium (RTSS)},
    pages={1--12},
    year={2016},
    organization={IEEE}
    }

.. code-block:: none

    @article{fred-linux,
    title = {A Linux-based support for developing real-time applications on heterogeneous platforms with dynamic FPGA reconfiguration},
    journal = {Future Generation Computer Systems},
    volume = {129},
    pages = {125-140},
    year = {2022},
    issn = {0167-739X},
    doi = {https://doi.org/10.1016/j.future.2021.11.007},
    url = {https://www.sciencedirect.com/science/article/pii/S0167739X21004362},
    author = {Marco Pagani and Alessandro Biondi and Mauro Marinoni and Lorenzo Molinari and Giuseppe Lipari and Giorgio Buttazzo},
    keywords = {Heterogeneous computing, FPGA, DPR, Real-time, Linux}
    }


If you are using DART, please cite:

.. code-block:: none

    @inproceedings{seyoum2021automating,
    title={Automating the design flow under dynamic partial reconfiguration for hardware-software co-design in FPGA SoC},
    author={Seyoum, Biruk and Pagani, Marco and Biondi, Alessandro and Buttazzo, Giorgio},
    booktitle={ACM Symposium on Applied Computing (SAC)},
    pages={481--490},
    year={2021}
    }


License
--------

FRED/DART and its software are protected under the GPLv2_ License:

.. _GPLv2: https://opensource.org/licenses/GPL-2.0

Feedback
--------

Don't hesitate to ask about additional info or the next guides, and also if you find some mistakes, please let us know. Issues and push requests can be done on github_.

.. _github: http://github.com/fred-framework

