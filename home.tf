# Configure the Docker provider
provider "docker" {
  host = "unix:///var/run/docker.sock"
}

# create samba container
resource "docker_container" "samba" {
  name = "samba"
  image = "dperson/samba"
  restart = "always"
  env = ["SHARE=data;/data;yes;no;no;all]", "USER=testuser;password", "USERa=testuser2;password"]
  volumes {
    host_path = "/data"
    container_path  = "/data"
    read_only = false
  }
  ports {
    internal = 139
    external = 139
  }
  ports {
    internal = 445
    external = 445
  }
}

# create db container
resource "docker_container" "db" {
  name  = "db"
  image = "mariadb:latest"
  restart = "always"
  env = ["MYSQL_ROOT_PASSWORD=root"]
  ports {
    internal = 3306
    external = 3306
  }
}

# create db container
resource "docker_container" "redis" {
  name  = "redis"
  image = "redis:latest"
  restart = "always"
  ports {
    internal = 6379
    external = 6379
  }
}

# create nginx container
resource "docker_container" "nginx" {
  name  = "nginx"
  image = "nginx:latest"
  restart = "always"
  ports {
    internal = 80
    external = 80
  }
}

# create wordpress container
resource "docker_container" "wordpress" {
  name  = "wordpress"
  image = "wordpress:latest"
  restart = "always"
  ports {
    internal = 80
    external = 8090
  }
}

# OwnCloud
resource "docker_container" "owncloud" {
  name = "owncloud"
  image = "owncloud/server:10.3"
  restart = "always"
  env = ["OWNCLOUD_VERSION = 10.3", "OWNCLOUD_DOMAIN = localhost", "ADMIN_USERNAME = admin", "ADMIN_PASSWORD = admin", "HTTP_PORT = 8080"]
  ports {
    internal = 8080
    external = 8080
  }  
}

# create node sample container
resource "docker_container" "express" {
  name  = "express"
  image = "galaxiecruzin/node-web-app"
  restart = "always"
  ports {
    internal = 8080
    external = 3000
  }
}

