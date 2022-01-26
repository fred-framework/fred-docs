.. _reconfiguration:

==========================
Preemtive Reconfiguration
==========================

The state-of-the-art in the reconfiguration process only allows performing a single reconfiguration at a time in a sequential fashion. This limitation could lead to scheduling problems affecting the whole system performance. To overcome this limitation, a **preemptable reconfiguration process** has been implemented on top of the state-of-the-art reconfiguration interface, thus making reconfiguration times more predictable and more suitable for a real-time analysis.

The new interface is able to manage multiple reconfiguration requests with different priorities, so allowing to suspend the reconfiguration of a slot in favor of a configuration request with higher priority. The suspended reconfiguration can then be resumed later, when the high-priority one has been served, continuing from the point at which it was suspended. This feature is exposed at the user level with an API that is automatically integrated during the system design process.

*Reference*:

  - E. Rossi, M. Damschen, L. Bauer, G. Buttazzo, J. Henkel, *"Preemption of the Partial Reconfiguration Process to Enable Real-Time Computing with FPGAs"*, ACM Transactions on Reconfigurable Technology and Systems, Vol. 11, Issue 2, pp. 10:1-10:24, November 2018.

