{% if pillar['mysql'] is defined and pillar['mysql'] %}
/root/.my.cnf:
  file:
    - managed
    - source: salt://lamp/files/mysql/root-my.cnf
    - user: root
    - group: root
    - mode: 0600
    - template: jinja

{% if pillar['monit'] is defined and pillar['monit'] %}
include:
    - monit

/etc/monit/conf.d/mysql:
  file:
    - managed
    - source: salt://lamp/files/mysql/etc/monit/conf.d/mysql
    - user: root
    - group: root
    - mode: 0444

mysql_monit_restart:
  service:
    - name: monit
    - running
    - enable: True
    - restart: True
    - require:
      - file: /etc/monit/conf.d/mysql
    - watch:
      - file: /etc/monit/conf.d/mysql
{% endif %}


{% endif %}
