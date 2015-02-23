#!/bin/bash

scriptpath=$(readlink -f "$0")
utilpath=$(dirname $scriptpath)/../../.utils
subuserpath=$(dirname $scriptpath)/subuser

#create a subuser directory with the uuid
rm -rf $subuserpath
mkdir -p $subuserpath

# Get the host descriptor
bash $utilpath/get_host_descriptor.bash $subuserpath 
cp $utilpath/install_client_gpu.bash $subuserpath

#the uuid is the first argument. Create the uuid file and make sure it is added in the build file
echo $1 > ./subuser/uuid


docker build -t $1 .
