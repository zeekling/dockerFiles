#!/bin/bash

docker stop kerberos

docker rm kerberos

docker run -d --name=kerberos kerberos:1.0.0
