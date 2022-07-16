#!/bin/bash

FQDN="test.com"
ADMIN="admin"
PASS="Admin12!"

KRB5_KTNAME=/etc/admin.keytab

cat /etc/hosts

echo "hostname: ${FQDN}"

inited="/app/inited"

function init_user() {
	if [ -f "${inited}" ];then
		echo "user inited"
	    kadmin.local -q "xst -k /app/hadoop.keytab -norandkey server/hadoop.${FQDN}"
	    kadmin.local -q "xst -k /app/cli.keytab -norandkey cli"
		return;
	fi
	echo "begin init user"
	# create kerberos database
	echo -e "${PASS}\n${PASS}" | kdb5_util create -s
	# create admin
	echo -e "${PASS}\n${PASS}" | kadmin.local -q "addprinc ${ADMIN}/admin"
	# create hadoop
	echo -e "${PASS}\n${PASS}" | kadmin.local -q "addprinc cli"
	echo -e "${PASS}\n${PASS}" | kadmin.local -q "addprinc  server/hadoop.${FQDN}"
	kadmin.local -q "ktadd -norandkey -k ${KRB5_KTNAME} cli"
	kadmin.local -q "ktadd -norandkey -k ${KRB5_KTNAME} server/hadoop.${FQDN}"
	kadmin.local -q "xst -k /app/hadoop.keytab -norandkey server/hadoop.${FQDN}"
	kadmin.local -q "xst -k /app/cli.keytab -norandkey cli"
	touch "${inited}"
	echo "user inite success"
}

function main() {
	init_user
	/usr/local/bin/supervisord -n -c /etc/supervisord.conf
}

main
