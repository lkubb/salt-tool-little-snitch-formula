# -*- coding: utf-8 -*-
# vim: ft=sls

{%- set tplroot = tpldir.split('/')[0] %}
{%- set sls_package_install = tplroot ~ '.package.install' %}
{%- from tplroot ~ "/map.jinja" import mapdata as snitch with context %}

include:
  - {{ sls_package_install }}


{%- if snitch.get('license') %}

Little Snitch is licensed:
  file.managed:
    - name: /Library/Application Support/Objective Development/Little Snitch/registration.xpl
    - contents: |
        {{ snitch.license | indent(8) }}
    - mode: '0644'
    - makedirs: true
    - require:
      - Little Snitch is installed

Little Snitch is reloaded:
  cmd.run:
    - name: |
        killall at.obdev.littlesnitch.daemon
        killall "Little Snitch Agent"
    - onchanges:
      - Little Snitch is licensed
{%- endif %}
