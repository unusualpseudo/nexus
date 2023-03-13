<img src="static/linux.png" alt="drawing" width="40"/>

### SSH

```bash
# SSH logs
tail -f /var/log/auth.log
```

```bash
# Copy public key for local ssh
cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys
```


```bash
# Copy public key to server
ssh-copy-id remote_username@server_ip_address
```

### User management

```bash
# Add a new user to secondary group 
sudo useradd -G group user
```

### Network management

```bash
# Delete network interface
sudo ip link delete network_interface
```

```bash
# Display routing table
route -n
```

```bash
# Display all host ip adresses
hostname -I
```

### Networking

```bash
# Show all addresses
ip address show
```

```bash
# Show addresses for a single interface
ip address show ${interface name} 
```

```bash
# Show addresses only for running interfaces
ip address show up
```

```bash
# Add an address to an interface 
ip address add ${address}/${mask} dev ${interface name}
```

```bash
# Delete an address from an interface
ip address delete ${address}/${prefix} dev ${interface name}
```

```bash
# Remove all addresses from an interface
ip address flush dev ${interface name}
```

```bash
# Show information about all links
ip link show
ip link list
```

```bash
# Show information about a specific link
ip link show dev ${interface name}
```

```bash
# Bring a link up or down
ip link set dev ${interface name} up
ip link set dev ${interface name} down
```

```bash
# Enable or disable ARP on an interface
ip link set ${interface name} arp on
ip link set ${interface name} arp off
```

```bash
# Delete a link
ip link delete dev ${interface name}
```
