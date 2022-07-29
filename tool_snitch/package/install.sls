# -*- coding: utf-8 -*-
# vim: ft=sls

{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import mapdata as snitch with context %}


Little Snitch is installed:
  pkg.installed:
    - name: {{ snitch.lookup.pkg.name }}

Little Snitch setup is completed:
  test.nop:
    - name: Hooray, Little Snitch setup has finished.
    - require:
      - pkg: {{ snitch.lookup.pkg.name }}
