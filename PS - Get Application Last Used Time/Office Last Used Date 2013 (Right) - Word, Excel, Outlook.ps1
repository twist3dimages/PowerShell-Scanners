﻿# Correct filter
<#$computer = $env:COMPUTERNAME
$namespace = "ROOT\CIMV2"
$classname = "Win32_SoftwareFeature"

Get-WMIObject -Namespace $namespace -Class $classname -ComputerName $computer -ErrorAction SilentlyContinue |

    Where-Object {$_.ProductName -eq 'Microsoft Office Professional Plus 2013' -and $_.Name -match 'OUTLOOKFILES|EXCELFILES|WORDFILES' -and $_.LastUse -gt "20160101" -and -not( [int]$_.LastUse.Substring(0,8)-eq "19800000") } |
      
    Select-Object Caption, ProductName, Name, @{n='LastUse';e={([System.Management.ManagementDateTimeConverter]::ToDateTime($_.LastUse)).ToString("MM/dd/yyyy")}}#{[int]($_.Lastuse.Substring(0, 8))}},PSComputername, InstallDate
  #>
  
  # Correct filter
$computer = $env:COMPUTERNAME
$namespace = "ROOT\CIMV2"
$classname = "Win32_SoftwareFeature"

Get-WMIObject -Namespace $namespace -Class $classname -ComputerName $computer -ErrorAction SilentlyContinue |

    Where-Object { ($_.ProductName -eq 'Microsoft Office Professional Plus 2013' -and $_.Name -match 'OUTLOOKFILES|EXCELFILES|WORDFILES' ) -and ( $_.Accesses -ge 1 -and $_.LastUse -gt "20160101" -and -not( [int]$_.LastUse.Substring(0,8)-eq "19800000") ) } |
      
    Select-Object Caption, ProductName, Name, @{n='LastUse';e={([System.Management.ManagementDateTimeConverter]::ToDateTime($_.LastUse)).ToString("MM/dd/yyyy")}}#{[int]($_.Lastuse.Substring(0, 8))}},PSComputername, InstallDate
    
  


    <#
Get-wmiobject -Class Win32_SoftwareFeature -Filter "IdenifyingProduct = '{90150000-0011-0000-1000-0000000FF1CE}' AND ( name = 'OutlookFiles' or name = 'ExcelFiles' or name = 'AccessFiles' or name = 'WordFiles')" -ErrorAction SilentlyContinue| 
  #  Where-Object { -not( [int]$_.LastUse.Substring(0,8)-eq "19800000")} |
  ForEach-Object {
    New-Object -Type PSCustomObject -Property @{
      'Caption'      = $_.Caption
      'LastUsed' = [System.Management.ManagementDateTimeConverter]::ToDateTime($_.LastUse)

    }
  }#>