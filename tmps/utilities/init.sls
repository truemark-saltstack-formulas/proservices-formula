{% from "tmps/utilities/map.jinja" import utilities with context %}

{% if grains['os_family'] in ['Debian', 'RedHat'] %}

tmps.utilities:
  pkg.installed:
    - pkgs:
        - htop
        - tmux
        - screen
        - {{ utilities.dig }}

{% endif %}