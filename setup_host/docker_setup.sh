sudo apt-get -y --no-install-recommends install \
    curl \
    apt-transport-https \
    ca-certificates \
    software-properties-common

curl -fsSL https://apt.dockerproject.org/gpg | sudo apt-key add -

apt-key fingerprint 58118E89F3A912897C070ADBF76221572C52609D
read -p "Does this belong to: 'Docker Release Tool (releasedocker) <docker@docker.com'?"

sudo add-apt-repository \
       "deb https://apt.dockerproject.org/repo/ \
       ubuntu-$(lsb_release -cs) \
       main"

sudo apt-get update
sudo apt-get -y install docker-engine=1.12.5-0~ubuntu-xenial
