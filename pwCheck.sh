#!/bin/bash

##########################################
#    pwCheck.sh                          #
#    By: n0beard                         #
#                                        #
#  A simple bash script to test the      #
#  strength of passwords with hashcat.   #
#                                        #
#  It takes the password, MD5 hashes it, #
#  then runs the hash against rockyou    #
#  with best64.rule. A simple way to     #
#  identify low hanging fruit for your   #
#  friends and family.                   #
##########################################

clear

### Set directory
cd ~/Desktop/hashcat-4.1.0

### If there are no CLI arguments, as the user for the password to test
if [ $# == 0 ]
then 
   read -sp "Please input a password to test: " answer_clear

   else answer_clear=$1
fi

### Hash the password with MD5 and store it
echo -n $answer_clear | md5sum | tr -d " -" > pwCheck.txt

### Now crack the hash against rockyou with best64
./hashcat64.bin --force --status --status-timer=2 -m 0 -O -r rules/best64.rule pwCheck.txt wordlists/rockyou.txt
