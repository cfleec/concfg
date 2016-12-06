$url = 'https://github.com/lukesampson/concfg/archive/master.zip'
$output = 'c:\temp\concfg.zip'
$concfg = 'c:\temp\concfg\bin\concfg.ps1'

if (!(Test-Path ('c:\temp\concfg'))) { 
    (New-Object System.Net.WebClient).DownloadFile($url, $output)
    Unblock-File $output
    $output | % {& 'C:\Program Files\7-Zip\7z.exe' 'x' $_ ('-o' + $output.Replace('\concfg.zip',''))}
    ls $output.Replace('\concfg.zip','') -Attributes Directory -Filter '*concfg*' | rni -NewName 'concfg'
    if (Test-Path $output) {del $output}
}

. $concfg import solarized small -n
#. $concfg import https://raw.githubusercontent.com/cfleec/concfg/master/presets/small-110.json -n
