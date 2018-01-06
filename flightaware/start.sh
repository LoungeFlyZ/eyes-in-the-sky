#!/bin/bash

/usr/bin/piaware-config receiver-type other

[[ ! -z ${PIAWARE_HOST} ]]             &&  /usr/bin/piaware-config receiver-host ${PIAWARE_HOST} || PIAWARE_HOST="dump1090"
[[ ! -z ${PIAWARE_PORT} ]]             &&  /usr/bin/piaware-config receiver-port ${PIAWARE_PORT} || PIAWARE_PORT="30005"
[[ ! -z ${PIAWARE_FEEDER_ID} ]]       && /usr/bin/piaware-config feeder-id ${PIAWARE_FEEDER_ID}

# Recommend adding this to the config
[[ ! -z ${GAIN} ]]             && /usr/bin/piaware-config rtlsdr-gain ${GAIN} || GAIN="-10"
[[ ! -z ${PPM} ]]              && /usr/bin/piaware-config rtlsdr-ppm ${PPM} || PPM="1"

# These are old ways of flight-aware/piaware

if [[ ! -z ${PIAWARE_USER} ]] && [[ -z ${PIAWARE_FEEDER_ID} ]]; then
    echo "WARNING: flightaware-user has been deprecated."
    /usr/bin/piaware-config flightaware-user ${PIAWARE_USERNAME}
fi

if [[ ! -z ${PIAWARE_PASSWORD} ]] && [[ -z ${PIAWARE_FEEDER_ID} ]]; then
    echo "WARNING: flightaware-password has been deprecated."
    /usr/bin/piaware-config flightaware-password ${PIAWARE_PASSWORD}
fi

if [[ ! -z ${PIAWARE_MAC} ]]; then
    echo "WARNING: force-macaddress has been deprecated."
    /usr/bin/piaware-config force-macaddress ${PIAWARE_MAC}
fi

/usr/bin/piaware -debug
