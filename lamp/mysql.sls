include:
    - monit

mysql-server:
  pkg:
    - installed
    - pkgs:
      - mysql-server
      - python-mysqldb
  service:
    - running
    - name: mysql
    - enable: True
    - require:
      - pkg: mysql-server
    - watch:
      - file: /etc/mysql/my.cnf
  mysql_user:
    - present
    - name: root
    - password: {{ pillar['mysql']['pass']['root'] }}
    - require:
      - service: mysql

/root/.my.cnf:
  file:
    - managed
    - source: salt://sfym/files/mysql/root-my.cnf
    - user: root
    - group: root
    - mode: 0600
    - template: jinja


/etc/monit/conf.d/mysql:
  file:
    - managed
    - source: salt://sfym/files/mysql/etc/monit/conf.d/mysql
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
