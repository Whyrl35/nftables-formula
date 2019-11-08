
# -*- coding: utf-8 -*-
# vim: ft=sls

{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import nftables with context %}

nftables-package-install-pkg-installed:
  pkg.installed:
    - name: {{ nftables.package }}
