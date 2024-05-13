#!/bin/sh


# add mitmproxy certificate to the system trusted certs
if [ x"$MITMPROXY_CERT" != x"" -a -r $MITMPROXY_CERT ]; then
    sudo cp $MITMPROXY_CERT /usr/local/share/ca-certificates/mitmproxy.crt
    sudo update-ca-certificates
fi

# run the user's command
exec "$@"
