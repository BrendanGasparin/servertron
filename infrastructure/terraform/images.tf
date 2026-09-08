resource "proxmox_download_file" "ubuntu_24_04_cloud_image" {
  content_type = "iso"
  datastore_id = "local"
  node_name    = "servertron-1"

  # Pin the release, build, and SHA-256 hash
  url = "https://cloud-images.ubuntu.com/releases/noble/release-20260826/ubuntu-24.04-server-cloudimg-amd64.img"

  checksum           = "d0fe84bb5f80853425fa6be28e2c106f30104c3cfe8611933f2e65c9b63f0e30"
  checksum_algorithm = "sha256"

  overwrite = false
}
