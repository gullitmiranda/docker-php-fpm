#!/usr/bin/env sh

cd $(dirname $0)

# Update php configuration.

sed -i \
  -e 's/group =.*/group = root/' \
  -e 's/user =.*/user = root/' \
  -e 's/listen\.owner.*/listen\.owner = root/' \
  -e 's/listen\.group.*/listen\.group = root/' \
  -e 's/;listen\.allowed_clients.*/listen\.allowed_clients = 0.0.0.0/' \
  -e 's/error_log =.*/error_log = \/dev\/stdout/' \
  -e 's/;clear_env = no/clear_env = no/g' \
  /etc/php5/fpm/pool.d/www.conf

sed -i \
  -e '/open_basedir =/s/^/\;/' \
  /etc/php5/fpm/php.ini
