
resource "google_service_account" "default" {
  account_id   = var.project_id
  display_name = "Custom SA for VM Instance"
}

# #Provisoning of Jenkins Server
resource "google_compute_instance" "jenkins-server" {
  name         = "jenkins-server"
  machine_type = var.machine_type
  zone         = var.zone
  tags         = ["jenkins-server"]

  boot_disk {
    initialize_params {
      image = var.os_image
      size  = var.disk_size
      labels = {
        my_label = "jenkins-server"
      }
    }
  }
  network_interface {
    network = "default"
    access_config {
      // Ephemeral public IP
    }
  }

  desired_status            = "RUNNING"
  allow_stopping_for_update = true

  //Configuring the Jenkins Server...
  provisioner "remote-exec" {
    //inline = ["echo 'wait until ssh is ready'" ]
    connection {
      host        = google_compute_instance.jenkins-server.network_interface[0].access_config[0].nat_ip
      type        = "ssh"
      user        = "arman"
      timeout     = "120s"
      private_key = file("/home/engineers0789/.ssh/mykey")
      // host_key = file("/home/engineers0789/.ssh/mykey.pub")
    }
    inline = [
      "sudo apt update",
      "sudo apt install fontconfig openjdk-17-jre -y",
      "java -version",
      "sudo wget -O /usr/share/keyrings/jenkins-keyring.asc  https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key",
      "echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc]  https://pkg.jenkins.io/debian-stable binary/ | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null",
      "sudo apt-get update",
      "sudo apt-get install jenkins -y",
      "sudo apt update -y && apt upgrade -y",
      "echo 'Jenkins installation done.........'"
    ]
  }
}
#Provisoning of Ansible Server
resource "google_compute_instance" "ansible-server" {
  name         = "ansible-server"
  machine_type = var.machine_type
  zone         = var.zone
  tags         = ["ansible-server"]

  boot_disk {
    initialize_params {
      image = var.os_image
      size  = var.disk_size
      labels = {
        my_label = "ansible-server"
      }
    }
  }
  network_interface {
    network = "default"
    access_config {
      // Ephemeral public IP
    }
  }

  desired_status            = "RUNNING"
  allow_stopping_for_update = true

  //Configuring of Ansible Server.........
  provisioner "remote-exec" {
    connection {
      host        = google_compute_instance.ansible-server.network_interface[0].access_config[0].nat_ip
      type        = "ssh"
      user        = "arman"
      timeout     = "120s"
      private_key = file("/home/engineers0789/.ssh/mykey")
      // host_key = file("/home/engineers0789/.ssh/mykey.pub")
    }
    inline = [
      "sudo apt update",
      "sudo apt install software-properties-common",
      "sudo add-apt-repository --yes --update ppa:ansible/ansible",
      "sudo apt install ansible -y",
      "echo 'ansible installation done.........'"
    ]
  }
}

#Provisoning of Monitoring Server
resource "google_compute_instance" "monitoring-server" {
  name         = "monitoring-server"
  machine_type = var.machine_type
  zone         = var.zone
  tags         = ["monitoring-server"]

  boot_disk {
    initialize_params {
      image = var.os_image
      size  = var.disk_size
      labels = {
        my_label = "monitoring-server"
      }
    }
  }
  network_interface {
    network = "default"
    access_config {
      // Ephemeral public IP
    }
  }

  desired_status            = "RUNNING"
  allow_stopping_for_update = true

  //Configuring of Monitoring Server.........
  provisioner "remote-exec" {
    connection {
      host        = google_compute_instance.monitoring-server.network_interface[0].access_config[0].nat_ip
      type        = "ssh"
      user        = "arman"
      timeout     = "120s"
      private_key = file("/home/engineers0789/.ssh/mykey")
      // host_key = file("/home/engineers0789/.ssh/mykey.pub")
    }
    inline = [
      #downloading and installing prometheus-server.
      "sudo apt update -y && upgrade -y",
      "sudo wget https://github.com/prometheus/prometheus/releases/download/v2.48.1/prometheus-2.48.1.linux-amd64.tar.gz",
      " tar zxvf prometheus-2.48.1.linux-amd64.tar.gz ",
      "cd prometheus-2.48.1.linux-amd64/",
      #" sudo ./prometheus --config.file=prometheus.yml"

      #downloading and installing grafana-server
      "sudo apt-get install -y apt-transport-https software-properties-common wget",
      "sudo mkdir -p /etc/apt/keyrings/",
      "wget -q -O - https://apt.grafana.com/gpg.key | gpg --dearmor | sudo tee /etc/apt/keyrings/grafana.gpg > /dev/null",
      "echo 'deb [signed-by=/etc/apt/keyrings/grafana.gpg] https://apt.grafana.com stable main' | sudo tee -a /etc/apt/sources.list.d/grafana.list",
      "sudo apt-get update -y",
      "sudo apt-get install grafana -y",
      "sudo systemctl daemon-reload",
      "sudo systemctl start grafana-server",
      #"sudo systemctl status grafana-server"

    ]
  }
}


#Provisoning of application Server
resource "google_compute_instance" "application-server" {
  name         = "application-server"
  machine_type = var.machine_type
  zone         = var.zone
  tags         = ["application-server"]

  boot_disk {
    initialize_params {
      image = var.os_image
      size  = var.disk_size
      labels = {
        my_label = "application-server"
      }
    }
  }
  network_interface {
    network = "default"
    access_config {
      // Ephemeral public IP
    }
  }

  desired_status            = "RUNNING"
  allow_stopping_for_update = true

  //configuring of application Server.........
  provisioner "remote-exec" {
    connection {
      host        = google_compute_instance.application-server.network_interface[0].access_config[0].nat_ip
      type        = "ssh"
      user        = "arman"
      timeout     = "120s"
      private_key = file("/home/engineers0789/.ssh/mykey")
      // host_key = file("/home/engineers0789/.ssh/mykey.pub")
    }
    inline = [
      #docker installation............
      "sudo apt update -y",
      "sudo apt install docker.io -y",
      "sudo apt update -y && apt upgrade -y",
      "sudo systemctl enable docker",
      "sudo systemctl start docker ",

      #kubectl installation
      "sudo curl -LO https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl",
      "sudo curl -LO https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256",
      "sudo echo $(cat kubectl.sha256)  kubectl | sha256sum --check",
      "sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl",
      "sudo kubectl version --client --output=yaml",

      #minikube and installation.........
      "sudo curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64",
      "sudo install minikube-linux-amd64 /usr/local/bin/minikube",
      "sudo apt update -y && apt upgrade -y",
      "sudo minikube start --driver=docker --force",
      "sudo minikube status"
    ]
  }
}