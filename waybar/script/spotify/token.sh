#!/bin/zsh

curl -X POST "https://accounts.spotify.com/api/token" -H "Content-Type: application/x-www-form-urlencoded" -d "grant_type=client_credentials&client_id=874aa5037691459d8b7f957ba4afa56b&client_secret=71f7e8186fc2480f95b6f52e765fc726" | cut -b 18- | cut -b -115
