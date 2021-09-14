#!/bin/bash

chown -R nginx /var/log/nginx/ &

# 啟動 crontab
/usr/sbin/crond -f &

nginx -g 'daemon off;'
