killall ddcutil
for i in /dev/i2c-*; do
    id=$(echo $i | cut -d'-' -f2)
    ddcutil -b $id --noverify --skip-ddc-checks --maxtries=1,1,1 --lazy-sleep --noudf --noconfig --syslog=NEVER --quickenv setvcp 10 $1 $2 &>/dev/null
done
