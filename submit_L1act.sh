#!/bin/bash

for task in Soc Gam WM Emo; do
  for subj in `cat new_subs.txt`; do
  	for RUN in LR RL; do

  		#Manages the number of jobs and cores
  		SCRIPTNAME=L1_${task}_Act.sh
  		NCORES=5
  		while [ $(ps -ef | grep -v grep | grep $SCRIPTNAME | wc -l) -ge $NCORES ]; do
  	  		sleep 1m
  		done
  		bash $SCRIPTNAME $RUN $subj &
  		sleep 5s

  	done
  done
done
