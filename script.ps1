$OutputEncoding='utf-8'
Write-Output "--------------------"
Write-Output "|EASY JDL ADBLOCKER|"
Write-Output "|  @GNUWood  2024  |"
Write-Output "--------------------"
Write-Output ""

$userchoice = Read-Host "Continue?(y/n)"

switch($userchoice)
{
	y {
		$jsonPath = $env:LOCALAPPDATA + '/JDownloader 2/cfg/org.jdownloader.settings.GraphicalUserInterfaceSettings.json'
		try {
			$jsonData = Get-Content -Path $jsonPath | ConvertFrom-Json
		}
		catch {
			Write-Error "org.jdownloader.settings.GraphicalUserInterfaceSettings.json Not Exists"
			Start-Sleep 3
			exit
		}
		$jsonData.premiumalertetacolumnenabled = $false
		$jsonData.premiumalertspeedcolumnenabled = $false
		$jsonData.premiumalertetacolumnenabled = $false
		$jsonData.specialdealoboomdialogvisibleonstartup = $false
		$jsonData.specialdealsenabled = $false
		$jsonData.donatebuttonstate = "CUSTOM_HIDDEN"
		$jsonData.bannerenabled = $false
		$jsonString = $jsondata | ConvertTo-Json
		$jsonString | Set-Content -Path $jsonPath
		Write-Output "ADBlocking Done."
		Start-Sleep 3
	}
	n {exit}
	default {Write-Output ("invalid argument. The answer must be y or n.")}
}