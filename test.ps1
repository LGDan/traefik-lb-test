# Test script for blue/green load balancer test

$iter = 100

do {
    1..1000 
    | ForEach-Object {Invoke-RestMethod -Uri "http://localhost" -Headers @{"Host"="nginx.local";"Cookie"="lvl1=abc"} } 
    | Group-Object

    $iter--
    Start-Sleep -Seconds 1
} while ($iter -gt 0)
