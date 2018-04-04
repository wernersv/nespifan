# nespifan

Clone the repository to your raspi using "git clone https://github.com/wernersv/nespifan".

Change to the directory: "cd nespifan"


There are 3 files 

**fancontrol**

This file does the actual work. It checks for the temperature of the CPU and turns on the fan if the temp exceeds the given value. The fan is turned of if the temp is falling a bit below the maxTMP.

Change the following lines to your needs:

	pin = 16 # The pin ID, edit here to change it
	maxTMP = 75 # The maximum temperature in Celsius after which we trigger the fan


**fancontrol.service**

This file is for systemd and has to be linked or copied to "/etc/systemd/system/fancontrol.service".


You may want to adapt the path "/root/nespifan" if you did not checkout the project to the home of the root user on your pi.

**fancontrol.sh**

The control script used by systemd.



## Install/Run/Control:

systemctl enable fancontrol.service

systemctl daemon-reload

service fancontrol start

service fancontrol status

service fancontrol stop

## Test
sysbench --test=cpu --num-threads=4 --cpu-max-prime=200000 run

![Not a beauty, but it works](https://lh3.googleusercontent.com/4NQ-dQ-IyJyMn202JjZYjtlcKQfyAVu73KcedgvhfBqd9mxn78p0T3LkHEkg8ufSqyxtEy-JVW1dt4EHP5XjPle-HxpXk3hO2iGZO1yjIOedkRbZQzUsJxRAz0P1e5iNzczOAoc5v4_XkD4r2erqTIOTagKw)
