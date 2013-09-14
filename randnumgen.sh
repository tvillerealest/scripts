#/bin/bash

DIE() { LOG "FAILED : $*"; exit 1; }
LOG() { printf "\n$@\n\n"; }
TRY() { "$@" || DIE "$@"; }


clear

echo "And for my next trick..."
echo ""
echo ""
echo ""
echo ""
echo ""

sleep 5


echo "Let's generate some numbers!!!!"


sleep 2
echo ""
echo ""
echo ""


NUM() {
echo "Generating..."
sleep 4
export genvalue="$(cat /dev/random | od -An -N2 -i | tr - '0-9')"
echo "Your generated value is: $genvalue"
}


CASE() {
echo -n "Do you want to run this again? [yes or no]: "
read yno
case $yno in
        [yY] | [yY][Ee][Ss] )
                TRY NUM;
		TRY CASE
		;;
        [nN] | [nN][Oo] )
                exit 1
		;;

        * )	echo "Please answer yes or no"
            	TRY CASE;;
	esac
}


TRY NUM
TRY CASE

echo "you exited"




