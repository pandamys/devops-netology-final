provider "yandex" {
  cloud_id  = "b1g4vbedphcdqtu6gsm0"
  folder_id = "b1glhgk4h39lcj1meak9"
  zone      = "ru-central1-a"
}

resource "yandex_vpc_network" "network-1" {
  name = "network1"
}

resource "yandex_vpc_subnet" "subnet-1" {
  name           = "subnet1"
  zone           = "ru-central1-a"
  network_id     = yandex_vpc_network.network-1.id
  v4_cidr_blocks = ["192.168.10.0/24"]
}

resource "yandex_compute_instance" "nginx" {
  name = "pandamys-ru"

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = "fd8hguc7o9hhr5bcvhql"
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.subnet-1.id
    nat       = true
  }

  metadata = {
    user-data = file("./meta.yml")
  }
}

resource "yandex_compute_instance" "db01" {
  name = "db01-pandamys-ru"

  resources {
    cores  = 4
    memory = 4
  }

  boot_disk {
    initialize_params {
      image_id = "fd8hguc7o9hhr5bcvhql"
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.subnet-1.id
    nat       = true
  }

  metadata = {
    user-data = file("./meta.yml")
  }
}

resource "yandex_compute_instance" "db02" {
  name = "db02-pandamys-ru"

  resources {
    cores  = 4
    memory = 4
  }

  boot_disk {
    initialize_params {
      image_id = "fd8hguc7o9hhr5bcvhql"
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.subnet-1.id
    nat       = true
  }

  metadata = {
    user-data = file("./meta.yml")
  }
}

resource "yandex_compute_instance" "app" {
  name = "app-pandamys-ru"

  resources {
    cores  = 4
    memory = 4
  }

  boot_disk {
    initialize_params {
      image_id = "fd8hguc7o9hhr5bcvhql"
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.subnet-1.id
    nat       = true
  }

  metadata = {
    user-data = file("./meta.yml")
  }
}

resource "yandex_compute_instance" "gitlab" {
  name = "gitlab-pandamys-ru"

  resources {
    cores  = 4
    memory = 4
  }

  boot_disk {
    initialize_params {
      image_id = "fd8hguc7o9hhr5bcvhql"
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.subnet-1.id
    nat       = true
  }

  metadata = {
    user-data = file("./meta.yml")
  }
}

resource "yandex_compute_instance" "monitoring" {
  name = "monitoring-pandamys-ru"

  resources {
    cores  = 4
    memory = 4
  }

  boot_disk {
    initialize_params {
      image_id = "fd8hguc7o9hhr5bcvhql"
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.subnet-1.id
    nat       = true
  }

  metadata = {
    user-data = file("./meta.yml")
  }
}