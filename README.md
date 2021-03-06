Accidental DBA Tutorial Files
=============================

Version 0.7.  Updated for pgConfSV.

This repository contains files for the Accidental DBA tutorial.
These files are required to perform the hands-on exercises.
Importantly, there is significant setup required in order to
do the hands-on exercises which needs to happen _before_ the
tutorial starts, so please read the below.

**All steps through Docker pull/Vagrant Up should be completed before
getting to the tutorial**

Requirements
=============

Laptop Harware:

* running Linux, OSX, or Windows XP or later
* 64-bit (32-bit may be possible, see below)
* at least 1GB of RAM, 2GB or more preferred
* 300MB free disk space

Software and Wetware:

* terminal program capable of ssh
* familiarity with the bash/linux command line
* familiarity with one or more command-line text editors

Installing the Base Software
----------------------------

You have two choices in installing software: Docker and Vagrant.

Docker is preferred: it's more lightweight, more modern, and
is useful for things beyond testing.  However, installing it
and using it requires a laptop with a fairly current OS.

Whichever you choose, go with the appropriate section.

Installing Docker
=================

Using Docker requires:

* A Linux laptop, with Linux kernel 3.8 or later
* Package docker-engine installed running version 1.7 or later

OR:

* A windows or Mac laptop running the Docker Toolbox or Kitematic

[Docker Toolbox](https://www.docker.com/toolbox) is available from Docker. 
We are not able to provide detailed instructions or assistance on configuring
Docker Toolbox on Windows or Mac.  The Toolbox page, however, has an excellent
tutorial.

If installing on Linux, follow the instructions [on the Docker site](http://docs.docker.com/v1.8/installation/)
to get a more current version of Docker.

If you are unable to get Docker working, or are simply more comfortable 
with Vagrant, then please see the Vagrant instructions after
you have installed the tutorial exercises.

Docker: Installing the Image
----------------------------

It is important that you download the Docker image before getting to the
conference, as conference wifi may not be adequate for this.  So do:

    docker pull jberkus/accidentaldba:latest
    
When this is done, the image will be installed on your laptop.  Test it:

    docker run --rm -it jberkus/accidentaldba:latest

Installing Vagrant
==================

First, you will need to install Vagrant and VirtualBox if you do not
already have them.  If you do already have them, please make sure that
you have at least these minimum versions:

* Vagrant 1.6 or later
* VirtualBox 4.2 or later

Otherwise, you're going to need to install them.  Fortunately, both have
downloads for most OSes and extensive documentation.  And when you get
used to them, you'll find Vagrant an invaluable tool for testing.

Vagrant Installation:

* https://docs.vagrantup.com/v2/installation/
* https://docs.vagrantup.com/v2/getting-started/

VirtualBox Installation:

* https://www.virtualbox.org/wiki/Downloads
* https://www.virtualbox.org/wiki/End-user_documentation

Vagrant: Installing the Virtual Machine Image
---------------------------------------------

Once you've installed Vagrant and VirtualBox, you'll need to get an
operating system image, or "box".  Please download one of the following
large files:

If you have a 64-bit laptop: http://files.vagrantup.com/precise64.box

If you have a 32-bit laptop: http://files.vagrantup.com/precise32.box

Then run the following command from the folder where you downloaded it:

* 64-bit: vagrant box add precise precise64.box
* 32-bit: vagrant box add precise precise32.box

Vagrant Up
----------

The first time you do vagrant up, it will require an internet connection
with significant bandwidth and around 1/2 hour.  As such, you should do
it at home, before you get to the conference or the tutorial.

Open your terminal program. Navigate to accidentalDBA/vagrant directory.
Type the following:

    vagrant up

This will launch the "precise" box install a bunch of software on
it, and start it up.  You will see a few trasitory errors during this process,
most of them having to do with "not a tty".  You can ignore these.  However,
if you see a solid block of red consisting of 4 or more lines, this
means that something has gone wrong in bringing it up.

Verify that you can log into it with:

    vagrant ssh

Now log out with "exit".  Shut down the VM, but leave it set up in preparation
for the tutorial:

    vagrant suspend

Vagrant: 32-Bit Machines
------------------------

The exercises have not been tested on a 32-bit VM.  However, they are expected to work.
If it does not work on a 32-bit machine, please contact josh@pgexperts.com.

According to one attendee, pgbadger does not install on the 32-bit version. 
pgbadger is only used in one exercise.

Installing Tutorial Exercises
=============================

Install the tutorial exercises on your machine one of two
ways:

**Preferred Method**: Git Checkout from the Github repo. The
repository is here: https://github.com/pgexperts/accidentalDBA,
and you can clone it by:

    git clone https://github.com/pgexperts/accidentalDBA.git

**Alternate Method**: if you're not comfortable with git, download
the tarball from:

    https://dl.dropboxusercontent.com/u/5132935/accidentalDBA.tgz

This will require the programs "tar" and "gzip" to expand, as follows:

    tar -p -xvf accidentalDBA.tgz

I apologize for not providing a "zip" formatted archive, but zip does not
preserve file permissions, which would cause issues.

The accidentalDBA directory should be placed somewhere you have at least 200MB of disk
space available.

Other Files In This Package
===========================

The AccidentalDBA package also contains the following files in the Tutorial directory:

* accidental_dba.odt = Libreoffice presentation files
* accidental_dba.pdf = PDF presentation files
* exercises.txt = text file of exercises for the hands-on portion

Changelog
=========

**Version 0.7** removed PostGIS.  Added Docker support.  Added PITR restore
exercise and pg_stat_statements.

**Version 0.6**: added PostGIS related content for FOSS4G, including PostGIS
example database.  Changed how to handle 32 vs 64 bit.  

**Version 0.5**: reverted to Ubuntu Precise because of issues with Trusty and
Vagrant 1.4.  This will require starting the tutorial over from scratch for users
who already started the Trusty version.  Fixed permissions issues encountered
while running the tutorial.

**Version 0.4**: upgraded to PostgreSQL 9.3 and Ubuntu Trusty.

**Version 0.3**: version used for Evergreen Conference

**Version 0.2**: Version used for OSCON 2013

License
=======

The Accidental DBA tutorial is Copyright 2013-2015 PostgreSQL Experts Inc.
and Josh Berkus.

All slides, text, instructions and similar content in this tutorial are
licensed [Creative Commons Attribution-ShareAlike 3.0]
(http://creativecommons.org/licenses/by-sa/3.0/us/)

Code exercises and sample databases are licensed under the 
[Gnu Public License Version 2]
(http://www.gnu.org/licenses/gpl-2.0.html)

All other rights reserved.





