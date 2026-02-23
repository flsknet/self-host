#!/usr/bin/env bash

# PostgreSQL
echo "POSTGRES_USER=postgres" > .env
echo "POSTGRES_PASSWORD=postgres" >> .env

# Caddy
echo "HOSTNAME=$1" >> .env

# Web
echo "VITE_API_URL=https://api.$1" >> .env

# API
echo "DATABASE_URL=postgresql://postgres:postgres@db:5432" >> .env
echo "CORS_ORIGIN=https://app.$1" >> .env

echo "BETTER_AUTH_URL=https://api.$1" >> .env
echo "BETTER_AUTH_SECRET=$(openssl rand -base64 32)" >> .env