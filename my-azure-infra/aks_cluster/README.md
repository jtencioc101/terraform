### Creates a Private AKS cluster and a Jumpbox VM 
- Both AKS cluster and the Jumpbox are created in separate VNETS
- There is a Network peering between VNETS
- Using Ansible Terraform provider to install all the necessary tools on the Jumpbox

### Requirements
 - [Terraform](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)
 - [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/index.html)
 - [Terraform Ansible provider](https://registry.terraform.io/providers/ansible/ansible/latest/docs)

### Limitations
- The Private DNS Zone is not created nor tracked by Terraform as it is created by default with the Private AKS cluster, to be able to resolve the Cluster API FQDN a subnet link is needed at the Private DNS Zone.<br/>
   [Subnet Link](https://learn.microsoft.com/en-us/azure/dns/private-dns-getstarted-portal#link-the-virtual-network)
   
![Basic topology](assets/image.png)