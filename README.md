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
   $ git clone https://github.com/<your-repo>.git
   $ cd <your-repo>

2. **Make the script executable**
   $ chmod +x start.sh
   
4. **Start your stack**
   $ ./start.sh

   This will:

   * Create `.env_<username>` with your ports (first time only)
   * Start the containers using those ports

