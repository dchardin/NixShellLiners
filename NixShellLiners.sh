

##This is a list of useful linux commands, oneliners, and simple                
##scripts and loops                                                             
                                                                                
##I need to compile this list from these sources:                               
## MostUsefulLinuxOneliners, fedora desktop bash history, morebashhistory.txt,  
## old server bashhistory, newRHCstudy, clippings, 



#=============================================================================== 
#-------------------------------------------------------------------------------
# AWKING_SEDDING_CUTTING_ETC
#------------------------------------------------------------------------------- 
#===============================================================================



#-------------------------------------------------------------------------------
# Outputting characters from a text file one at a time
#-------------------------------------------------------------------------------


#!/bin/bash
expect -c 'set send_human {.01 .02 5 .005 .005}; 
spawn -noecho cat /home/donnie/iamtext; 
interact -indices -o -re ".+" { send_user -h -- "$interact_out(0,string)" }'




#-------------------------------------------------------------------------------
#command replaces a given line with a different one within a particular file
#-------------------------------------------------------------------------------

 
sed -i -e's/ldap01.util.phx2.redhat.com/ldap.corp.redhat.com/' /usr/bin/linfo


#-------------------------------------------------------------------------------
## forgot what I used these for
#-------------------------------------------------------------------------------



for i in `ps aux | awk '{ print $2 }'`; do `grep -q 'nss\|nspr'\ 
/proc/$i/maps 2>/dev/null` && ps -p $i -o comm=; done | sort | uniq

lsof | grep 'libnss3\|libnspr' | awk '{print $1}' | sort | uniq

lsof -p 6560,6561 | grep /var/log | awk '{ print $9 }' | sort | uniq -c

cat donnie_freenode_#fedora-meeting_20151012.log | awk '$3 != "Quits:" && \
$3 != "Joins:" { print $0 }' >> OCT12MEET

#=============================================================================== 
#-------------------------------------------------------------------------------
# General batch processing
#-------------------------------------------------------------------------------  
#===============================================================================

#-------------------------------------------------------------------------------
# use libreoffice cli to bulk convert .ppt's into .pdf's
#-------------------------------------------------------------------------------


libreoffice --headless --invisible --convert-to pdf *.ppt


#=============================================================================== 
#-------------------------------------------------------------------------------
# GIT_and_GITHUB
#-------------------------------------------------------------------------------  
#===============================================================================
 


git config --global user.name "dchardin"
git config --global user.email "emailaddresshere"
git init

git remote add origin https://github.com/dchardin/nameofmyrepohere.git
git ls-tree --full-tree HEAD

git add filenamehere

git commit -m 'noteshere'

git push origin master 

git pull origin master


#-------------------------------------------------------------------------------
# Shows what branch you are on, and the state.
#-------------------------------------------------------------------------------

git status

#-------------------------------------------------------------------------------
# Showes some things about recent changes
#
# it will say 'up-to-date` but that can be misleading; use `git pull` habitually
#-------------------------------------------------------------------------------

git log

#-------------------------------------------------------------------------------
# Create a branch
#
# a feature branch is created to work on a specific feature, 
# and stops getting used when the feature is complete; 
#
# a release branch is more persistent and used to store project state 
# for a given release (f23, f22, etc for us)
#
#-------------------------------------------------------------------------------
  
git branch $BRANCH_NAME

#-------------------------------------------------------------------------------
# To show remote branches:
#-------------------------------------------------------------------------------
  
git branch -r

#-------------------------------------------------------------------------------
# Show local branches
#-------------------------------------------------------------------------------

git branch

#-------------------------------------------------------------------------------
# Show all branches
#-------------------------------------------------------------------------------

git branch -a
 

#===============================================================================
#-------------------------------------------------------------------------------
# INTERNET_TOOLS
#-------------------------------------------------------------------------------
#===============================================================================
  



#-------------------------------------------------------------------------------
# wget from a password protected website and download all the .jpg files
#-------------------------------------------------------------------------------
  

