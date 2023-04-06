$domain = "domain.com"
$start = 1
$end = 400
$outputFile = "valid_results.txt"

for ($i = $start; $i -le $end; $i++) {
    $hostname = "us-{0:D3}.{1}" -f $i, $domain
    $result = nslookup $hostname
    if ($result -match "Name:") {
        Add-Content -Path $outputFile -Value "$hostname: $result"
    }
}
