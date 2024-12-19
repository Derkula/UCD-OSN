# Run a single cdmsbats job

The files in this directory are all of the files needed to submit one job to the HTC-Condor node

Everything else needed to run this job exists on the OSG.

to use these files, scp transfer them into your home directory on an OSPool access point
You will not be logged into the access point to do this 

```
scp 'filename.sh' u'sername'@ap21.uc.osg-htc.org:/home/'username'/single_run/
```

The container and data set is found on the shared OSDF location
```
/ospool/uc-shared/public/UCDenver_Roberts
```


This job is hard coded to run BatNoise with the following setup:

Container: [cdmsbats2.0.sif](https://github.com/Derkula/UCD-OSN-/blob/main/Containers.md)

Processing File: processingUMNData.HV100mm_HV1.midas

Config File: configUMNData.iZIP100mm

Data set: 7180909_2316
 - Specifically: 07180909_2316_F0002.mid.gz



## Details

### single.submit

<b> Container related things </b>

 Using cdms2.0.sif here, since transferring files from an external source in not necessary
 
 The Container itself is found on the shared OSDF location

```
universe = vanilla
Requirements    = HAS_SINGULARITY == TRUE
+SingularityImage = "osdf:///ospool/uc-shared/public/UCDenver_Roberts/container/cdms2.0.sif"

```

<b> Sourcing Files </b>

Transfer in the env.sh to setup the environment for cdmsbats.
 - Setup will be performed with job.sh execution

Also transfer in the cdms_work directory from the shared OSDF location.
- The environment setup for cdmsbats will source the data from here

```
OSDF_LOCATION = osdf:///ospool/uc-shared/public/UCDenver_Roberts
transfer_input_files    = env.sh, $(OSDF_LOCATION)/cdmsbats_work?recursive


```

<b>Transfer completed data out </b>

Identify which processed data sets will need to be staged for transferring back to the OSDF data location

Also Identify the directory of the OSDF data location. (Transferring to the shared directory does not work)

NOTE: the OSDF_DATA location will need to point to YOUR username, and IS NOT set for this.

```
OSDF_DATA = osdf:///ospool/ap21/data/'username'

transfer_output_files   = umn_Filter_07180909_2316.root
transfer_output_remaps  = "umn_Filter_07180909_2316.root = $(OSDF_DATA)/outputs/umn_Filter_07180909_2316.root"

```

### job.sh

The job.sh will directly impact how output log files will look. 
Un-comment the debug lines as needed to get more details for the work process. 

After sourcing the environment for cdmsbats from env.sh, Running BatNoise and BatRoot is possible for the following data sets that are already uploaded to the public OSDF directory:

07180909_2316

07180808_1558

```
BatNoise 07180909_2316 2 5000 processingUMNData.HV100mm_HV1.midas configUMNData.iZIP100mm
```

### env.sh

the following are tailored for running jobs on OSG
 - BATROOT_RAWDATA is set to source data from the cdmsbats_work folder that was transferred in from the public OSDF directory (occurs within the .submit file).
 
 - BATROOT_NOISEFILES & BATROOT_RQDATA sends processed data to the scratch directory condor builds to run this job. Any files that need to be transferred out of the condor job will need to be located here.
	 - If these environment locations are set elsewhere, the .submit file will need to account for this for condor to find the transfer output files.

```
export BATROOT_RAWDATA=cdmsbats_work/raw/mid-gz/07180909_2316
export BATROOT_NOISEFILES=$_CONDOR_SCRATCH_DIR
export BATROOT_RQDATA=$_CONDOR_SCRATCH_DIR

```