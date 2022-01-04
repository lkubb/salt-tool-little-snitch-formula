{%- set snitch = salt['pillar.get']('tool:snitch', {}) -%}

include:
  - .package

{%- if snitch.get('license') %}
Little Snitch is licensed:
  file.managed:
    - name: /Library/Application Support/Objective Development/Little Snitch/registration.xpl
    - contents: |
        {{ snitch.license | indent(8) }}
    - mode: '0644'
    - makedirs: True
    - require:
      - Little Snitch is installed
{%- endif %}
