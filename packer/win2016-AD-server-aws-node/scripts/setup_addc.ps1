#Requires -Version 3
#Requires -RunAsAdministrator

Write-Output 'Add Windows features'
Add-WindowsFeature 'RSAT-AD-Tools'
Add-WindowsFeature -Name 'ad-domain-services' -IncludeAllSubFeature -IncludeManagementTools
Add-WindowsFeature -Name 'dns' -IncludeAllSubFeature -IncludeManagementTools
Add-WindowsFeature -Name 'gpmc' -IncludeAllSubFeature -IncludeManagementTools