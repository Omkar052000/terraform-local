resource "local_file" "my_file" {
	filename = "/home/ubuntu/terraform-local/Automated.txt"
	content = "This file is made using Terraform"
}

resource "random_string" "my_string" {
	length = 10
	special = true
	override_special = "!,%^?"
}

output "random_string_output" {
	value = random_string.my_string.result
}
