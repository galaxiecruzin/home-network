# Home Network

## Setup

* Install Terrform - https://www.terraform.io/
* Install Docker - https://www.docker.com/community/open-source
* Install VirtualBox - https://www.virtualbox.org/wiki/Linux_Downloads
* Install Vagrant - https://www.vagrantup.com/downloads.html

## Install other tools:
```
sudo apt-get install mysql-client ansible
```

## Initialize Terrform
```
terraform init
```

## When making changes run:
```
terraform plan -out=plan.out
terraform apply plan.out
```

Make sure NFS is not running on the host machine
```
sudo apt-get --purge remove nfs-kernel-server nfs-common portmap
```

