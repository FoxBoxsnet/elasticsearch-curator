#!/bin/bash
#//==============================================
# elasticsearch-curator auto close and delete
#//==============================================
CONFIG_FILE="/var/spool/cron/crontabs/root"


echo "0	0	*	*	*	curator --host ${CU_HOST:-elasticsearch} close indices --prefix ${CU_PREFIX:-logstash} --older-than ${CU_CLOSE_DAY:-30} --time-unit days --timestring %Y.%m.%d"		>> $CONFIG_FILE
echo "0	1	*	*	*	curator --host ${CU_HOST:-elasticsearch} delete indices --prefix ${CU_PREFIX:-logstash} --older-than ${CU_DELETE_DAY:-60} --time-unit days --timestring %Y.%m.%d"	>> $CONFIG_FILE

#//==============================================
#// execute crond
#//==============================================
exec "$@"