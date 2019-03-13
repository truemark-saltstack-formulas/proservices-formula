{% from "tmps/editor/map.jinja" import editor with context %}
vim:
  pkg.installed

{{ editor.vimrc_location}}:
  file.managed:
    - source: {{ editor.vimrc_file }}
    - user: root
    - group: root
    - mode: 644