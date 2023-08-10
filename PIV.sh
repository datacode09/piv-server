#!/bin/bash

# Specify the Hadoop home directory
HADOOP_HOME="/path/to/your/hadoop/home"

# Check if Hadoop home directory is set
if [ -z "$HADOOP_HOME" ]; then
    echo "HADOOP_HOME is not set. Please set it to the Hadoop installation directory."
    exit 1
fi

# Check HDFS cluster status
echo "Checking HDFS cluster status..."
$HADOOP_HOME/bin/hdfs dfsadmin -report

# Check if the previous command was successful
if [ $? -eq 0 ]; then
    echo "HDFS cluster is accessible from the edge node."
else
    echo "Unable to access HDFS cluster from the edge node."
fi

#!/bin/bash

# Specify the Hadoop home directory
HADOOP_HOME="/path/to/your/hadoop/home"

# Specify the Hadoop user
HADOOP_USER="hadoop_user"

# Check if Hadoop home directory is set
if [ -z "$HADOOP_HOME" ]; then
    echo "HADOOP_HOME is not set. Please set it to the Hadoop installation directory."
    exit 1
fi

# Check if HDFS shell command is available
if [ ! -x "$HADOOP_HOME/bin/hdfs" ]; then
    echo "HDFS shell command not available in the Hadoop distribution."
    exit 1
fi

# Check HDFS cluster connectivity by listing root directory
echo "Checking HDFS cluster connectivity..."
$HADOOP_HOME/bin/hdfs dfs -ls /

# Check if the previous command was successful
if [ $? -eq 0 ]; then
    echo "HDFS cluster is accessible from the edge node."
else
    echo "Unable to access HDFS cluster from the edge node."
fi

#!/bin/bash

# Specify the Sqoop home directory
SQOOP_HOME="/path/to/your/sqoop/home"

# Specify the Hadoop home directory
HADOOP_HOME="/path/to/your/hadoop/home"

# Check if Sqoop home directory is set
if [ -z "$SQOOP_HOME" ]; then
    echo "SQOOP_HOME is not set. Please set it to the Sqoop installation directory."
    exit 1
fi

# Check if Hadoop home directory is set
if [ -z "$HADOOP_HOME" ]; then
    echo "HADOOP_HOME is not set. Please set it to the Hadoop installation directory."
    exit 1
fi

# Check if Sqoop command is available
if [ ! -x "$SQOOP_HOME/bin/sqoop" ]; then
    echo "Sqoop command not available in the Sqoop distribution."
    exit 1
fi

# Check if Hadoop command is available
if [ ! -x "$HADOOP_HOME/bin/hadoop" ]; then
    echo "Hadoop command not available in the Hadoop distribution."
    exit 1
fi

# Check Sqoop version
echo "Checking Sqoop version..."
$SQOOP_HOME/bin/sqoop version

# Check if the previous command was successful
if [ $? -eq 0 ]; then
    echo "Sqoop is working properly on the edge node."
else
    echo "Unable to run Sqoop on the edge node."
fi


#!/bin/bash

# Specify the Spark home directory
SPARK_HOME="/path/to/your/spark/home"

# Check if Spark home directory is set
if [ -z "$SPARK_HOME" ]; then
    echo "SPARK_HOME is not set. Please set it to the Spark installation directory."
    exit 1
fi

# Check if Spark command is available
if [ ! -x "$SPARK_HOME/bin/spark-shell" ]; then
    echo "Spark command not available in the Spark distribution."
    exit 1
fi

# Check Spark version
echo "Checking Spark version..."
$SPARK_HOME/bin/spark-shell --version

# Check if the previous command was successful
if [ $? -eq 0 ]; then
    echo "Spark is working properly on the edge node."
else
    echo "Unable to run Spark on the edge node."
fi

#!/bin/bash

# Specify the NiFi home directory
NIFI_HOME="/path/to/your/nifi/home"

# Check if NiFi home directory is set
if [ -z "$NIFI_HOME" ]; then
    echo "NIFI_HOME is not set. Please set it to the NiFi installation directory."
    exit 1
fi

# Check if NiFi command is available
if [ ! -x "$NIFI_HOME/bin/nifi.sh" ]; then
    echo "NiFi command not available in the NiFi distribution."
    exit 1
fi

# Start NiFi in the background
echo "Starting NiFi..."
$NIFI_HOME/bin/nifi.sh start

# Sleep for a few seconds to give NiFi time to start
sleep 10

# Check if NiFi is running by querying the status
nifi_status=$($NIFI_HOME/bin/nifi.sh status | grep "Apache NiFi is running" | wc -l)

if [ "$nifi_status" -eq 1 ]; then
    echo "NiFi is working properly on the edge node."
else
    echo "Unable to start or run NiFi on the edge node."
fi
