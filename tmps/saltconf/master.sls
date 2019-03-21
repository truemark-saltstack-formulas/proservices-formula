{% from "tmps/saltconf/map.jinja" import saltconf with context %}

'{{ saltconf.master.config_dir }}/log_level.conf':
  file.managed:
    - source: salt://tmps/saltconf/files/log_level.conf.jinja
    - user: root
    - group: root
    - mode: 0644
    - template: jinja
    - onlyif: ls {{ saltconf.master.config_dir }}
    - context:
        log_level: {{ saltconf.master.log_level }}

Restart Salt Master:
  cmd.run:
    - name: 'salt-call service.restart salt-master'
    - bg: True
    - onchanges:
      - '{{ saltconf.master.config_dir }}/log_level.conf'
