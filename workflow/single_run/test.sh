#!/bin/bash

# Job Details
printf "Start time: "; /bin/date
printf "Job is running on node: "; /bin/hostname
printf "Job running as user: "; /usr/bin/id
printf "Job is running in directory: "; /bin/pwd

# DEBUGGING, CHECK FOR PROPER INPUT TRANSFER
#
#echo SCRATCH DIR
#echo $_CONDOR_SCRATCH

#echo CDMSBATSDIR
#echo $CDMSBATSDIR
#ls $CDMSBATSDIR



#echo CURRENT DIRECTORY
#pwd
#ls -lh 

# INITIALIZE ENVIRONMENTAL VARIABLES
source env.sh

# DEBUGGING, CHECK FOR DATA INPUT TRANSFER
#echo CDMSBATS_WORK DIRECTORY


#echo Processing dir
#echo $BATROOT_PROC
#ls $BATROOT_PROC

#echo RAW DATA DIR
#echo $BATROOT_RAWDATA
#ls $BATROOT_RAWDATA

echo running Data $salted

BatNoise 07180909_2316 2 5000 processingUMNData.HV100mm_HV1.midas configUMNData.iZIP100mm

echo Noise complete, saved to
echo $BATROOT_NOISEFILES
ls $BATROOT_NOISEFILES

#echo $_CONDOR_SCRATCH_DIR
#ls $_CONDOR_SCRATCH_DIR

#mv $BATROOT_NOISEFILES/umn_Filter_07180909_2316.root $_CONDOR_SCRATCH_DIR
#BatRoot $salted 2 5000 processingUMNData.HV100mm_HV1.midas configUMNData.iZIP100mm

#echo Done writing output
#echo $BATROOT_RQDATA
#ls $BATROOT_RQDATA


sleep 5
echo end script
