$domain = "whiskergalaxy.com"
$start = 1
$end = 400
$outputFile = "valid_results.txt"
$jobs = @()

for ($i = $start; $i -le $end; $i++) {
    $hostname = "bne-{0:D3}.{1}" -f $i, $domain
    Write-Progress -Activity "Testing domains" -Status "Testing $hostname" -PercentComplete (($i / $end) * 100)
    $jobs += Start-Job -ScriptBlock {
        param ($hostname)
        $result = nslookup $hostname -timeout 500
        if ($result -match "Name:") {
            $domain = $result -replace '\n', ' ' -replace '\r', '' -replace '.*: (\S+)\..*', '$1'
            return $domain
        }
    } -ArgumentList $hostname
}

$results = $jobs | Receive-Job -Wait -AutoRemoveJob | Sort-Object | Get-Unique
Add-Content -Path $outputFile -Value $results
Write-Progress -Activity "Testing domains" -Status "Completed" -PercentComplete 100
