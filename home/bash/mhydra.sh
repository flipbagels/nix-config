# Ensure local mount point exists
mkdir -p ~/mnt/hydra/

# Check if connected to network
read -p "Are you connected to the network??? (y/n): " -n 1 -r confirmation
echo
if [[ $confirmation =~ ^[Yy]$ ]]; then
    # Ask for username
    read -p "Username: " -r username
    echo

    # Attempt to mount
    sshfs ${username}@hydra.physics.ox.ac.uk:/mnt/users/${username}/ ~/mnt/hydra/
    echo

    # Check if mount was successful
    if [[ $? -eq 0 ]]; then
        echo "Successfully mounted at ~/mnt/hydra/"
    else
        echo "Failed to mount."
    fi
else
    echo "Aborted. Please connect to the network."
fi
