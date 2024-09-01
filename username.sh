#!/bin/bash

# Create a new user
 sudo useradd -m -s /bin/bash sri

# Set a password for the new user
 sudo echo  sri: Sri@12345" | chpasswd

# Optional: Add the new user to a specific group
sudo usermod -aG groupname sri

# Optional: Set a custom home directory for the new user
sudo usermod -d /path/to/home sri

# Optional: Set a custom shell for the new user
sudo usermod -s /path/to/shell sri
sudo cp -r /home sri /home/sri
sudo chown -R sri:sri /home/sri

# Optional: Set an expiration date for the new user
#usermod -e YYYY-MM-DD sri

# Optional: Set additional user properties
# usermod -c "User description" sri
# usermod -u UID sri
# usermod -g GID sri

# Display the details of the new user
id sri

#!/bin/bash

# Get the username from the first argument
username="$1"

# Check if a username was provided
if [ -z "$username" ]; then
  echo "Usage: $0 <username>"
  exit 1
fi

# Check if the user exists
if id "$username" &>/dev/null; then
  echo "User '$username' exists."
else
  echo "User '$username' does not exist."
fi
