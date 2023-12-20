$startTime = Get-Date

# Your command or script goes here
# For example, let's use the "dir" command as an example
 .\target\debug\kart-dashboard-backend-rewrite.exe

$endTime = Get-Date
$elapsedTime = $endTime - $startTime

Write-Host "Elapsed time: $($elapsedTime.TotalSeconds) seconds"
