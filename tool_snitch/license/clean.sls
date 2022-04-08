# -*- coding: utf-8 -*-
# vim: ft=sls

{#- Get the `tplroot` from `tpldir` #}
{%- set tplroot = tpldir.split('/')[0] %}
{%- set sls_package_install = tplroot ~ '.package.install' %}
{%- from tplroot ~ "/map.jinja" import mapdata as snitch with context %}

include:
  - {{ sls_package_install }}


{%- if snitch.get('license') %}

Little Snitch is not licensed:
  file.absent:
    - name: /Library/Application Support/Objective Development/Little Snitch/registration.xpl

Little Snitch is reloaded:
  cmd.run:
    - name: |
        killall at.obdev.littlesnitch.daemon
        killall "Little Snitch Agent"
    - onchanges:
      - Little Snitch is not licensed
{%- endif %}
