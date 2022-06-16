## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

(Images/network.png)

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the _____ file may be used to install only certain pieces of it, such as Filebeat.

  Enter the playbook file.
(install-elk.yml)

This document contains the following details:
- Description of the Topologu
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly available, in addition to restricting undesired access to the network.
What aspect of security do load balancers protect? What is the advantage of a jump box?_
	Load balancers distribute network load, helping to mitigate against denial of service attacks.
	A jump box's advantage is that it separates network access intended for server management into a single point, which can then be monitored.

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the log and system files.
	What does Filebeat watch for?
		Filebeat watches for changes in log files, specifically files related to various web services.
	What does Metricbeat record?
		Metricbeat records system and service data, such as CPU statistics and Apache/MySQL/Nginx service information.

The configuration details of each machine may be found below.

| Name               | Function      | IP Address    | Operating System |
|--------------------|---------------|---------------|------------------|
| JumpBoxProvisioner | Gateway       | 10.1.0.4      | Ubuntu           |
| Web-1              | Web Server    | 10.1.0.5      | Ubuntu           |
| Web-2              | Web Server    | 10.1.0.7      | Ubuntu           |
| Web-3              | Web Server    | 10.1.0.8      | Ubuntu           |
| ELK1               | Monitoring    | 10.2.0.4      | Ubuntu           |

### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the JumpBoxProvisioner machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:
	174.59.212.253
	
Machines within the network can only be accessed by SSH.
	Which machine did you allow to access your ELK VM? What was its IP address?
		JumpBoxProvisioner - 10.1.0.4

A summary of the access policies in place can be found in the table below.

| Name               | Publically Accessible | Allowed IP Addresses |
|--------------------|-----------------------|----------------------|
| JumpBoxProvisioner | Yes                   | 174.59.212.253       |
| Web-1              | Yes (through LB)      | All Traffic          |
| Web-2              | Yes (through LB)      | All Traffic          |
| Web-3              | No                    | N/A                  |
| ELK1               | No                    | N/A                  |

### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because...
What is the main advantage of automating configuration with Ansible?
	Automation is scalable to any number of virtual machines.

The playbook implements the following tasks:
In 3-5 bullets, explain the steps of the ELK installation play. E.g., install Docker; download image; etc._
- 1) Increase maximum accessible memory
- 2) Install docker, install PIP3
- 3) Download docker image sebp/elk:761, set up restart policy, open ports for filebeat, metricbeat, and kibana.
- 4) Enable docker on startup.

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

(Images/docker_ps_output.png)

### Target Machines & Beats
This ELK server is configured to monitor the following machines:
	List the IP addresses of the machines you are monitoring
		Web-1 10.1.0.5
		Web-2 10.1.0.7

We have installed the following Beats on these machines:
	Specify which Beats you successfully installed
		Filebeat and Metricbeat

These Beats allow us to collect the following information from each machine:
	In 1-2 sentences, explain what kind of data each beat collects, and provide 1 example of what you expect to see. E.g., `Winlogbeat` collects Windows logs, which we use to track user logon events, etc.
		Filebeat collects log files, such as those relating to running containers. Metricbeat collects system information, such as CPU and memory usage.

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the Beat playbook file to the ansible container.
- Update the configuration file to include IP of machine to send Beat data to.
- Run the playbook, and navigate to the Elk VM to check that the installation worked as expected.

Answer the following questions to fill in the blanks:_
- Which file is the playbook? Where do you copy it?
	(filebeat-playbook.yml) and (metricbeat-playbook.yml) into /etc/ansible/ within the ansible container on the jumpbox vm
- Which file do you update to make Ansible run the playbook on a specific machine? How do I specify which machine to install the ELK server on versus which to install Filebeat on?
	update /etc/ansible/hosts
- Which URL do you navigate to in order to check that the ELK server is running? 
	Currently http://20.110.147.82:5601/app/kibana, http://<elk vm public IP>:5601/app/kibana from home IP address.
	
_As a **Bonus**, provide the specific commands the user will need to run to download the playbook, update the files, etc._
