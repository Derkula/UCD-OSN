## Run multiple UMN data sets

The contents of this directory is everything needed to submit a single job that processes multiple UMN data sets to the OSG.

By default, this job will access the [public s3 bucket](https://github.com/nsdf-fabric/nsdf-slac), and perform BatNosie and Batroot processing for the data:

- 07180811_2320_F0002
- 07180811_2320_F0003
- 07180811_2320_F0004

When submitted, the job will access the cdms3.0 singularity container, copy data sets from the bucket into the default condor scratch directory, process the data, then transfer the data out to your OSDF data directory.

<b>NOTE:</b> 
- The purpose of this job is to test and gain familiarity with running multiple UMN data sets on the OSG
- The current setup will skip processing F0001 for any data sets.
- The current setup will not be able to process F0010 for any data sets.
- You may review examples of a succesfull submission in the error, logs, and output folders.

<h3> Container </h3>

This Job will use the container [cdms3.0](https://github.com/Derkula/UCD-OSN/tree/main/containers/cdms3.0), which is already available in the shared public OSDF directory. Addional details:
 - Built with ROOT, cdmsbats, rclone
 - Environmental variables are setup using env3.sh


<h3> How to Use </h3>

Clone this repository, and scp transfer the mult_run folder into your OSG access point. You will not be logged into the access point for this.

```bash
scp -r mult_run USERNAME@ap21.uc.osg-htc.org:home/USERNAME/path/to/directory/
```

Log into your OSG access node

```bash
ssh USERNAME@ap21.uc.osg-htc.org
```

Enter your security key and navigate to the new mult_run directory

When you are ready to submit the job:

```bash
condor_submit mult.submit
```

Check the job status with:

```bash
condor_q

OR 

condor_watch_q

```

After the job is complete you can review the details by reviewing the error, log, and outputs.
By default, these files will be generated and named based on the job's cluster ID, and the number of designated processes.

Ensure the files were sucesfully transferred into your OSDF data directory

```bash
cd $DATA

ls
```
<h3>Editing Job Paramaters</h3>

The setup is hard coded to run the data sets:

- 07180811_2320_F0002
- 07180811_2320_F0003
- 07180811_2320_F0004

You may change the input data by editing the appropriate commands. 

First, edit <b>mult.submit</b>. 

Change the data sets in the folowing lines to match the target data sets

```bash

# Replace the data series with the desired series
transfer_output_files   = umn_Filter_07180811_2320.root, umn_07180811_2320_F000$(NewProcess).root

transfer_output_remaps  = "umn_Filter_07180811_2320.root = $(OSDF_DATA)/outputs/noise/07180811_2320_F000$(NewProcess)/umn_Filter_07180811_2320.root; umn_07180811_2320_F000$(NewProcess).root = $(OSDF_DATA)/outputs/raw/umn_07180811_2320_F000$(NewProcess).root"

# Increase the queue value to increase the number of jobs, Maximum is 7
queue 3
```

Then edit the following lines in  <b>test.sh</b> in a similar fashion 

```bash

# Replace the data series with the desired series
rclone --no-check-certificate copy slac_public:utah/supercdms-data/CDMS/UMN/R68/Raw/07180811_2320/07180811_2320_F000$1.mid.gz .

BatNoise 07180811_2320 $1 5000 processingUMNData.HV100mm_HV1.midas configUMNData.iZIP100mm

BatRoot 07180811_2320 $1 5000 processingUMNData.HV100mm_HV1.midas configUMNData.iZIP100mm


```