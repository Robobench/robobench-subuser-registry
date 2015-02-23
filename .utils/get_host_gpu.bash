
scriptpath=$(readlink -f "$0")
utilpath=$(dirname $scriptpath)
datapath=$utilpath/../.hostdata
echo datapath $datapath
mkdir -p $datapath

bash $utilpath/get_host_descriptor.bash $datapath

host_descriptor_file=$datapath/host_descriptor.yml

nvidia_version=`cat $host_descriptor_file | grep nvidia | awk '{print $2}'`
nvidia_bin=$datapath/nvidia-driver.run
if test ! -f $nvidia_bin; then
    nvidia_driver_uri=http://us.download.nvidia.com/XFree86/Linux-x86_64/${nvidia_version}/NVIDIA-Linux-x86_64-${nvidia_version}.run
    wget -O $nvidia_bin $nvidia_driver_uri
fi
