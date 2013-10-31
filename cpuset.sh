#!/bin/sh
DIE() { LOG "FAILED : $*"; exit 1; }
LOG() { printf "\n$@\n\n"; }
TRY() { "$@" || DIE "$@"; }


SET_CPU() {
echo -n "Setting CPU freq's"
echo ""
sleep 2
sudo cpufreq-set -c 0 --max 1000000 -g userspace
sudo cpufreq-set -c 1 --max 1000000 -g userspace
}

CASE() {
echo -n "Lower CPU speed to save battery life? [yes or no]: "
read yno
case $yno in
        [yY] | [yY][Ee][Ss] )
                TRY SET_CPU;
		clear;
		sleep 2
		echo "CPU Frequencies set!";
		sleep 2;;
        [nN] | [nN][Oo] )
                TRY CONFIRM;;
        * )        echo "Please answer yes or no"
                    TRY CASE;;
        esac
}

CONFIRM() {
echo -n "Are you sure? [yes or no]: "
read yno
case $yno in
        [yY] | [yY][Ee][Ss] )
                exit 1;;
        [nN] | [nN][Oo] )
                echo "";
                TRY CASE;;
        * )        echo "Confirm exit?";
                TRY CONFIRM
        ;;
        esac
}

EXIT() {
exit;
}

CHECK(){
    [ "$(cat /sys/bus/cpu/devices/cpu1/cpufreq/scaling_max_freq
)" = "1000000" ]
rc=$?
if [ $rc != 0 ] ; then
TRY EXIT
else TRY CASE
fi
}

TRY CHECK
