# Wordlock Decoder
# Version 1.4
# 8/30/2018

$host.ui.RawUI.WindowTitle = "Wordlock Decoder V1.4"

# Functions
function fail-letters
{
Write-Host -ForegroundColor red "Prompt cannot be blank and must only contain letters. Please try again."
}

function four-dial
{
while($true)
{
    $dial1 = Read-Host "Enter the letters on the first dial and press [enter]"

    if($dial1 -match "^[a-zA-Z-]")
    {
        break;
    }
    else
    {
        fail-letters
    }
}
while($true)
{
    $dial2 = Read-Host "Enter the letters on the second dial and press [enter]"

    if($dial2 -match "^[a-zA-Z-]")
    {
        break;
    }
    else
    {
        fail-letters
    }
}
while($true)
{
    $dial3 = Read-Host "Enter the letters on the third dial and press [enter]"

    if($dial3 -match "^[a-zA-Z-]")
    {
        break;
    }
    else
    {
        fail-letters
    }
}
while($true)
{
    $dial4 = Read-Host "Enter the letters on the fourth dial and press [enter]"

    if($dial4 -match "^[a-zA-Z-]")
    {
       break;
    }
    else
    {
        fail-letters
    }
}
    Write-Host "---------------------------------------------------------------------------"
    Write-Host "Here are the possible combinations:"
    Select-string $pwd\words.txt -Pattern "^[$dial1][$dial2][$dial3][$dial4]$" | Select-Object -ExpandProperty Line | Tee-Object -filepath $pwd\wordlock-results.txt
    Write-Host "---------------------------------------------------------------------------"
}

function five-dial
{
while($true)
{
    $dial1 = Read-Host "Enter the letters on the first dial and press [enter]"

    if($dial1 -match "^[a-zA-Z-]")
    {
        break;
    }
    else
    {
        fail-letters
    }
}
while($true)
{
    $dial2 = Read-Host "Enter the letters on the second dial and press [enter]"

    if($dial2 -match "^[a-zA-Z-]")
    {
        break;
    }
    else
    {
        fail-letters
    }
}
while($true)
{
    $dial3 = Read-Host "Enter the letters on the third dial and press [enter]"

    if($dial3 -match "^[a-zA-Z-]")
    {
        break;
    }
    else
    {
        fail-letters
    }
}
while($true)
{
    $dial4 = Read-Host "Enter the letters on the fourth dial and press [enter]"

    if($dial4 -match "^[a-zA-Z-]")
    {
        break;
    }
    else
    {
        fail-letters
    }
}
while($true)
{
    $dial5 = Read-Host "Enter the letters on the fifth dial and press [enter]"

    if($dial5 -match "^[a-zA-Z-]")
    {
        break;
    }
    else
    {
        fail-letters
    }
}
    Write-Host "---------------------------------------------------------------------------"
    Write-Host "Here are the possible combinations:"
    Select-string $pwd\words.txt -Pattern "^[$dial1][$dial2][$dial3][$dial4][$dial5]$" | Select-Object -ExpandProperty Line | Tee-Object -filepath $pwd\wordlock-results.txt
    Write-Host "---------------------------------------------------------------------------"
}

# Start script
Write-Host "Loading, please wait..."
Invoke-WebRequest "https://raw.githubusercontent.com/sbirdsill/PS-WordLock-Decoder/refs/heads/main/words.txt" -UseBasicParsing | Select-Object -ExpandProperty Content | Out-File $pwd\words.txt
cls
Write-Host "Wordlock Decoder"
Write-Host "================"
while($true)
{
    $Prompt = Read-Host "Is this a 4 dial lock or a 5 dial lock? Please type [4] or [5] and press [enter]"

    if($prompt -eq "4")
    {
        four-dial
        break;
    }
    if($Prompt -eq "5")
{
    five-dial
    break;
    }
else
    {
        Write-Host -ForegroundColor red "Prompt cannot be blank and must only contain '4' or '5'. Please try again."
    }
}
Write-Host "Number of words:"$(Get-Content $pwd\wordlock-results.txt).count
Write-Host -ForegroundColor Green "Results saved as '$pwd\wordlock-results.txt'."
Remove-Item -Path $pwd\words.txt -Force
pause