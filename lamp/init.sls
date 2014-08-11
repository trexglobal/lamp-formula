# Require:
#  https://github.com/trexglobal/apache-formula
#  https://github.com/trexglobal/php-formula
#  https://github.com/trexglobal/mysql-formula

include:
    - apache
    - apache.rewrite
    - mysql.server
    - .mysql
    - php
    - php.mysql
