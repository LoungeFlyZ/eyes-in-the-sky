FROM resin/rpi-raspbian:jessie

ENTRYPOINT []

RUN apt-get update && apt-get install -qy wget

RUN wget $(wget -qO- http://flightaware.com/adsb/piaware/install | egrep wget | awk '{print $3}' | awk -F\< '{print $1}') && \
    dpkg -i piaware*.deb
    
RUN apt-get update && apt-get install -qy \
    piaware
    
RUN piaware-config allow-auto-updates yes &&\
    piaware-config allow-manual-updates yes

EXPOSE 8080
EXPOSE 30003

COPY ./start.sh start.sh
RUN chmod +x start.sh

ENV PIAWARE_HOST="" PIAWARE_PORT="" PIAWARE_USER="" PIAWARE_PASSWORD="" PIAWARE_FEEDER_ID=""

CMD ["/start.sh"]
