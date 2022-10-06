# Set timezone
tzutil /s "Cen. Australia Standard Time"

# Allow ICMP ping requests through firewall
netsh advfirewall firewall add rule name="ICMP Allow incoming V4 echo request" protocol=icmpv4:8,any dir=in action=allow
