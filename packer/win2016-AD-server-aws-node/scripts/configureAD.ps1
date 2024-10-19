#Requires -Version 3
#Requires -RunAsAdministrator

###
### Variables
###
# $DomainName = 'dditest.test'
# $DomainNetbiosName = $DomainName.split('.')[0]
$Computer = $env:COMPUTERNAME
$Password = ConvertTo-SecureString "s3cr3tp@ss" -AsPlainText -Force

Write-Output 'Add Windows features'
Add-WindowsFeature 'RSAT-AD-Tools' -IncludeAllSubFeature -IncludeManagementTools
Add-WindowsFeature -Name 'ad-domain-services' -IncludeAllSubFeature -IncludeManagementTools
Add-WindowsFeature -Name 'dns' -IncludeAllSubFeature -IncludeManagementTools
Add-WindowsFeature -Name 'gpmc' -IncludeAllSubFeature -IncludeManagementTools

# Write-Output 'Set password to never expire'        
# $account = [ADSI]("WinNT://$Computer/Administrator,user")
# $cred =  New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $account, $Password
# $Account.SetPassword($Cred.GetNetworkCredential().Password)
# $account.invokeSet('userFlags',($account.userFlags[0] -BOR 65536))
# $account.commitChanges() 


Write-Output "Add new forest and domain dditest.test"

$Params = @{
    CreateDnsDelegation = $false
    DatabasePath = 'C:\Windows\NTDS'
    DomainMode = 'WinThreshold'
    DomainName = 'dditest.local'
    DomainNetbiosName = 'DDITEST'
    ForestMode = 'WinThreshold'
    InstallDns = $true
    LogPath = 'C:\Windows\NTDS'
    NoRebootOnCompletion = $true
    SafeModeAdministratorPassword = $Password
    SysvolPath = 'C:\Windows\SYSVOL'
    Force = $true
}
 
Install-ADDSForest @Params

#Write-Output 'Please reboot the server'
