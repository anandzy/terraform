resource "aws_key_pair" "mac" {
  key_name = "mac"
  public_key = "${file("${var.PATH_TO_PUBLIC_KEY}")}"
}
