# -*- coding: utf-8 -*-
# vim: ft=sls

{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import nftables with context %}

nftables-service-stop:
  service.dead:
    - name: {{ nftables.service.name }}

nftables-config-erase:
  file.absent:
    - name: {{ nftables.config }}
    - require:
      - service: nftables-service-stop

nftables-pkg-remove:
  pkg.purged:
    - name: {{ nftables.package }}
    - require:
      - file: nftables-config-erase

