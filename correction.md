
Sources:
https://1gbits.com/blog/debian-vs-centos/
https://serverfault.com/questions/396079/differences-between-debian-and-centos-from-a-web-server-prospective
https://www.educba.com/centos-vs-debian/
https://en.wikipedia.org/wiki/AppArmor
https://wiki.ubuntu.com/Lvm


## Basic differences between Centos and Debian

### Origin and nature
Debian is a Unix like computer operating system that is made up of open source components, being developed by a group of individuals who have made common cause to create a free operating system. 
CentOS is a distribution from Red Hat Linux. 

### Space of default install
CentOS default install is heavier than Debian?

### Installation ease
Debian is considered easier to install than CentOS

### Architecture
Both support x86_64/AMD64 archs, but they also support different archictetures.

### Package management:
- CentOS: RPM package format. YUM/DNF package manager
- Debian: DEB package format. dpkg/APT package manager.

### "Enterprise" status
It seems like CentOS is more enterprise-status considered than Debian because its compared stability, its large community, its long time support (see release cycle) and its long development and testing cycle. Consequently, the most popular distribution when it comes to server environments.

### Kernel and hardware
CentOS ships with kernel 3.10 or 4.18. Debian support newest hardware and kernel features, by 

### Upgrading and release cycle
- CentOS doesn't support major version upgrades. CentOS major releases typically have a 10-year lifespan. After a major release, CentOS code is frozen and is never changed except for security. This makes some issues while working with it as the next update usually happen after 5 years and many application software changes in this duration. For example, CentOS 5 supports MySQL 5.1 only where as there are newer version of MySQL available which CentOS does not support. 
- Debian typically releases a new major version on a 2 year release cycle with 3 years of full support and an addition 2 years of LTS (Long Term Support) for a 5-year lifespan.
- Debian have more up-do-date packages. On the other hand, CentOS is considered more stable than Debian because its low update frequency. 

### Support
CentOS is supported by Red Hat community.  CentOS commercial support is not provided directly from the CentOS project, but is availlable through 3rd parties, such as OpenLogic.
Debian is primarily community supported, but also a list of consultants is offered

### Web hosting
- If a server is going to be used as a reseller tool, he/she may want to install a tool called cPanel, and in such a case going with CentOS is recommended, as it is officially supported.

### What is LVM
LVM stands for Logical Volume Management. It is a system of managing logical volumes, or filesystems, that is much more advanced and flexible than the traditional method of partitioning a disk into one or more segments and formatting that partition with a filesystem.

*Resizing*
With gparted you can expand and shrink partitions, but only if they are not in use. LVM can expand a partition while it is mounted, if the filesystem used on it also supports that ( like the usual ext3/4 ). When expanding a partition, gparted can only expand it into adjacent free space, but LVM can use free space anywhere in the Volume Group, even on another disk

*Moving Partitions*
LVM can move a partition while it is in use, and will not corrupt your data if it is interrupted. In the event that your system crashes or loses power during the move, you can simply restart it after rebooting and it will finish normally.

*Many Partitions*
With LVM you can create as many Logical Volumes as you wish, and it is usually quite easy since you usually have plenty of free space left. 

*Snapshots*
This is something you simply can not do without LVM. It allows you to freeze an existing Logical Volume in time, at any moment, even while the system is running. 


## Interest of Virtual Machines
https://itsupportguys.com/it-blog/business-benefits-of-virtual-machines-and-virtualization/

## APT vs aptitude
APT is "Advanced Package Tool", package manager.
Aptitude is a front-end or an interface of apt. Makes easier to manage conflicts than APT, to access to information.

## What is AppArmor
Is a linux kernel security module that allows the system administrator to restrict programs' capabilities with per-program profiles.

## Checks
### UFW service is started?
```
sudo ufw status
```

### SSH service is started?
```
sudo systemctl status ssh
```

### Installed OS
```
hostnamectl
```

### Check user with login username is created and belongs to user42 and sudo groups
```
getent group | grep sudo
getent group | grep user42
```

### Check password policies

pwquality: 
```
dpkg -l | grep libpam-pwquality
```

config files:
```
cat /etc/login.defs
sudo cat /etc/pam.d/common-password
```

users:
```
sudo chage -l [username] 
```

### Create a new user
```
sudo adduser [username]
```

### Change hostname, reboot and check if it has changed, then return it to the original one
```
sudo vi /etc/hosts
sudo vi /etc/hostname
```

### View partitions for this virtual machine
```
lsblk
```

### How LVM works and what it is all about. 
```
```

## Sudo

### Check if sudo is installed
```
dpkg -l | grep sudo
```

### Asign the new user to the "sudo" group
```
adduser [username] sudo
```

### Check content of sudo logs, try to run a command via sudo and see if the sudo log has been updated
```
cat /var/log/sudo/whatever
```

```
sudo sudoreplay 00004Q -d /var/log/sudo
```

## UFW
### Check that UFW program is properly installed on the VM and it's working properly. List active rules in UFW. A rule must exist for port 4242.
```
dpkg -l | grep ufw
sudo systemctl status ufw
sudo ufw status
```

### What UFW is and the value of using it.

### Add a new rule to open port 8080
```
sudo ufw allow 8080
```

### Check that this one has been added by listing the active rules.
```
sudo ufw status
```

### Delete the new rule
```
sudo ufw status numbered
sudo ufw delete [number]
```

## SSH
### Check that SSH service is properly installed on the virtual machine
```
dpkg -l | grep ssh
```

### Check that it's working properly and that SSH service only uses port 4242
```
sudo systemctl status ssh
```

### What is SSH and the value of using it. 

### Try to log in with the newly created user

### Try to log in as root. It must fail. 


## Script monitoring
### Explain the operation of its script by displaying its code

### What is cron

### How is the script set up so that it runs every 10 minutes. Check crontab
```
*/10 * * * * 
minute, hour, day(month), month, day(week)
```

### Change the rule to make the script stop running when the server starts up. Reboot and check that all is ok
```
sudo crontab -e
```


