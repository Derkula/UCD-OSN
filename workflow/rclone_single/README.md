
<h3> Description </h3>

These are the files for submitting a single job to OSG for the sake of processing UMN data sourced from the public s3 bucket

Public bucket information: https://github.com/nsdf-fabric/nsdf-slac


Included are the definition file for building the container cdms3.0, and the submit files for the OSG condor platform.

The cdms3.0 singularity container is built with 
 - rclone to access UMN data from the public s3 bucket. 
 - CDMSbats software
 - ROOT

This version of the container is already located in the OSDF shared public directory.

The workflow works in this order:
-  sourcing and utilizing the cdms3.0 container within the OSDF directory.
- The environmental variables are prone to change based on individual use and setupt, but and are supplied in the "env.sh" file for this job.
- As the job is running, the submit file will run "test.sh"
- in this, the container will use rclone to access the public s3 bucket and pull the "07180811_2320_F0008" data set. It will then process this data with BatNoise and BatRoot.
- The files will then be transfered out to the OSDF Data directory, NOT the shared OSDF public directory.

More details about each component can be found in their respective folders.

<h3>How to Use</h3>
Clone this repository, and scp tranfer the rclone_single folder into your OSG access point

```bash
scp rclone_single username@apxx.uc.osg-htc.org:/~/.../to_desired_directory
```


Log into the the OSG access node

```bash
ssh username@apxx.uc.htc-osg.org
```

Enter your security key, and navigate to the new rclone_single directory

<b>IMPORTANT:</b>

Before submitting the job, update the submit file to source your own directories. Failing to do so will result in an error when transfering the data files out of the condor environment.

Declaring the proccess number organizes the outputs of the job

Edit the following lines as needed:

```bash
Process = 001

OSDF_DATA = osdf:///ospool/ap21/data/username
```

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
cd /ospool/ap21/data/username

ls
```

