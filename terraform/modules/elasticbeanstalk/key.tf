resource "aws_key_pair" "vf-keypair" {
  key_name = "vf-keypair"
  public_key = "${file("${var.PATH_TO_PUBLIC_KEY}")}"
}
