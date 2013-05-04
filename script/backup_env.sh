#!/bin/bash

APP_HOME="$( cd "$( dirname "${BASH_SOURCE[0]}" )/.." && pwd )"
if [ -L $APP_HOME ]; then
  CURRENT=`readlink -f $APP_HOME`
else
  CURRENT=$APP_HOME
fi
TS=`date +%Y%m%d%H%M%S`
cp -a $CURRENT /tmp/$TS
LINK=`readlink -f $CURRENT/public/system`
rm -Rf /tmp/$TS/{tmp,.git,static,public/system,.sass-cache}
cp -a $LINK /tmp/$TS/public/
$CURRENT/script/backup_db.rb production /tmp/$TS > /dev/null 2>&1
mkdir -p $1
cd $1 && tar czf $TS.tar.gz -C /tmp $TS
rm -Rf /tmp/$TS
ls -1t $1/*.tar.gz | tail -n +121 | xargs rm > /dev/null 2>&1
exit 0
