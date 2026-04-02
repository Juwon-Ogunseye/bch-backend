# bch-backend

# Bitcoin Culture Hub — Backend

This repo is the backend for Bitcoin Culture Hub, built with FastAPI.
It powers our design and community features by handling all data and media connections.
We use MySQL (AWS RDS) for the database and AWS S3 for image storage.

## Prerequisites
- Python 3.10+
- Docker and Docker Compose
- Access to AWS RDS (your IP must be whitelisted on port 3306)

## Quick Start (Local)
```bash
git clone https://github.com/Bitcoin-Culture-Hub/bch-backend.git
cd bch-backend

# Create and activate virtual environment
python3 -m venv venv
source venv/bin/activate

# Install dependencies
pip install -r requirements.txt

# Set up environment variables
cp .env.example .env
# Fill in your real credentials in .env

# Run the app
uvicorn app.main:app --reload
```

Visit http://localhost:8000/docs to see the API documentation.

## Quick Start (Docker)

The backend is run together with the frontend using Docker Compose.
From the bch-frontend directory:
```bash
docker-compose up --build
```

This starts both the frontend (port 8080) and backend (port 8000) together.

## Environment Variables
Copy `.env.example` to `.env` and fill in the real values.

Key variables needed:
- `DEPLOYED_DATABASE_URL` — MySQL connection string (AWS RDS)
- `SECRET_KEY` — JWT secret key
- `MAILERLITE_TOKEN` — MailerLite API token
- `AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY` — for S3 access

## AWS RDS Access
To connect to the database locally, your IP must be whitelisted on the
AWS RDS security group inbound rules on port 3306. Contact the team admin
to get your IP whitelisted.

## Notes
- MongoDB has been removed. The app now uses MySQL exclusively.
- The `/bookmarks` and `/explore` routes are temporarily disabled 
  pending migration from MongoDB to MySQL.

