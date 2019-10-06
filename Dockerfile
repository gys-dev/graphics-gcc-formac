FROM ubuntu:18.04
RUN apt-get update
RUN apt-get install build-essential -y
RUN apt-get install wget \
guile-2.0-dev \
libsdl1.2debian \
libaudiofile-dev  \
libdirectfb-dev \
libdirectfb-extra \
libfreetype6-dev \
libxext-dev \
x11proto-xext-dev \
libfreetype6 libaa1 \
libaa1-dev \
libslang2-dev \
libasound2 \
libsdl1.2-dev \
libsdl-image1.2-dev -y
RUN wget http://download.savannah.nongnu.org/releases/libgraph/libgraph-1.0.1.tar.gz  &&\
tar xzvf libgraph-1.0.1.tar.gz &&\
cd libgraph-1.0.1  &&\
CPPFLAGS="$CPPFLAGS $(pkg-config --cflags-only-I guile-2.0)" \
CFLAGS="$CFLAGS $(pkg-config --cflags-only-other guile-2.0)" \
LDFLAGS="$LDFLAGS $(pkg-config --libs guile-2.0)" &&\
./configure --disable-guile &&\
make &&\
make install &&\
cp /usr/local/lib/libgraph.* /usr/lib && \
rm -rf /libgraph-1.0.1 && \
rm /libgraph-1.0.1.tar.gz
