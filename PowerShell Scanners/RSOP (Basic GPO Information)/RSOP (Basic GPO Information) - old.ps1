Get-CimInstance -ClassName RSOP_GPO -Namespace Root\RSOP\Computer | Select-Object Name, Enabled, FilterAllowed | Sort-Object -Property Name
