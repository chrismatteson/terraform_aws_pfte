# output.tf - outputs important parameters will need to finish configuring vault
# These parameters will but spit out after each terraform apply

output "PTFE_IP" {
  value = "${aws_instance.ptfe.public_ip}"
}
