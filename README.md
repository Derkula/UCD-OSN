# UCD-OSG

Always refer to the [OSPool Documentation](https://portal.osg-htc.org/documentation/)

<h3> Description </h3>

The contents of this repository include the files needed to submit jobs for the sake of proccessing UMN on the OSG computing platform. 

If you are not familiar with accessing the OSG check this link to create an account and get set up: https://portal.osg-htc.org/documentation/overview/account_setup/registration-and-login/

To utilize the cdms software, we use containers built with ROOT and cdmsbats that are already available on the shared OSDF public directory. The Majority of jobs will be run using the container version [cdms3.0](https://github.com/Derkula/UCD-OSN/tree/main/containers/cdms3.0), as this one is built with rclone to access s3 buckets.

An example of the kind of jobs being run for UMN data is the [Single Rclone Job](https://github.com/Derkula/UCD-OSN/tree/main/workflow/rclone_single). 
This is a job that will access the public s3 bucket, [nsdf-slac](https://github.com/nsdf-fabric/nsdf-slac), and proccess targeted data sets from that.

The next version of this to process [multiple jobs](https://github.com/Derkula/UCD-OSN/tree/main/workflow/mult_run) of a single data set is avialable, and the next version to process multiple data sets is in works.



