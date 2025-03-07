#!/bin/sh
# 容器启动初始化

# xRDP可能非正常关闭, 需清理pid文件
rm -f /var/run/xrdp.pid
rm -f /var/run/xrdp-sesman.pid
# 启动xRDP服务
/usr/sbin/xrdp
/usr/sbin/xrdp-sesman

# Necesssary for docker
exec "$@"
