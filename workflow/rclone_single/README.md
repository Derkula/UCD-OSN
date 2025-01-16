
<h3> Description </h3>

The contents of this directory is everything needed to submit a single job to process single UMN data sets to the OSG.

By default, this job will access the [public s3 bucket](https://github.com/nsdf-fabric/nsdf-slac), and perform BatNosie and Batroot processing for the data:

- 07180811_2320_F0008


The workflow works in this order:
-  sourcing and utilizing the cdms3.0 container within the OSDF directory.
- The environmental variables are prone to change based on individual use and setupt, but and are supplied in the <b>env3.sh</b> file for this job.
- As the job is running, the submit file will run <b>test.sh</b>
- in this, the container will use rclone to access the public s3 bucket and pull the "07180811_2320_F0008" data set. It will then process this data with BatNoise and BatRoot.
- The files will then be transfered out to the OSDF Data directory, NOT the shared OSDF public directory.


<b>NOTE: </b>

- The purpose of this job is to test and gain familiarity with running a single UMN data set on the OSG
- The Current setup is hard coded to run this specific data set 
- Examples of successful and unsuccessful runs can be found in the error, log and output folders
- Runs 3 and 4 are examples of successful jobs

<h3>Container</h3>

This job will use the container [cdms3.0](https://github.com/Derkula/UCD-OSN/tree/main/containers/cdms3.0), which is already available in the shared public OSDF directory. Additional details:

 - Built with ROOT, cdmsbats, rclone 
 - Environmental variables are setup using env3.sh



More details about each component can be found in their respective folders.

<h3> How to Use </h3>
Clone this repository, and scp transfer the rclone_single folder into your OSG access point

```bash
scp -r rclone_single USERNAME@ap21.uc.osg-htc.org:/home/USERNAME/path/to/directory/
```


Log into the OSG access node

```bash
ssh USERNAME@ap21.uc.osg-htc.org
```

Enter your security key, and navigate to the new rclone_single directory

When you are ready to submit the job:

```bash
condor_submit rclone_single.submit
```

Check the job status with:

```bash
condor_q

OR

condor_watch_q
```

After the job is complete, you can review the details by reading the error, log, and outputs.

Ensure the files were sucessfully transfered into your OSDF data directory:

```bash
cd $DATA

ls
```

