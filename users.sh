#!/bin/bash

function userCheck()
{
	RESULT=`getent passwd $1`
	uid=`echo $RESULT | awk -F: '{print $3}'`
	shell=`echo $RESULT | awk -F: '{print $7}'`
	echo -e  "O usuario $1 existe em ${2}\n O UID e ${uid}\n A Shell do Usuario ${shell}\n" >> .anexo-$2.txt
}

function main()
{
	clear
	DATA=`date +%F`
	> .anexo-$DATA.txt
	USERS=`getent passwd | awk -F: '$3 >= 1000 {print $1}' | grep -v nobody`
	
	for USER in  "${USERS[@]}" ; do
		#userCheck $USER $DATA
		RESULT=`getent passwd $USER`
		uid=`echo $RESULT | awk -F: '{print $3}'`
		shell=`echo $RESULT | awk -F: '{print $7}'`
		echo -e  "O usuario $USER existe em ${DATA}\n O UID e ${uid}\n A Shell do Usuario ${shell}\n" >> .anexo-$DATA.txt
	
	done
}

main

