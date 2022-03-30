Param(
    [Parameter(Mandatory, HelpMessage = "Enter the path for the HTML file.")]
    [int32]$age
)

if ($age -ge 55) {
    $category = Write-Host -ForegroundColor DarkMagenta "alpha"
}
elseif ($age -ge 40) {
    $category = Write-Host -ForegroundColor Blue "bravo"
}
elseif ($age -ge 25) {
    $category = Write-Host -ForegroundColor Yellow "gamma"
}
else {
    $category = Write-Host -ForegroundColor Green "omega"
}

$category
