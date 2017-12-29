# Ansible ELK Playbook
 
This playbook is for setting up version 6.1.1 of the ELK (Elasticsearch, Logstash and Kibana) and filebeat on a remote server. 

## Notes and requirements

 - The playbook was built and tested on Redhat 6.9 VMs, for ELK versions 6.1.1
 - You will need Ansible installed and running
 - Playbook is currently configured to set up the ELK stack together 
 - Add below lines to /etc/sysctl.conf, ask system admin
	
	kernel.shmall = 4294967297
	fs.file-max = 65536
	vm.max_map_count = 262144
 - If ELK is being setup using elk user then add below lines to /etc/security/limits.conf
	
	elk        soft  nproc 4096
	elk        hard  nproc 4096
	elk        soft nofile 65536
	elk        hard nofile 65536
 - the passwordless ssh is setup between ansible server and elkserver for elk user
 
## Instructions
 
 1. Edit your Ansible hosts file ('inventory/hosts') and add an 'elkservers' entry for the server you wish to install ELK on. 
 2. Verify connectivity to the ELK server.
 3. In the terminal on the machine hosting Ansible, clone this repo.
 4. Cd into the ansible playbook directory, and run:
 `ansible-playbook site.yml`
 
 The plays in the playbook will run on the target server, installing ELK. 
 
## Extra notes

If getting below error while starting elasticsearch,
 
ERROR: [1] bootstrap checks failed
[1]: system call filters failed to install; check the logs and fix your configuration or disable system call filters at your own risk

Then add below line to elasticsearch-6.1.1/config/elasticsearch.yml

	bootstrap.system_call_filter: false
	
** This configuration is already covered in elasticsearch role in this playbook