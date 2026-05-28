# SCRIPT PG CLUSTER: http://www.scriptpgcluster.com
Scriptpgcluster is a scalable solution adaptable to your business needs. The Community solution is designed for small businesses that require powerful databases at a low price with professional performance.

Scriptpgcluster offers other businesses more powerful solutions adapted to more demanding environments, always within a fully standardized framework.

Contact us via our website at http://www.scriptpgcluster.com or via email at scriptpgcluster@gmail.com, and a sales representative will send you a quote for our product.


# Comunity Version
It is the file where all the variables that affect and define the cluster are defined. Mapped drives, shared files, node IPs… We detail each of the variables in this file:

• CLUSTER_MASTER_FILE=/mnt/cluster/clustermasterip.txt (Example)

Variable that indicates the file on a shared drive, visible from all nodes, where the master node's IP address is specified.
• CLUSTER_MASTER_DEFAULT=192.168.100.5 (Example)

Variable that indicates the default master node's IP address.
• CLUSTER_MASTER_WAITS_SECS=10 (Example)

Variable that indicates the number of seconds a slave waits for the master to respond during a cluster login or startup.
• CLUSTER_MASTER_WAITS_TIMES=5 (Example)

Variable that indicates the number of timeouts a slave executes after the master responds. In total, the slave will wait for the master's response (CLUSTER_MASTER_WAITS_SECS x CLUSTER_MASTER_WAITS_TIMES = total seconds). For each period, it checks if the master has woken up; if not, it goes to sleep for another period of seconds.
• CLUSTER_DNS=192.168.100.11  (Example)

This variable indicates the DNS of the cluster's virtual address (pgpool virtual IP) or, if this DNS address is assigned, the same DNS address. Normally, it's the DNS, but if we don't have one, we use the IP address, which will match CLUSTERIP.
• CLUSTERIP=192.168.100.11 (Example)

This variable indicates the cluster's IP address. It's the virtual IP address configured in pgpool for accessing the cluster.
• CLUSTER_PORT=6432 (Example)
This variable indicates the port that the cluster's virtual IP address serves. This port should not be the standard 5432 because that port is assigned to the pgbouncer to prevent disruption to the standard connection. For example, 6432 or any other free port, as long as it is the one defined by pgpool, is acceptable.

• CLUSTER_HOSTS=("192.168.100.5" "192.168.100.6" "192.168.100.9")
This variable array defines the IP addresses of the nodes participating in the cluster. They must be in the format shown in the example ("IP" "IP" … "IP"), enclosed in double quotes and separated by spaces. If we want to do it using their DNS, the format would be the same, except that it would be mandatory to modify the IPNODE variable in this file with the node's DNS and do it manually in this file for each node, since this variable, which we describe later, would not be populated automatically.

• NODE_PORT=16432
This variable defines the port on which the PostgreSQL nodes listen and which we configure in each node's postgreql.conf file. The standard PostgreSQL port 5432 is modified so that it remains on the front end, making client connections transparent by default.

• DEVICE_ETH=enp0s3
This variable defines the Linux interface on which the node listens and retrieves both the virtual and physical IP addresses.

• CLUSTER_PARENT=$( /usr/bin/cat ${CLUSTER_MASTER_FILE} )
This automatic variable reads the cluster master from the file defined in the CLUSTER_MASTER_FILE variable, which dynamically maintains the master's IP address and is modified by the failover process in case of failure. DO NOT MODIFY

• IP_NODE=$( ip a | grep ${DEVICE_ETH} | grep inet | head -1 | sed 's/\:/ /' | awk '{print $2}' | sed 's-/.*--g' )
Automatic variable that obtains the IP address of the node where the file is running. If we have set the DNS servers in the cluster node array, variable CLUSTER_HOSTS, we must manually modify this variable on each node with its DNS value; otherwise, DO NOT MODIFY.

#---------------- USERS AND SSH CONFIGURATION
• USER_SO=course
Variable that contains the name of the operating system utility user. which we will work with in all scripts and which is not PostgreSQL

• PGUSER_SO=postgres
Variable that contains the name of the Operating System User that has full permissions and has PostgreSQL installed as administrator; by default, PostgreSQL is used, and changing it is not recommended

• SSHUSER=$PGUSER_SO
Variable that contains the User that has permissions to execute commands via SSH on all nodes and with which the relevant passwordless authentication cross-checks have been performed. It is recommended that this be the same as the PostgreSQL administrator user, PGUSER_SO.

• SSHFILE=/home/postgres/.ssh/id_rsa
Variable containing the path to the configuration file with the PostgreSQL user's RSA private key for SSH.

#-------------- SERVICES
• PGPOOL_SERVICE=/usr/lib/systemd/system/pgpool.service
Variable containing the pgpool service file for systemctl.

• POSTGRES_SERVICE=/usr/lib/systemd/system/postgresql.service
Variable containing the PostgreSQL service file for systemctl.

• PGBOUNCER_SERVICE=/usr/lib/systemd/system/pgbouncer.service
Variable containing the pgbouncer service file for systemctl.
