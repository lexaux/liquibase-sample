#!/bin/bash

SCRIPTDIR=`dirname $0`

#####
# Some configuration options:
####
DRIVER=com.mysql.jdbc.Driver
CLASSPATH=$SCRIPTDIR/lib/mysql-connector-java-5.1.27-bin.jar
CHANGELOG_FILE=$SCRIPTDIR/db/changelog.xml
JDBC_URL="jdbc:mysql://localhost/lqsample"
JDBC_USER="root"
JDBC_PASSWORD="root"


echo "changelog is $CHANGELOG_FILE"

java -jar $SCRIPTDIR/lib/liquibase.jar \
     --driver="$DRIVER" \
     --classpath="$CLASSPATH" \
     --changeLogFile="$CHANGELOG_FILE" \
     --url="$JDBC_URL" \
     --username="$JDBC_USER" \
     --password="$JDBC_PASSWORD" \
     $@
