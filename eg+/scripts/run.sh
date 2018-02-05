#!/bin/bash - 
#===============================================================================
#
#          FILE: run.sh
# 
#         USAGE: ./run.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Marek Płonka (marekpl), marek.plonka@nask.pl
#  ORGANIZATION: NASK
#       CREATED: 31.10.2016 12:26:01
#      REVISION:  ---
#===============================================================================

#set -o nounset                              # Treat unset variables as an error

/etc/init.d/ssh start
/etc/init.d/ntp start
/etc/init.d/nginx start
#exec supervisord -n
bash -c 'sleep infinity'

