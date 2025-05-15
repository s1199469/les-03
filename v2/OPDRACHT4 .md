# les-03
## LAB week 3 opdracht 4
## playbook voor "day2 operations", het afconfigureren van de virtuele machines
**inhoud playbook: day2operations.yml**
---
- name: day 2 operations
  hosts: all
  become: yes
  tasks:
    - name: add host entries
      ansible.builtin.blockinfile:
        path: /etc/hosts
        block: |
          {{ item.ip }} {{ item.name }}
        marker: "# (mark) ANSIBLE MANAGED BLOCK {{ item.name }}"
      loop:
        - {name: esxi, ip: 192.168.1.11}
    - name: update apt-get repo and cache
      apt: update_cache=yes force_apt_get=yes cache_valid_time=3600
- name: install mariadb
  hosts: databaseservers
  become: yes
  tasks:
    - name: install mariaDB server
      apt:
        name: mariadb-server
        state: present
    - name: start-mariadb
      service:
        name: mariadb
        state: started
        enabled: yes
- name: ngnix
  hosts: webservers
  become: yes
  tasks:
    - name: install ngnix
      apt:
        name: nginx
        state: latest
    - name: ensure nginx is running
      service:
        name: nginx
        state: started
        enabled: yes