wget --user donnie --password passwdgoeshere --no-parent -r -l1 -A.jpg \
http://75.whateverurl/whatever/folderwith.jpgs


                                                                                
#-------------------------------------------------------------------------------
# SCP to pull directory from remote computer via ssh port
#-------------------------------------------------------------------------------
                                                                                
scp -r -P 1234 user@ipaddress:/path/to/dir/dir_itself /localpc/dirtoholddir/

#-------------------------------------------------------------------------------
# SCP to push a file to a remote computer users home directory
#-------------------------------------------------------------------------------
  
scp -P 2222 localfile.ext username@domain:~/



#-------------------------------------------------------------------------------
# FINDING_THINGS
#-------------------------------------------------------------------------------
  
du -a | sort -n -r

// find term in any document

find . | xargs grep <term>


#===============================================================================
#-------------------------------------------------------------------------------
# Archives
#-------------------------------------------------------------------------------
#===============================================================================
  


#-------------------------------------------------------------------------------
tar in some files
#-------------------------------------------------------------------------------
  
tar -cvf namefortarfile filenametobetarred

#-------------------------------------------------------------------------------
# tar xvf multiple files:
#-------------------------------------------------------------------------------
  
for file in 'ls *.tar.bz2' ; do tar xvf $file; done


#===============================================================================
#-------------------------------------------------------------------------------
# PERMISSIONS-and-FILES
#-------------------------------------------------------------------------------
#===============================================================================


#-------------------------------------------------------------------------------
# who is waiting on a file?
#-------------------------------------------------------------------------------

egrep -ri 'f:ew|f:w|f:aw'


#-------------------------------------------------------------------------------
# Check only one filesystem every 30 minutes for file sizes
#-------------------------------------------------------------------------------

*/30 *  *  *  *  du -xah | sort -h -r > /tmp/`date +%d-%m-%y@%H:%M`.du.out


#===============================================================================
#-------------------------------------------------------------------------------
# PACKAGE_MANAGEMENT
#-------------------------------------------------------------------------------
#===============================================================================
  

#-------------------------------------------------------------------------------
# Installs every Package from RHN
#-------------------------------------------------------------------------------

yum install `yum list | awk '{print $1}' | sort -n | uniq`


#-------------------------------------------------------------------------------
CHECKING FOR INSTALLED PACKAGES
#-------------------------------------------------------------------------------

rpm -qa | grep packagename(i.e. firefox)



#===============================================================================
#-------------------------------------------------------------------------------
# STORAGE_AND_DISK
#-------------------------------------------------------------------------------
#===============================================================================


#-------------------------------------------------------------------------------
# interactive multipath mode
#-------------------------------------------------------------------------------

multipathd -l" switch|switchgroup map|multipath $map group $group



#------------------------------------------------------------------------------- 
DISK DRIVE INFO
#-------------------------------------------------------------------------------


fdisk -l | grep Disk

udisks --show-info
udisks --show-info /dev/sda/
udisks --show-info /dev/sda/size
udisks


#===============================================================================
#-------------------------------------------------------------------------------
# VNC
#-------------------------------------------------------------------------------
#===============================================================================


vncviewer -via root@kcraven.usersys.redhat.com :1
vncviewer -via root@dashboard :1
vncviewer -via root@asathe :1
vncviewer -via root@dashboard :1


#===============================================================================
#-------------------------------------------------------------------------------
# LOGFILES-and-LOG-MATTERS
#-------------------------------------------------------------------------------
#===============================================================================
 
#-------------------------------------------------------------------------------
#  Strip out log file messages.1 to remove any line with segfault in it
#-------------------------------------------------------------------------------

cat messages.1 | grep -v segfault |less > messages.1_clean




----------------------------TSHARK-------------------------------

# filter tshark

tshark -r <pcap> -R <filter>

#determine delta times

tshark -t -dd -r <pcap>

# Determine if nobody is being sent from server@domain name:

tshark -nlr tcpdump.pcap -R "nfs.fattr4_owner == \"nobody@ih.lucent.com"\"

