#!/bin/bash

if command -v brew &>/dev/null; then
    echo "Homebrew is installed on macOS. Installing Docker and docker-compose"
    # Install Homebrew (if you haven't already)
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    # Install Docker
    brew install docker

    # Start Docker service
    brew services start docker

    # Install Docker Compose
    brew install docker-compose

elif command -v apt-get &>/dev/null; then
    echo "apt-get is installed. This is a Debian-based Linux distribution. Installing Docker and docker-compose"
    sudo apt-get update
    
    # Install Docker
    sudo apt install --yes apt-transport-https ca-certificates curl gnupg2 software-properties-common
    curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
    sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"
    sudo apt install --yes docker-ce
    sudo usermod -aG docker $USER

    # Install Docker Compose
    sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    sudo chmod +x /usr/local/bin/docker-compose
    docker-compose --version
    echo "terminal terminating in 100sec"
    leep 50
    logout
else
    echo "Homebrew and apt-get is not installed. Please install any of them and try again !!"
fi
