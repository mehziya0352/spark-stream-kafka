# Multi-User Docker Compose with Dynamic Ports

This setup lets **multiple users** run the same `docker-compose` stack **on the same server** without port conflicts.
Each user gets **their own ports** automatically.

## How It Works

* When you run `./start.sh`, it checks if you already have a `.env_<username>` file.
* If not, it creates one with **random free ports**.
* These ports are then used in `docker-compose.yml` instead of fixed numbers.
* The `.env_<username>` file is **unique per user**, so everyone can run the stack at the same time.

## Steps to Use

1. **Clone the project**
   $ git clone https://github.com/<repo-name>.git
   $ cd <repo-name>

2. **Make the script executable**
   $ chmod +x start.sh
   
4. **Start your stack**
   $ ./start.sh

**Sample Output**
Creating new env file for user: ubuntu
Starting Docker Compose...

**Ports for ubuntu** 
ZOOKEEPER_PORT=23456
KAFKA_PORT=34567
SPARK_UI_PORT=45678
SPARK_MASTER_PORT=56789
FLINK_UI_PORT=60005
KAFKA_UI_PORT=61010
   
This will:
   * Create `.env_<username>` with your ports (first time only)
   * Start the containers using those ports

**Access Services**
* Kafka UI → http://<server-ip>:<KAFKA_UI_PORT>
* Spark UI → http://<server-ip>:<SPARK_UI_PORT>
* Flink UI → http://<server-ip>:<FLINK_UI_PORT>
