#!/bin/bash

#Header environment
. /opt/Postgresql/config/scripts/romerarioCluster.environment

#Ejemplo
#psql -h ${CLUSTERIP} -p ${CLUSTER_PORT} -U ${USERDB} -d ${DBNAME} -f ${PGSCRIPTSDIR}/database/ddl_exe_siva_20191112.sql >> ${DB_LOG_DIR}/backup.log

exit 0
