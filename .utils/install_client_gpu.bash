#/bin/bash
host_descriptor_file=/subuser_back/host_descriptor.yml
nvidia_version=`cat $host_descriptor_file | grep nvidia | awk '{print $2}'`
nvidia_bin=/tmp/nvidia-driver.run

if test ! -f $nvidia_bin; then
    nvidia_driver_uri=http://us.download.nvidia.com/XFree86/Linux-x86_64/${nvidia_version}/NVIDIA-Linux-x86_64-${nvidia_version}.run
    wget -O $nvidia_bin $nvidia_driver_uri
fi

sudo apt-get -y install --force-yes xserver-xorg-core-lts-trusty install x-window-system
sudo apt-get install -y binutils mesa-utils module-init-tools

sudo sh $nvidia_bin -a -N --ui=none --no-kernel-module -q

sudo rm $nvidia_bin


