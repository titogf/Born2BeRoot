

We have to create a file to add the sudo configuration in /etc/sudoers.d folder. For example

```
/etc/sudoers.d/sudo_rules
```


Authentication using sudo has to be limited to 3 attempts in the event of an incorrect password.
```
Defaults        passwd_tries=3
```
• A custom message of your choice has to be displayed if an error due to a wrong
password occurs when using sudo.
```
Defaults        badpass_message="Error!!!"
```
• Each action using sudo has to be archived, both inputs and outputs. The log file
has to be saved in the /var/log/sudo/ folder.

first of all, we have to create this folder and the file:
```
sudo mkdir /var/log/sudo
sudo touch /var/log/sudo/sudo_logs
```
next, again in /etc/sudoers.d/sudo_config

```
Defaults        logfile="/var/log/sudo/sudo_logs"
Defaults        log_input,log_output
Defaults        iolog_dir="/var/log/sudo"
```


• The TTY mode has to be enabled for security reasons.
```
Defaults        requiretty
```

• For security reasons too, the paths that can be used by sudo must be restricted.
Example:
/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/snap/bin
```
Defaults        secure_path="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/snap/bin"
```
