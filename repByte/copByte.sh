#!/bin/bash

title="copByte"
version="v 1.5"
myName="Manuel Berrueta"
description="Utility to which allows you to append selected bytes from source file to a target file"

echo ""
echo "$title $version"
echo "$myName"
echo "$description"
echo ""

targetFile=$1
targetByteLocation=$2
fileToAppend=$3
locationOfAppendingBytes=$4
numOfBytes=$5
outFileName=$6

dd if=$targetFile of=$outFileName bs=1 count=$targetByteLocation status=progress
dd if=$fileToAppend of=$outFileName bs=1 skip=$locationOfAppendingBytes seek=$targetByteLocation count=$numOfBytes status=progress
dd if=$targetFile of=$outFileName bs=1 skip=$targetByteLocation conv=notrunc oflag=append status=progress