tshark -nlr tcpdump.pcap -R "nfs.fattr4_owner_group == \"nobody@ih.lucent.com"\"

# Find errors in tcpdump for NFS

tshark -tad -r 00723239-slcetl22-ioerror-201210192008.pcap -R '(nfs.procedure_v4) && (nfs.status != 0)'



---------------------SECURITY-----------------------------------


IMPORTING .PUB GPG KEYS

gpg --import ~/it-passwords/keyids/*.pub


gp_vim-gnupg


KERBEROS STUFF

klist
kdestroy
klist
keyids/


LDAP

ldapsearch -ZZ -x -D "uid=${USERNAME},ou=users,dc=redhat,dc=com" -h
ldap.corp.redhat.com -b 'ou=servicegroups,dc=redhat,dc=com' -s sub -W
"(cn=helpdeskroacces)"
  

  ldapsearch -ZZ -x -D "uid=${USERNAME},ou=users,dc=redhat,dc=com" -h
  ldap.corp.redhat.com -b 'ou=servicegroups,dc=redhat,dc=com' -s sub
  -W "(cn=helpdeskroaccess)"

  ldapsearch -x -LLL -h ldaps://209.132.183.113 -p 636 -b
  uid=tholton,ou=users,dc=redhat,dc=com

  A=({dhardin sjames btisdale}) B=({TASK8111 TASK5555}) C=({dev
  it-devs}) for (( I = 0; I < 26; ++I )); do

  A=({dhardin sjames btisdale}) B=({TASK8111 TASK5555}) C=({dev
  it-devs}) 
  for (( I = 0; I < 26; ++I )); do echo "rham_group_modify
  --user=${A[I]} --ticket=${B[I]} --group=${C[I]}"; done

  A=(dhardin sjames btisdale) B=(TASK8111 TASK5555 TASK85648) C=(dev
  it-devs stringdevs)
  for (( I = 0; I < 2; ++I )); do echo "rham_group_modify
  --user=${A[I]} --ticket=${B[I]} --group=${C[I]}"; done

  for (( I = 0; I < 3; ++I )); do echo "rham_group_modify
  --user=${A[I]} --ticket=${B[I]} --group=${C[I]}"; done

  A=(wwu pvomacka yanywang asaleh asaleh apetrova apetrova nfinkels
  aramund
  o) B=(TASK0095453 TASK0092341 TASK0092366 TASK0092366 TASK0093068
  TASK0093068 TASK0089421) C=(support ecsgit openshift-qe jbossqa
  jbossqe-mobile ecsgit devel phx2rit sales-eze)
  for (( I = 0; I < 9; ++I )); do echo "rham_group_modify
  --user=${A[I]} --ticket=${B[I]} --group=${C[I]}"; done

  A=(wwu pvomacka yanywang asaleh asaleh apetrova apetrova nfinkels
  aramundo) B=(TASK0095453 TASK0092341 TASK0092366 TASK0097508
  TASK0097508 TASK0093068 TASK0093068 TASK0100253 TASK0089421)
  C=(support ecsgit openshift-qe jbossqa jbossqe-mobile ecsgit devel
  phx2rit sales-eze)
  for (( I = 0; I < 9; ++I )); do echo "rham_group_modify
  --user=${A[I]} --ticket=${B[I]} --group=${C[I]}"; done

  A=(pvomacka yanywang asaleh asaleh apetrova apetrova nfinkels
  aramundo) B=(TASK0092341 TASK0092366 TASK0097508 TASK0097508
  TASK0093068 TASK0093068 TASK0100253 TASK0089421) C=(ecsgit
  openshift-qe jbossqa jbossqe-mobile ecsgit devel phx2rit sales-eze)
  for (( I = 0; I < 8; ++I )); do echo "rham_group_modify
  --user=${A[I]} --ticket=${B[I]} --group=${C[I]}"; done


--------------------BUILDING_A_PACKAGE_FROM_SOURCE---------------------

su -
mkdir -p ~/rpmbuild/{BUILD,RPMS,SOURCES,SPECS,SRPMS}
cd rpmbuild/
ls
  763  echo '%_topdir %(echo $HOME)/rpmbuild' > ~/.rpmmacros
    764  su -
      765  su -
        766  ls
          767  cd ..
            768  ls
              769  cd Desktop/
                770  ls
                  771  mv autokey-0.71.3-4.fc14.src.rpm
                  /home/dhardin/rpmbuild/RPMS/
                    772  cd /home/dhardin/rpmbuild/
                      773  ls
                        774  cd RPMS/
                          775  ls
                            776  rpmbuild --rebuild
                            autokey-0.71.3-4.fc14.src.rpm
                              777  ls
                                778  cd noarch/
                                  780  yum -y localinstall
                                  autokey-0.71.3-4.el6.noarch.rpm


-------------------MISC---------------------------


FORGOT WHAT THIS ONE DOES, MAYBE CHECKING FOR LAST KERNEL UPDATE?

rpm --last -q kernel{,-xen,-PAE}


// Log fsck
fsck -v -p /dev/device 2>&1 > /tmp/fscklog.out

// dumpe2fs with backup superblock
# dumpe2fs -o superblock=<superblock> blocksize=<blocksize> /dev/device


// Make additional loop nodes
# mknod -m660 /dev/loop# b 7 #

// Run stat call on all files in a directory except for certain
// sub-directory:
# find . -type d \( ! -name <directory> -prune \) | xargs stat | grep 'File:' 

// Commands fail over NFS -- Get the outputs of:
a) strace -T -tt -f -v -q -s 4096 -o /tmp/strace.out COMMAND
b) tcpdump -n -s 0 -i INTERFACE -w OUTPUTFILE host NFS-SERVER-IP -w /tmp/tcpdump.pcap


// Run tcpdump with date/time/seconds in buffers 
tcpdump -s0 -i ethX -W 3 -C 100MB -w /tmp/tcpdump-(`date +%F_%T:%S`)

// Printers
BrowsePoll cupserverfqdngoeshere


// HBA port state
cat /sys/class/fc_host/host4/port_state

// connect to a windows virt client with spice

spicec -h ipofmachine -p 5905

// Satellite version

rhn-schema-version

//clear free memory

echo > 3 /proc/sys/vm/drop_cache

// sxconsole:

sxconsole 450040 -R 450040

makes a directory in default location called 45000 then scans
recursively for reports in a directory called 450040


// repack initrd
# find ./ | cpio -H newc -o > /boot/new-initrd.cpio
# cd /boot
# ls -arlt
# gzip new-initrd.cpio 
# cp initrd.version.img initrd.version.img.backup
# mv new-initrd.cpio.gz initrd.version.img
# so you start by going to your working directory that contains
the unpacked initrd then go from there





## here is a useful bulk mp3 renaming script that helps when order
## matters. Here is what it does.

## Original     Becomes
## 1.mp3        0001.mp3
## 02.mp3       0002.mp3
## 123.mp3      0123.mp3
## 00000.mp3    00000.mp3
## 1.23.mp3     1.23.mp3

rename 'unless (/0+[0-9]{4}.mp3/) {s/^([0-9]{1,3}\.mp3)$/000$1/g;s/0*([0-9]{4}\..*)/$1/}' *

-----------------

# This one i used to go into each folder (each of which were named 1 ,
# 2, 3, and so on), echo out the name of the folder that it was
# currently in, and cat out the contents of any files inside of the
# folder whose names begin with "Acq" and to only echo out lines that
# have the string 19313 in them

for i in {1..1600}; do cd ~/mnt2/SleepAdult_Archive9/$i; echo $i; cat Acq* | grep 19313; done

-----------------

for dir in ~/mnt/6TB/DATA/MUSICFILES/MUSIC-FAVS/*; do (find -type f -not -regex '.*\.\(mp3\|m4a\|mp4\|ogg\)'| less ); done

-----------------






