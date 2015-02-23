#!/bin/bash

scriptpath=$(readlink -f "$0")
utilpath=$(dirname $scriptpath)/../../.utils
subuserpath=$(dirname $scriptpath)/subuser
buildpath=$(dirname $scriptpath)
echo utilpath:$utilpath buildpath:$buildpath

#create a subuser directory with the uuid
rm -rf $subuserpath
mkdir -p $subuserpath

# Get the host descriptor
bash $utilpath/get_host_descriptor.bash $subuserpath 
bash $utilpath/get_host_gpu.bash

rm -r $buildpath/.hostdata

echo scriptpath $buildpath/.hostdata

cp -r $utilpath/../.hostdata/ $buildpath/.hostdata

cp $utilpath/install_client_gpu.bash $subuserpath

#the uuid is the first argument. Create the uuid file and make sure it is added in the build file
echo subuseruuid $1
echo $1 > ./subuser/uuid


docker build --no-cache -t $1 $buildpath
