================
nftables-formula
================

A salt formula that installs and configures the nftables services. It currently supports Debian/Ubuntu.
This project is motivated by the Debian's decision to migrate from iptables to nftables.
There are some missing functionnalies in the nftables state of saltstack (create/delete table and chain, create set, ...)
Config file content (where needed) is stored in pillar (see pillar.example).

nftables
========

Install and run the nftables service

.. note

In *Debian* from *Buster* nftables will become the standard, and so the installation process is not needed.

Available states
================

.. contents::
    :local:

``nftables.package``
--------------------

This state will install the nftable package only.

``nftables.config``
-------------------

This state will configure the service parameters and has a dependency on the `nftables.install` via include list.

``nftables.service``
--------------------

This state will start the nftables service and has a dependency on `nftables.config` via include list.


``nftables.clean``
------------------

This sate will undo everything and clean the service, configuration, installation.

Sample Pillar
=============

See the `pillar.example <pillar.example>`_ for a documented pillar file.

Contributions
=============

Contributions are always welcome. The main development guidelines include:

* write clean code
* set sane default settings
* test your code
* update README.rst doc

Testing
=======

Testing on Debian 9/10
