<img src="static/ansible.png" alt="drawing" width="40"/>

```bash
# Ping nexus host
ansible nexus -m ping -v
```

```bash
ansible all --list-hosts
```

```bash
# Ping all hosts
ansible all -m ping -v
```

```bash
ansible-vault create vault.yml
```

<img src="static/vagrant.png" alt="drawing" width="40"/>

```bash
vagrant box list
```

```bash
vagrant status
```

```bash
vagrant global-status --prune
```

```bash
vagrant destroy 1a2b3c4d
```

```bash
vagrant ssh --debug
```

