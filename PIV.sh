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




# Specify the SQL Server connection details
DB_HOST="your_database_host"
DB_PORT="your_database_port"

# Check if the nc (netcat) command is available
if [ ! -x "$(command -v nc)" ]; then
    echo "nc (netcat) command is not available. Please install netcat."
    exit 1
fi

# Check if the SQL Server connection details are set
if [ -z "$DB_HOST" ] || [ -z "$DB_PORT" ]; then
    echo "Please set the DB_HOST and DB_PORT variables."
    exit 1
fi

# Check SQL Server Database status using netcat
echo "Checking SQL Server Database status..."
nc -z "$DB_HOST" "$DB_PORT"

# Check if netcat was successful
if [ $? -eq 0 ]; then
    echo "SQL Server Database is up and accessible."
else
    echo "Unable to connect to the SQL Server Database."
fi

#!/bin/bash

# Specify the Oracle Database connection details
DB_HOST="your_database_host"
DB_PORT="your_database_port"
DB_SERVICE="your_database_service"

# Check if the tnsping command is available
if [ ! -x "$(command -v tnsping)" ]; then
    echo "tnsping command is not available. Please install Oracle Instant Client."
    exit 1
fi

# Check if the Oracle Database connection details are set
if [ -z "$DB_HOST" ] || [ -z "$DB_PORT" ] || [ -z "$DB_SERVICE" ]; then
    echo "Please set the DB_HOST, DB_PORT, and DB_SERVICE variables."
    exit 1
fi

# Check Oracle Database status using tnsping
echo "Checking Oracle Database status..."
tnsping "(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=$DB_HOST)(PORT=$DB_PORT))(CONNECT_DATA=(SERVICE_NAME=$DB_SERVICE)))" 2>&1

# Check if tnsping was successful
if [ $? -eq 0 ]; then
    echo "Oracle Database is up and accessible."
else
    echo "Unable to connect to the Oracle Database."
fi

#!/bin/bash

# Specify the SFTP server connection details
SFTP_USER="your_sftp_username"
SFTP_HOST="your_sftp_server"
SFTP_PORT="your_sftp_port"

# Check if the sftp command is available
if [ ! -x "$(command -v sftp)" ]; then
    echo "sftp command is not available. Please install an SFTP client."
    exit 1
fi

# Check if the SFTP server connection details are set
if [ -z "$SFTP_USER" ] || [ -z "$SFTP_HOST" ] || [ -z "$SFTP_PORT" ]; then
    echo "Please set the SFTP_USER, SFTP_HOST, and SFTP_PORT variables."
    exit 1
fi

# Attempt to connect to the SFTP server
echo "Checking SFTP server status..."
sftp -o Port="$SFTP_PORT" "$SFTP_USER@$SFTP_HOST" <<EOF
exit
EOF

# Check if the SFTP connection was successful
if [ $? -eq 0 ]; then
    echo "SFTP server is up and accessible."
else
    echo "Unable to connect to the SFTP server."
fi



# Specify the API endpoint and the PFX file details
API_URL="https://api.example.com"
PFX_FILE="path/to/your/certificate.pfx"
PFX_PASSWORD="your_pfx_password"
CERT_DIR="certs"

# Check if the PFX file exists
if [ ! -f "$PFX_FILE" ]; then
    echo "PFX file not found. Please provide a valid path to the PFX file."
    exit 1
fi

# Create a directory to store the PEM files
mkdir -p "$CERT_DIR"

# Convert PFX to PEM files
openssl pkcs12 -in "$PFX_FILE" -clcerts -nokeys -out "$CERT_DIR/certificate.crt" -password pass:"$PFX_PASSWORD"
openssl pkcs12 -in "$PFX_FILE" -nocerts -out "$CERT_DIR/private.key" -password pass:"$PFX_PASSWORD"

# Perform API testing using curl and the PEM files for client authentication
response=$(curl -o /dev/null --write-out "%{http_code}" --cert "$CERT_DIR/certificate.crt" --key "$CERT_DIR/private.key" -X GET "$API_URL")

