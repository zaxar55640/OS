#!/bin/bash
res=1
modee="+"
echo $$ > .pid
TERM() {
echo "QUIT"
exit 0
}
usr1(){
mode="+"
}
usr2(){
mode="*"
}
trap 'TERM' SIGTERM
trap 'usr1' USR1
trap 'usr2' USR2
while true; do
case "$mode" in
"+")
res=$(($res+2))
;;
"*")
res=$(($res*2))
;;
esac
echo $res
sleep 7
done
