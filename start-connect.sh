#!/bin/bash
cp </path/to/local/ca-certificates>/*.crt /etc/pki/ca-trust/source/anchors/
update-ca-trust extract

sed -e "s|\${VAULT_ROLE_ID}|${VAULT_ROLE_ID}|g" \
    -e "s|\${VAULT_SECRET_ID}|${VAULT_SECRET_ID}|g" \
    /etc/kafka/connect-standalone.properties > /tmp/connect-standalone.properties

exec connect-standalone /tmp/connect-standalone.properties \
                        /etc/kafka/oracle-jdbc-sources/oracle-jdbc-source-pv.properties \
                        /etc/kafka/oracle-jdbc-sources/oracle-jdbc-source-msk.properties \
                        /etc/kafka/oracle-jdbc-sources/oracle-jdbc-source-sib.properties \
                        /etc/kafka/oracle-jdbc-sources/oracle-jdbc-source-ug.properties \
                        /etc/kafka/oracle-jdbc-sources/oracle-jdbc-source-nw.properties
                        