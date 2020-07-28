FROM arm64v8/ubuntu
LABEL maintainer=isaac

RUN apt-get update;apt-get install tmux htop python3 -y
RUN apt-get install git -y
RUN apt-get install python3-pip vim -y
RUN apt-get install libblas-dev liblapack-dev -y

RUN pip3 install six numpy wheel setuptools mock 'future>=0.17.1'
RUN pip3 install -U keras_applications --no-deps
RUN pip3 install -U keras_preprocessing --no-deps

RUN git clone https://github.com/tensorflow/tensorflow.git 

RUN apt-get install wget -y; wget https://github.com/bazelbuild/bazel/releases/download/3.4.1/bazel-3.4.1-linux-arm64; mv bazel-3.4.1-linux-arm64 /usr/local/bin/bazel
RUN chmod a+x /usr/local/bin/bazel

RUN apt-get install python -y

RUN cd tensorflow; echo -e '\n\n\n\n\n\n\n\n\n\n' | ./configure 
RUN cd tensorflow; bazel build //tensorflow/tools/pip_package:build_pip_package

