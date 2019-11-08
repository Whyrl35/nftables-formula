# -*- coding: utf-8 -*-
# vim: ft=sls

{%- set tplroot = tpldir.split('/')[0] %}
{%- set sls_config_file = tplroot ~ '.config' %}
{%- from tplroot ~ "/map.jinja" import nftables with context %}

include:
  - {{ sls_config_file }}

nftables-service-running:
  service.running:
    - name: {{ nftables.service.name }}
    - enable: {{ nftables.service.enable }}
    - require:
      - sls: {{ sls_config_file }}
    - watch:
      - file: {{ nftables.config }}
