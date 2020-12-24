#!/bin/bash
#

soft_install(){
	sambaPath=$(which samba)
	sambaStr="/usr/sbin/samba"
	if [ "${sambaPath}" = "${sambaStr}" ]
	then
		echo "samba isntalled"
	else
		echo "samba installing..."
		sudo apt-get install samba
	fi

	smbclientPath=$(which smbclient)
	smbclientStr="/usr/bin/smbclient"
	if [ "${sambaPath}" = "${sambaStr}" ]
	then
		echo "smbclient isntalled"
	else
		echo "smbclient installing..."
		sudo apt-get install smbclient
	fi
	#sudo apt-get install samba
	#sudo apt-get install smbclient
}


soft_install
if test -e /etc/samba/smb.conf.back1
then
	echo "/etc/samba/smb.conf.back1 exist"
else
	echo "smb.conf backup"
	sudo cp /etc/samba/smb.conf /etc/samba/smb.conf.back1
fi

sudo cp ./smb.conf /etc/samba/smb.conf
sudo /etc/init.d/samba restart
echo "input user:"
read user
sudo smbpasswd -a ${user}

#echo ${password}
#${password}
