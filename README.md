# terraform
Terraform project featuring eks cluster setup along with dependent aws components.

Architecture:
1) There is a root main.tf which calls three modules, iam vpc and eks; there is backend.tf which has 
configuration related to storing state file in s3 bucket and having dynamoDB locking to prevent concurrent changes to terraform state 
at similar times, there is also a variable(root) file which has variables listed. 

2) There is modules directory in which three modules iam, vpc and eks have their own independent main.tf, variables.tf and outputs.tf.

3) There is envs directory which has dev and test directory each containing independent tfvars file according to their environement.
