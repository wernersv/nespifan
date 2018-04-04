#! /bin/sh
start() {
	PID=$(pgrep -f "python .*fancontrol")
	if [ "$PID" != "" ]; then echo "laeuft schon"; exit 0;fi
	cd /root 
	/root/fancontrol &
	echo $! > /var/run/fancontrol.pid
}

stop() {
	pkill -f "python .*fancontrol" 2>/dev/null
	rm /var/run/fancontrol.pid 2>/dev/null
}

case $1 in
  start|stop) "$1" ;;
esac

