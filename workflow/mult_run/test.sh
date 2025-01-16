#!/bin/bash

# Useful job details
printf "Start time: "; /bin/date
printf "Job is running on node: "; /bin/hostname
printf "Job running as user: "; /usr/bin/id
printf "Job is running in directory: "; /bin/pwd
printf "Job number is: "; echo $1
echo SCRATCH DIR
echo $_CONDOR_SCRATCH_DIR

# Sourcing envirnmental variables for this job
source env3.sh

# Inform user which data set is being pulled from s3 bucket
# $1 will correspond to the submit file queue number
printf "Loading Dataset: 07180811_2320_F000" echo $1

# Access the s3 bucket and copy the data set to the condor scratch directory
rclone --no-check-certificate copy slac_public:utah/supercdms-data/CDMS/UMN/R68/Raw/07180811_2320/07180811_2320_F000$1.mid.gz .

printf COPIED FROM BUCKET

# Verify target data set was copied
#ls$_CONDOR_SCARTCH_DIR

echo running Data $salted

BatNoise 07180811_2320 $1 5000 processingUMNData.HV100mm_HV1.midas configUMNData.iZIP100mm

#mv $BATROOT_NOISEFILES/umn_Filter_07180909_2316.root $_CONDOR_SCRATCH_DIR
BatRoot 07180811_2320 $1 5000 processingUMNData.HV100mm_HV1.midas configUMNData.iZIP100mm

echo Done writing output
echo $BATROOT_RQDATA
ls $BATROOT_RQDATA


sleep 5
echo end script
