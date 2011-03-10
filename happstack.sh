#!/bin/sh
#
# Install:
#
# chmod a+x happstack.sh
# sudo cp happstack.sh /etc/init.d/happstack
# sudo update-rc.d happstack defaults
#
# Uninstall:
#
# sudo rm /etc/rc*/happstack
# sudo rm /etc/init.d/happstack

HAPPSTACK_DIR=/srv/d_hactar/usr/src/doeshappstackwork

case "$1" in
  start)
    echo "Starting Happstack..."
    $HAPPSTACK_DIR/doeshappstackwork.hs > /dev/null 2>&1 &
    ;;
  stop)
    echo "Stopping Happstack..."
    killall runghc
    killall ghc
    ;;
  restart)
    echo "Restarting Happstack..."
    killall runghc
    killall ghc
    $HAPPSTACK_DIR/doeshappstackwork.hs > /dev/null 2>&1 &
    ;;
  *)
    echo "Usage: $0 start|stop|restart"
    exit 1
    ;;
esac

exit 0
