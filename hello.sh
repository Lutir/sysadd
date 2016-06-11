#!/bin/sh
mkdir task1
cd task1
for i in $(seq 1 100)
do
	FILE_NAME="file$i"
	echo $FILE_NAME
	dd if=/dev/urandom of=$FILE_NAME bs=10000 count=1
	truncate -s 8 $FILE_NAME
	timestamp=$(date +%y%m%d%k%M)
	echo $timestamp
	REDUCE=0000020000
	DATED="$timestamp-$REDUCE"
	DATED1=`echo $DATED | bc`
	echo $DATED1
	touch -t $DATED1 $FILE_NAME
	chmod 444 $FILE_NAME	
done

# yr-mon-date-hr-min
