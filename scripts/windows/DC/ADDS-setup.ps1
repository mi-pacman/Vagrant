# Variables
$DNS = "127.0.0.1, 8.8.8.8"
$DOMAIN_NAME = "megacorp.industries"
$NETBIOS_NAME = "MEGACORP"
$SMADMINPASSWORD = ConvertTo-SecureString "Changeme123!" -AsPlainText -Force

# Install new forest
Install-ADDSForest -SafeModeAdministratorPassword $SMADMINPASSWORD -CreateDnsDelegation:$false -DatabasePath "C:\Windows\NTDS" -DomainMode "7" -DomainName $DOMAIN_NAME -DomainNetbiosName $NETBIOS_NAME -ForestMode "7" -InstallDns:$true -LogPath "C:\Windows\NTDS" -NoRebootOnCompletion:$false -SysvolPath "C:\Windows\SYSVOL" -Force:$true
