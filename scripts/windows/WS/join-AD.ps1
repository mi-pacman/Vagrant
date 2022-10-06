$DC_IP = "10.0.0.15"
$INTERFACE_NAME = "Ethernet 2"

$DOMAIN_NAME = "megacorp.industries"
$USERNAME = "dedsec" 
$PASSWORD = "TemporaryPassword123!"

# Configure DNS server
netsh interface ipv4 set dns name=$INTERFACE_NAME static $DC_IP 

# Join Megacorp domain
netdom join MCWS01 /domain:megacorp.industries /UserD:megacorp.industries\$USERNAME /PasswordD:$PASSWORD
