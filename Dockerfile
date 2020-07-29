FROM arm64v8/ubuntu
LABEL maintainer=isaac

ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt-get update;apt-get install tmux htop python3 git python3-pip vim libblas-dev liblapack-dev python apt-utils pkg-config -y

RUN pip3 install six numpy wheel setuptools mock 'future>=0.17.1' pkgconfig numpy pkgconfig

RUN git clone https://github.com/tensorflow/tensorflow.git 

RUN apt-get install wget -y; wget https://github.com/bazelbuild/bazel/releases/download/3.4.1/bazel-3.4.1-linux-arm64; mv bazel-3.4.1-linux-arm64 /usr/local/bin/bazel; chmod a+x /usr/local/bin/bazel

RUN cd tensorflow; echo -e '\n\n\n\n\n\n\n\n\n\n' | ./configure 
RUN apt-get install wget -y; wget --no-check-certificate https://support.hdfgroup.org/ftp/HDF5/releases/hdf5-1.10/hdf5-1.10.6/src/hdf5-1.10.6.tar.gz; tar -zxvf hdf5-1.10.6.tar.gz; cd hdf5-1.10.6; ./configure --prefix=/usr/include/hdf5; make; make install

RUN pip3 install -U keras_applications --no-deps
RUN pip3 install -U keras_preprocessing --no-deps

ENV CPATH="/usr/include/hdf5/include/:/usr/include/hdf5/lib/"
RUN cd /usr/lib; ln -s /usr/include/hdf5/lib/libhdf5.so ./libhdf5.so; ln -s /usr/include/hdf5/lib/libhdf5_hl.so ./libhdf5_hl.so; pip3 install h5py

RUN apt-get install gfortran -y
RUN pip3 install scipy

# RUN cd tensorflow; bazel build //tensorflow/tools/pip_package:build_pip_package

