variable "credentials" {}
variable "project" {}
variable "region" {}

provider "google" {
  credentials  = "${file("${var.credentials}")}"
  project      = "${var.project}"
  region       = "${var.region}"
}

resource "google_sql_database_instance" "master" {
  name = "master4"
  database_version = "POSTGRES_9_6"
  region       = "${var.region}"

  settings {
    tier = "db-f1-micro"
  }
}

resource "google_sql_database" "database" {
  name      = "udb"
  instance  = "${google_sql_database_instance.master.name}"
}

resource "google_sql_user" "users" {
  name     = "postgres"
  instance = "${google_sql_database_instance.master.name}"
  host     = "*"
  password = "Curry000"
