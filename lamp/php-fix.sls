# Adding ppa key to prevent PGP not found error
install_ppa_key:
  cmd.script:
    - source: salt://lamp/files/php/ondrej_sury-key-install.sh
