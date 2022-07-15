#!/bin/bash

FQDN="hadoop.com"
ADMIN="admin"
PASS="airflow"

KRB5_KTNAME=/etc/admin.keytab

cat /etc/hosts

echo "hostname: ${FQDN}"

# create kerberos database
echo -e "${PASS}\n${PASS}" | kdb5_util create -s

# create admin
echo -e "${PASS}\n${PASS}" | kadmin.local -q "addprinc ${ADMIN}/admin"

# create airflow
echo -e "${PASS}\n${PASS}" | kadmin.local -q "addprinc -randkey airflow"

echo -e "${PASS}\n${PASS}" | kadmin.local -q "addprinc -randkey airflow/${FQDN}"

kadmin.local -q "ktadd -k ${KRB5_KTNAME} airflow"

kadmin.local -q "ktadd -k ${KRB5_KTNAME} airflow/${FQDN}"


/usr/local/bin/supervisord -n -c /etc/supervisord.conf

