Add-PSSnapin "Microsoft.SharePoint.Powershell" -ErrorAction SilentlyContinue
#created by Deon van Zyl
# Output File
$SPFile = ".\GetGroupInformation.txt"
# Site to Investigate
$SPSite = Get-SPSite https://somesite.com/ -ErrorAction SilentlyContinue


$SPWebCollection = $SPSite.AllWebs
# Dive into all sites/subsites and write to output file
foreach($SPWeb in  $SPWebCollection){
    Write-Output $SPWeb.Title "contains the following groups"| Out-File $SPFile -append
    Write-Output "========================"| Out-File $SPFile -append
    foreach($SPGroup in  $SPWeb.Groups){
        Write-Output $SPGroup.Name| Out-File $SPFile -append
    }

    Write-Output "========================"| Out-File $SPFile -append
}
