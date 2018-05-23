#!/usr/bin/env bash
docker run --name prowadzacy_roku_postgres -p 5432:5432 -e POSTGRES_USER=prowadzacy_roku -e POSTGRES_PASSWORD=prowadzacy_roku -d postgres:9-alpine
