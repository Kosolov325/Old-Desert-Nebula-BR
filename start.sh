#!/bin/sh
if ps -ef | grep -v grep | grep screen ; then
  echo "already running."
  exit 0
else
  screen -m -d -S server DreamDaemon tgstation.dmb 7240 -trusted
  echo "launching"
  exit 0
fi
