## Liquibase sample application

Really small sample app featuring nothing more than liquibase, a set of changesets
and procedures to upgrade/migrate/rollback between revisions.

Please see into the `liquibase.sh` file for more details, all the
relevant comments are in-lined there.

Generally, liquibase.sh is just a wrapper over the java starting the .jar and the
parameters of the DB connection. Just use it as if all the parameters were already
specified. For instance, in order to do migration, instead of
```bash
#########
#TOO VERBOSE, DON'T USE!!!!!
#########
java -jar $SCRIPTDIR/lib/liquibase.jar \
     --driver="$DRIVER" \
     --classpath="$CLASSPATH" \
     --changeLogFile="$CHANGELOG_FILE" \
     --url="$JDBC_URL" \
     --username="$JDBC_USER" \
     --password="$JDBC_PASSWORD" \
     migrate
```

Instead, just run:
```bash
./liquibase.sh migrate
```