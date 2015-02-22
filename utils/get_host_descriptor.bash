#!/bin/bash

NVIDIA_DIR=/proc/driver/nvidia

if test ! -d $NVIDIA_DIR; then
    echo "NVIDIA driver not installed yet. Driver must be installed on host first"
    return -1
fi

# Get your current host nvidia driver version, e.g. 340.24
nvidia_version=$(cat $NVIDIA_DIR/version | head -n 1 | awk '{ print $8 }')

# Get current xorg version
xorg_version=$(xdpyinfo | grep "X.Org version" | awk '{print $3}')


host_descriptor_file=host_descriptor.yml

echo "#Host descriptor file" > $host_descriptor_file
echo "nvidia: $nvidia_version" >> $host_descriptor_file
echo "xorg: $xorg_version" >> $host_descriptor_file
