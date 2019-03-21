{% from "tmps/saltconf/map.jinja" import saltconf with context %}

'{{ saltconf.minion.config_dir }}/log_level.conf':
  file.managed:
    - source: salt://tmps/saltconf/files/log_level.conf.jinja
    - user: root
    - group: root
    - mode: 0644
    - template: jinja
    - onlyif: ls {{ saltconf.minion.config_dir }}
    - context:
        log_level: {{ saltconf.minion.log_level }}

Restart Salt Minion:
  cmd.run:
    - name: 'salt-call service.restart salt-minion'
    - bg: True
    - onchanges:
      - '{{ saltconf.minion.config_dir }}/log_level.conf'
