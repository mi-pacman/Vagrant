# Configure DNS
Set-DNSClientServerAddress "Ethernet 2" -ServerAddress ($DNS)

# Install ADDS feature
Install-WindowsFeature AD-Domain-Services -IncludeManagementTools -Verbose

# Import ADDSDeployment module
Import-Module ADDSDeployment
