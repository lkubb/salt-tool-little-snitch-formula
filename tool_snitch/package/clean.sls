# vim: ft=sls

{#-
    Removes the Little Snitch package.
#}

{%- set tplroot = tpldir.split("/")[0] %}
{%- set sls_config_clean = tplroot ~ ".config.clean" %}
{%- from tplroot ~ "/map.jinja" import mapdata as snitch with context %}

include:
  - {{ sls_config_clean }}


Little Snitch is removed:
  pkg.removed:
    - name: {{ snitch.lookup.pkg.name }}
    - require:
      - sls: {{ sls_config_clean }}
