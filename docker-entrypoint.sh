#!/bin/sh
set -e

EXEC_NAME="phantun_server"
if [ "${RUN_MODE}" = "client" ]; then
    EXEC_NAME="phantun_client"
fi

if [ -z "${LOCAL_ADDR}" ]; then
    echo "Bad Local Port/Address"
    exit 1
fi

if [ -z "${REMOTE_ADDR}" ]; then
    echo "Bad Remote Address"
    exit 1
fi

if [ ! -z "${TUN_NAME}" ]; then
    TUN_NAME="--tun ${TUN_NAME}"
fi

if [ ! -z "${TUN_LOCAL}" ]; then
    TUN_LOCAL="--tun_local ${TUN_LOCAL}"
fi

if [ ! -z "${TUN_PEER}" ]; then
    TUN_PEER="--tun_peer ${TUN_PEER}"
fi

${EXEC_NAME} \
--local ${LOCAL_ADDR} \
--remote ${REMOTE_ADDR} \
${TUN_NAME} \
${TUN_LOCAL} \
${TUN_PEER} \
"$@"
