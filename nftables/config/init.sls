# -*- coding: utf-8 -*-
# vim: ft=sls

{%- set tplroot = tpldir.split('/')[0] %}
{%- set sls_package = tplroot ~ '.package' %}
{%- from tplroot ~ "/map.jinja" import nftables with context %}

include:
  - {{ sls_package }}

nftables-config-file-file-managed:
  file.managed:
    - name: {{ nftables.config }}
    - mode: 644
    - user: root
    - group: root
    - template: jinja
    - source: salt://nftables/config/config.jinja
    - require:
      - sls: {{ sls_package }}



# TODO: cmd.run load le fichier avec nft ou module.run avec require
