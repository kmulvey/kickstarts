# Install, not upgrade
install

# Install from a friendly mirror and add updates
url --url=http://fedora.mirror.lstn.net/releases/19/Fedora/x86_64/os/
repo --name=updates

version=DEVEL
# System authorization information
auth --enableshadow --passalgo=sha512

# Run the Setup Agent on first boot
firstboot --enable
ignoredisk --only-use=vda

# Keyboard layouts
keyboard --vckeymap=us --xlayouts='us'

# System language
lang en_US.UTF-8

# Network information
network  --bootproto=dhcp --device=eth0 --ipv6=auto --activate
network  --hostname=deepthought

# Root password
rootpw querty

# CIS 4.7
firewall --enabled --ssh
services --enabled network,sshd

# SELinux
selinux --enforcing

# System services
services --enabled="chronyd"

# System timezone
timezone America/New_York --isUtc

# X Window System configuration information
xconfig  --startxonboot

# System bootloader configuration
bootloader --location=mbr --boot-drive=vda
autopart --encrypted --type=lvm

# Partition clearing information
clearpart --none --initlabel
part / --fstype=ext4 --grow --size=1024 --asprimary
part swap --size=2048

# packages
@core
@KDE Plasma Workspaces
chrony
setroubleshoot-server
aide # CIS 1.3.2
selinux-policy-targeted # CIS 1.4.3
-setroublsehoot # CIS 1.4.4
-mcstrans # CIS 1.4.5
-telnet-server # CIS 2.1.1
-telnet # CIS 2.1.2
-rsh-server # CIS 2.1.3
-rsh # CIS 2.1.4
-ypbind # CIS 2.1.5
-ypserv # CIS 2.1.6
-tftp # CIS 2.1.7
-tftp-server # CIS 2.1.8
-talk-server # CIS 2.1.10
-xinetd # CIS 2.1.11
-@"X Window System" # CIS 3.2
-dhcp # CIS 3.5
ntp # CIS 3.6
man
man-pages
postfix # CIS 3.16
puppet
rsyslog # CIS 5.1.2
cronie-anacron # CIS 6.1.1
pam_passwdqc # CIS 6.3.3
vim
yum-plugin-fastestmirror
yum-presto
yum-updatesd

%post --log=/root/postinstall.log

%end
