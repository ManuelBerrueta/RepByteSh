#!/bin/bash

: '
To copy bytes from a file use:
dd skip=$startPointInBytes count=$numBytesToCopy if=$inFile of=$outFile iflag=skip_bytes,count_bytes
'

title="appByte"
version="v.01"
myName="Manuel Berrueta"
description="Utility to append bytes from source file to target file"
targetFile=$1
inputFile=$2

echo $title
echo  "by $myName"
echo $description

#Start with appending at the beginning, then possibly end, then at given location
read -p "Enter target file :> " targetFile
read -p "Enter source file to append at the end of target file :> " inputFile
dd if=$inputFile of=$targetFile oflag=append conv=notrunc