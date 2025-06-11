FROM confluentinc/cp-kafka-connect:7.4.0

USER root

COPY /certs/anchors </path/to/local/ca-certificates>

RUN update-ca-trust enable && \
    update-ca-trust extract && \
    keytool -importcert -noprompt -trustcacerts -alias cert1 -file </path/to/local/ca-certificates>/cert1.crt -keystore /usr/lib/jvm/zulu11/lib/security/cacerts -storepass changeit && \
    keytool -importcert -noprompt -trustcacerts -alias cert2 -file </path/to/local/ca-certificates>/cert2.crt -keystore /usr/lib/jvm/zulu11/lib/security/cacerts -storepass changeit 

USER appuser
