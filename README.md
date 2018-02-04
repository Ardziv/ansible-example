# Ansible setup example

## Requirements

* [VirtualBox](https://www.virtualbox.org/wiki/Downloads) - open-source hypervisor to create virtual machines
* [Vagrant](https://www.vagrantup.com/downloads.html) - command line tool to manage virtual machines
* [Optional] NFS support (not supported on Windows) to share folders: `sudo apt-get install nfs-kernel-server`. See also [GitHub discussion](https://github.com/eadmundo/openresty-pypi/issues/2#issuecomment-36073598)
* Python3 with venv (you sould be able to run python3 -m venv venv) or python2 with virtualenv or Ansible
* Install ansible playbook requirements: `make install` or `ansible-galaxy install --force --role-file=requirements.yml`
