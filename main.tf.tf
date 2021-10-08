provider "google" {
  project     = "responsive-gist-322605"
  credentials = file("/root/terraform/key.json")
  region      = "us-central1"
  zone        = "us-central1-a"

}

variable "account_name" {
  type = map(string)
  default = {
    "account1" = "devops1"
    "account2" = "devops2"
    "account3" = "devops3"
  }
}
resource "google_iam_user" "iamuser" {
  for_each = var.account_name
  name     = "${each.value}-iam"
}
