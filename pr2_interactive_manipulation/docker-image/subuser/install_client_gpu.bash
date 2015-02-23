#/bin/bash
host_descriptor_file=/subuser/host_descriptor.yml
nvidia_version=`cat $host_descriptor_file | grep nvidia | awk '{print $2}'`

nvidia_driver_uri=http://us.download.nvidia.com/XFree86/Linux-x86_64/${nvidia_version}/NVIDIA-Linux-x86_64-${nvidia_version}.run
wget -O /tmp/nvidia-driver.run $nvidia_driver_uri

sudo apt-get -y install --force-yes xserver-xorg-core-lts-trusty install x-window-system
sudo apt-get install -y binutils mesa-utils module-init-tools

sudo sh /tmp/nvidia-driver.run -a -N --ui=none --no-kernel-module -q

rm /tmp/nvidia-driver.run


