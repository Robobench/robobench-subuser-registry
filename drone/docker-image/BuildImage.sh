#!/bin/bash

scriptpath=$(readlink -f "$0")
utilpath=$(dirname $scriptpath)/../../.utils

# Get the host descriptor
bash $utilpath/get_host_descriptor.bash

#create a subuser directory with the uuid
rm -rf ./subuser
mkdir -p ./subuser

#the uuid is the first argument. Create the uuid file and make sure it is added in the build file
echo $1 > ./subuser/uuid
