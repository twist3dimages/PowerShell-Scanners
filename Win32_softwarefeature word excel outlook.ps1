﻿Get-WmiObject -Class win32_softwarefeature  |

    Where-Object {$_.Caption -match 'Microsoft\sOffice|Microsoft\sOutlook|Microsoft\sExcel|Microsoft\sWord' -and -not( [int]$_.LastUse.Substring(0,8)-eq "19800000")} |
      
    Select-Object Caption, ProductName, Name, @{n='LastUse';e={[int]($_.Lastuse.Substring(0, 8))}},PSComputername, InstallDate