# 'Splatting' technique for adding AD user
$Attributes = @{

   Enabled = $true
   ChangePasswordAtLogon = $true

   UserPrincipalName = "dedsec@megacorp.industries"
   Name = "dedsec"
   GivenName = "Dedsec"
   DisplayName = "Dedsec"
   Description = "This is the primary account for remote management"
   Office = "No office for dedsec."

   Company = "Megacorp Industries"
   Department = "IT"
   Title = "Some user"
   City = "England"
   State = "UK"

   AccountPassword = "TemporaryPassword123!" | ConvertTo-SecureString -AsPlainText -Force

}

New-ADUser @Attributes
