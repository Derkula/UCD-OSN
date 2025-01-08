<h3> Submit files </h3>

These are the required files to run a OSG condor job using cdms3.0.sif for a single run.

<h3>rclone_single.submit</h3>

This is the main submit file. In this condor will:
- source and access the cdms3.0 container from the OSDF shared directory
- source the "test.sh" bash script
- - Execute bash commands designated in the test.sh script. These commands can be editted for debugging
- - These commands will be output in the $(Process).output file
- Source and apply the "env3.sh" environmental variables for the container 
- Use rclone to pull data from the public s3 bucket, and process it with BatNoise and BatRoot
- Export processd data to your OSDF data directory


Notes:

 the config file for rclone is defaulted to the config directory for the machine the container was built on. The env.sh will automatically set it to the location built into the container

 The condor platform will pull the data to the $_CONDOR_SCRATCH_DIR , and processed data must exist in the same level to be transfered out.

 You may review previous details about previous runs located in the respective error, logs, and output folders.

 Runs 3 and 4 are example of successful jobs.