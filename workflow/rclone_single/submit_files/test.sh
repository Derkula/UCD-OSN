#!/bin/bash

#set -e


#CURRENT FOR RUN 1, AWS PULL WITHIN CONTAINER
# USING CDMS4.0.sif 



printf "Start time: "; /bin/date
printf "Job is running on node: "; /bin/hostname
printf "Job running as user: "; /usr/bin/id
printf "Job is running in directory: "; /bin/pwd

echo SCRATCH DIR
echo $_CONDOR_SCRATCH_DIR

#echo CDMSBATSDIR
#echo $CDMSBATSDIR
#ls $CDMSBATSDIR

source env3.sh

#echo CURRENT DIRECTORY
#pwd
#ls -lh 

#echo CDMSBATS_WORK DIRECTORY
#ls -lh cdmsbats_work

#echo Processing dir
#echo $BATROOT_PROC
#ls $BATROOT_PROC

#echo RAW DATA DIR
#echo $BATROOT_RAWDATA
#ls $BATROOT_RAWDATA


## IMPORT DATA FROM S3 BUCKET

#RCLONE_CONFIG=/.config/rclone/rlone.conf

#export RCLONE_CONFIG

#rclone --no-check-certificate copy slac_public:utah/supercdms-data/CDMS/UMN/R68/Raw/07180811_2320/07180811_2320_F0008.mid.gz .

echo COPIED FROM BUCKET

ls$_CONDOR_SCARTCH_DIR

echo running Data $salted

BatNoise 07180811_2320 8 5000 processingUMNData.HV100mm_HV1.midas configUMNData.iZIP100mm

echo Noise complete, saved to
echo $BATROOT_NOISEFILES
ls $BATROOT_NOISEFILES

#echo $_CONDOR_SCRATCH_DIR
#ls $_CONDOR_SCRATCH_DIR

#mv $BATROOT_NOISEFILES/umn_Filter_07180909_2316.root $_CONDOR_SCRATCH_DIR
BatRoot 07180811_2320 8 5000 processingUMNData.HV100mm_HV1.midas configUMNData.iZIP100mm

echo Done writing output
echo $BATROOT_RQDATA
ls $BATROOT_RQDATA


sleep 5
echo end script
