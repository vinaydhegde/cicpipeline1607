#Note: every command/line below will create a layer
#ubuntu is the base kernel image here
from ubuntu:16.04
#'label maintainer' is used to identify the owner/maintainer name
label maintainer all-images@devops.com
arg image_variable="local"
env ora_port=1521
env ora_host="localhost"
#run is used to create a SKELETON. Like, create a binary. Instantiating a service is not done/should not be done via 'run'
run mkdir /code
copy Sample.sh /code/Sample.sh
run chmod +x /code/Sample.sh
run echo "Building an image.."
run echo $image_variable
workdir /code
#'cmd'is for bootstrap. i.e. once in life time of image
cmd sh /code/Sample.sh
