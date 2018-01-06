FROM resin/rpi-raspbian:jessie
ENTRYPOINT []

WORKDIR /root

RUN apt-get update -qy \
 && apt-get install --no-install-recommends -qy \
    git-core \
    git \
    cmake \
    libusb-1.0.0-dev \
    build-essential \
    install \
    librtlsdr-dev \
    debhelper \
    pkg-config

RUN git clone git://git.osmocom.org/rtl-sdr.git \
    && mkdir -p ./rtl-sdr/build \
    && cd /root/rtl-sdr/build \
    && cmake ../ -DINSTALL_UDEV_RULES=ON \
    && make -j 4 \
    && make install \
    && ldconfig \
    && cp /root/rtl-sdr/rtl-sdr.rules /etc/udev/rules.d/
    
RUN git clone https://github.com/mutability/dump1090 \
    && cd dump1090 \
#    && make -j 4
    && dpkg-buildpackage -b
    
    
#RUN git clone https://github.com/malcolmrobb/dump1090 \
#    && cd dump1090 \
#    && make -j 4

# web overview
EXPOSE 8080

# ports for FlightAware etc
EXPOSE 30003
EXPOSE 30005
EXPOSE 30104

WORKDIR /root/dump1090

COPY ./startdumping.sh startdumping.sh
RUN chmod +x startdumping.sh

# Update your lat/lon values.
ENV DUMP_HTTP_PORT="" DUMP_SBS_PORT="" DUMP_LAT="" DUMP_LON="" 

CMD ["/root/dump1090/startdumping.sh"]
