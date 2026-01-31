#!/bin/bash
echo "Deploying application..."
docker build -t cilabproject .
echo "Deployment completed"