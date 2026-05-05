#!/bin/bash
echo "Updating the Z-Organizer..."
sleep 3

unzip -o Z-Organizer_Linux.zip

rm Z-Organizer_Linux.zip

chmod +x Z-Organizer

./Z-Organizer &

rm -- "$0"
