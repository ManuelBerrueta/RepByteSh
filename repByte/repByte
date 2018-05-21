#!/bin/bash
: '
This utility allows you to replace a byte or multiple bytes in consecutive order
'

title="repByte"
version="v.01"
myName="Manuel Berrueta"
description="Utility to replace a given number of bytes with input hex values provided by user"
numOfBytes=""
byteInput=""
repByteStart=""
counter=0
wholeInt="Enter whole integer values only"
fileName=""
hexX="\x"
#Use this line to save to a temp file
#bytesPrior=$( mktemp ) #Used to make a temp file
#Use this line to save to the variable
bytesPrior=0
startPoint=0

echo "$title $version"
echo "by $myName"
echo ""
echo $description
echo ""

#Start of script
read -p "Enter file name you would like to modify:> " fileName

read -p "How many consecutive bytes would you like to replace :> " numOfBytes
#Check for correct values
while [[ ! "$numOfBytes" =~ ^[0-9]+$ ]]; do
    echo
    echo $wholeInt
    read -p "How many bytes would you like you replace :> " numOfBytes
done

read -p "Enter byte replacement starting point:> " repByteStart
while [[ ! "$numOfBytes" =~ ^[0-9]+$ ]]; do
    echo
    echo $wholeInt 
    read -p "Enter byte replacement starting point:> " repByteStart 
done

startPoint=$repByteStart

#Will show the bytes in hex that will be modified
echo "The following bytes will be modified:\n"
#Use this line if you would like to saved output to a temp file
#xxd -s $repByteStart -l $numOfBytes $fileName | tee ${bytesPrior}
#Use this line if you would like to save to a variable
bytesPrior=$(xxd -s $repByteStart -l $numOfBytes $fileName)

#Replace bytes
echo "$numOfBytes bytes to will be replaced"
while (( ++counter <= numOfBytes )); do
    read -p "Enter hex value for '$counter' replacement:> " byteInput
    echo "Replaced 'code of' with $byteInput..."
    echo -ne "\\x$byteInput" | dd conv=notrunc seek=$repByteStart bs=1 count=1 of=$fileName
    let repByteStart++
done

echo "Modified $fileName file"
echo "Prior to modification:"
#Use this line if you chose to use the temp file
#cat ${bytesPrior}
#Use this line if you chose to use the variable
echo $bytesPrior
echo "After modificaiton:"
xxd -s $startPoint -l $numOfBytes $fileName