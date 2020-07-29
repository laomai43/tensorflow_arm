# background
This project is dedicated to build an image of tensorflow environment in arm platform.
# how to use
You need to install docker first, for example:
```
apt-get install docker.io
```
Then build the image:
```
bash build.sh
```
The last bazel build command requires high power server(the more cpu and ram the better).  
A .whl file will be created after running this command. You can also skip the bazel build step if you get a prebuilt .whl file.  
Run the following command to install tensorflow:
```
pip3 install tensorflow-2.4.0-cp38-cp38-linux_aarch64.whl 
```
