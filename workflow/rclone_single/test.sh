#!/bin/bash

#set -e

# Execution script for cdms3.0 container. 


# Helpful job information
printf "Start time: "; /bin/date
printf "Job is running on node: "; /bin/hostname
printf "Job running as user: "; /usr/bin/id
printf "Job is running in directory: "; /bin/pwd


#Sourcing custom environment variables
source env3.sh 


##### USE FOR DEBUGGING AS NEEDED ######

#echo SCRATCH DIR
#echo $_CONDOR_SCRATCH_DIR

#echo CDMSBATSDIR
#echo $CDMSBATSDIR
#ls $CDMSBATSDIR

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

###########################################

# Access public bucket and pull data.
## Change dataset here to pull different data sets
rclone --no-check-certificate copy slac_public:utah/supercdms-data/CDMS/UMN/R68/Raw/07180811_2320/07180811_2320_F0008.mid.gz .

echo COPIED FROM BUCKET

echo running Data $salted

BatNoise 07180811_2320 8 5000 processingUMNData.HV100mm_HV1.midas configUMNData.iZIP100mm

#echo Noise complete, saved to
#echo $BATROOT_NOISEFILES
#ls $BATROOT_NOISEFILES

#echo $_CONDOR_SCRATCH_DIR
#ls $_CONDOR_SCRATCH_DIR

BatRoot 07180811_2320 8 5000 processingUMNData.HV100mm_HV1.midas configUMNData.iZIP100mm

echo Done writing output
echo $BATROOT_RQDATA
ls $BATROOT_RQDATA


sleep 5
echo end script
