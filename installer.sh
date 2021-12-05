#!/bin/sh 
##########
####command=wget https://raw.githubusercontent.com/emil237/neoboot/main/installer.sh -O - | /bin/sh
###
###########################################
##### remove old version ##### 
opkg remove enigma2-plugin-extensions-SatVenusPanel
rm -rf /usr/lib/enigma2/python/Plugins/Extensions/NeoBoot
set -e 
cd /tmp 
echo ' remove preview files '
rm -rf * > /dev/null 2>&1
echo "download plugins "
wget "https://raw.githubusercontent.com/emil237/neoboot/main/neoboot_9.32_all.ipk" 

###########################################
 echo " install plugin "
opkg update
opkg install curl
curl -kLs
opkg install --force-reinstall neoboot_9.32_all.ipk
###########################################
set +e 
cd ..
rm -f /tmp/neoboot_9.32_all.ipk
###########################################
Cel="/usr/lib/enigma2/python/Plugins/Extensions"
cd $Cel/NeoBoot
chmod 755 ./bin/*
chmod 755 ./ex_init.py
chmod 755 ./files/*.sh
chmod -R +x ./ubi_reader_arm/*
chmod -R +x ./ubi_reader_mips/*
###########################################
###install dependent packages ###

if [ $? -ne 0 ]; then 
opkg install python-json 
opkg install python-simplejson 
opkg update 
wait
opkg install ffmpeg exteplayer3 enigma2-plugin-extensions-serviceapp
fi 

#####################################################################################
echo "#####################################################" 
echo "#  INSTALLED SUCCESSFULLY #" 
echo "#####################################################" 
		echo "********************************************************************************"
echo "   UPLOADED BY  >>>>   EMIL_NABIL "   
sleep 4;
		echo ". >>>>         RESTARING     <<<<"
echo "**********************************************************************************"
wait
killall -9 enigma2
exit 0

























