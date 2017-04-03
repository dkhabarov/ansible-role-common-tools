# ansible-role-common-tools

Ansible role for common system utilities i'm use on everyday basis. .

## Tested
* Ubuntu 12.04, 14.04
* Debian 7, 8
* CentOS 7
* Fedora 24-25
* Gentoo stage3 20170112

## Installation

Write to requirements.yml
```yaml
- src: https://github.com/dkhabarov/ansible-role-common-tools.git
  name: dkhabarov.ansible-role-common-tools
```

Run install command:

        ansible-galaxy install -i -f -r requirements.yml


Write playbook.yml 

```yaml
---
- name: apply common configuration to all nodes
  hosts: all
  user: root
  roles:
    - {role: dkhabarov.ansible-role-common-tools, tags: configure_common }
```
Or in $rolename/meta/main.yml

```yaml
---
dependencies:
  - { role: dkhabarov.ansible-role-common-tools, tags: configure_common }

```
Provison!