# Check the HTTP response code
if [ "$response" -ge 200 ] && [ "$response" -lt 300 ]; then
    echo "API request succeeded. HTTP status code: $response"
    exit 0  # Success
else
    echo "API request failed. HTTP status code: $response"
    exit 1  # Failure
fi



#!/bin/bash

# Specify the Elasticsearch endpoint
ELASTICSEARCH_ENDPOINT="http://your-elasticsearch-server:9200"

# Check if the Elasticsearch endpoint is set
if [ -z "$ELASTICSEARCH_ENDPOINT" ]; then
    echo "ELASTICSEARCH_ENDPOINT is not set. Please set it to the Elasticsearch server endpoint."
    exit 1
fi

# Send a GET request to the Elasticsearch endpoint
response=$(curl -s -o /dev/null -w "%{http_code}" "$ELASTICSEARCH_ENDPOINT")

# Check the HTTP response code
if [ "$response" -eq 200 ]; then
    echo "Elasticsearch endpoint is working properly."
else
    echo "Unable to access the Elasticsearch endpoint."
fi


#!/bin/bash

# Specify Oracle connection details
ORACLE_HOST="your_oracle_host"
ORACLE_PORT="your_oracle_port"
ORACLE_SERVICE="your_oracle_service"
ORACLE_USERNAME="your_oracle_username"
ORACLE_PASSWORD="your_oracle_password"
ORACLE_TABLE="your_oracle_table"

# Check if spark-shell command is available
if [ ! -x "$(command -v spark-shell)" ]; then
    echo "spark-shell command is not available. Please install Spark or set SPARK_HOME correctly."
    exit 1
fi

# Check if Oracle connection details are set
if [ -z "$ORACLE_HOST" ] || [ -z "$ORACLE_PORT" ] || [ -z "$ORACLE_SERVICE" ] || [ -z "$ORACLE_USERNAME" ] || [ -z "$ORACLE_PASSWORD" ] || [ -z "$ORACLE_TABLE" ]; then
    echo "Please set all the Oracle connection variables."
    exit 1
fi

# Spark shell script
SPARK_SCRIPT="
import org.apache.spark.sql.SparkSession

object OracleConnectionExample {
  def main(args: Array[String]): Unit = {
    val spark = SparkSession.builder()
      .appName(\"Oracle Connection Example\")
      .getOrCreate()

    try {
      val jdbcUrl = \"jdbc:oracle:thin:@//$ORACLE_HOST:$ORACLE_PORT/$ORACLE_SERVICE\"
      val jdbcUsername = \"$ORACLE_USERNAME\"
      val jdbcPassword = \"$ORACLE_PASSWORD\"

      val connectionProperties = new java.util.Properties()
      connectionProperties.put(\"user\", jdbcUsername)
      connectionProperties.put(\"password\", jdbcPassword)

      val df = spark.read.jdbc(jdbcUrl, \"$ORACLE_TABLE\", connectionProperties)
      println(\"Connected to Oracle successfully.\")
    } catch {
      case e: Exception =>
        println(\"Failed to connect to Oracle: \" + e.getMessage)
    } finally {
      spark.stop()
    }
  }
}

OracleConnectionExample.main(Array())
"

# Create a temporary Scala script
TMP_SCRIPT=$(mktemp)
echo "$SPARK_SCRIPT" > "$TMP_SCRIPT"

# Run the Spark shell script
echo "Running Spark script to test Oracle connection..."
spark-shell --class OracleConnectionExample --master local[1] --conf "spark.executor.extraJavaOptions=-Duser.timezone=UTC" --conf "spark.driver.extraJavaOptions=-Duser.timezone=UTC" --driver-class-path /path/to/oracle/driver/ojdbc8.jar "$TMP_SCRIPT"

# Clean up temporary Scala script
rm -f "$TMP_SCRIPT"
