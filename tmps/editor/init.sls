{% from "tmps/editor/map.jinja" import editor with context %}

{% if grains['os_family'] in ['Debian', 'RedHat'] %}

{{editor.package}}:
  pkg.installed

{{ editor.vimrc_location}}:
  file.managed:
    - source: {{ editor.vimrc_file }}
    - user: root
    - group: root
    - mode: 644

{% endif %}

{% if grains['os_family'] == 'RedHat' %}
'/etc/vimrc':
  file.blockreplace:
    - marker_start: '" START: Source a global configuration file if available'
    - marker_end: '" END: Source a global configuration file if available'
    - content: |
        if filereadable("/etc/vimrc.local")
          source /etc/vimrc.local
        endif
    - backup: .orig
    - append_if_not_found: True
{% endif %}