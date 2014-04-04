#!/bin/bash

SCRIPTDIR=`dirname $0`

#####
# Some configuration options:
####
echo "Total number of params is $#"
if [ 2 -ne $# ] 
then
   echo "Should have exactly 2 arguments!"
   echo ""
   echo "Usage:  ./liquibase.sh DBNAME COMMAND"
   echo "    DBNAME name of the database to apply command to on localhost"
   echo "    COMMAND liquibase command, like update, updateSQL, etc." 
   exit 1
fi

DBNAME=$2
COMMAND=$1	
echo "Command is $COMMAND"
echo "DB name is $DBNAME"

DRIVER=com.mysql.jdbc.Driver
CLASSPATH=$SCRIPTDIR/lib/mysql-connector-java-5.1.27-bin.jar
CHANGELOG_FILE=$SCRIPTDIR/db/changelog.xml
JDBC_URL="jdbc:mysql://localhost/$DBNAME"
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
     $COMMAND 
