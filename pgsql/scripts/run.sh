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

LANGUAGE=pl
LC_ALL=pl_PL.UTF-8
LANG=pl_PL.UTF-8
export LANGUAGE LC_ALL LANG
/etc/init.d/postgresql start
exec supervisord -n
