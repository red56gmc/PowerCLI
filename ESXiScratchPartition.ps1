##Lists the current settings for Scratch Partition Location

$vmhosts = Get-Cluster HQ-SDLC | Get-VMHost
$scratch = “ScratchConfig.ConfiguredScratchLocation”

Foreach ($esx in $vmhosts) {Get-AdvancedSetting -Entity $esx -Name $scratch | Select @{Name="ESXi Host";Expression={$esx.Name}}, Value} 


#This section lists the path for the selected datastores

Get-View -ViewType Datastore -filter @{'name'='sdlc'} | Select -ExpandProperty Info | Select Name, URL | Ft
