$host.ui.rawui.BackgroundColor = [ConsoleColor]::Black

# Load posh-git example profile
. 'C:\tools\poshgit\dahlbyk-posh-git-869d4c5\profile.example.ps1'

$FixColors =
    $GitPromptSettings | gm |? {
        $_.MemberType -eq 'NoteProperty'
    } |% {
        $_.Name
    } |? {
        $GitPromptSettings."$_" -eq 'DarkRed'
    };

# $global:GitPromptSettings.WorkingForegroundColor    = [ConsoleColor]::Red
# $global:GitPromptSettings.UntrackedForegroundColor  = [ConsoleColor]::Red

$FixColors |% { $GitPromptSettings."$_" = [System.ConsoleColor]::Red }

Rename-Item Function:\Prompt PoshGitPrompt -Force
function Prompt() {
    if(Test-Path Function:\PrePoshGitPrompt) {
        ++$global:poshScope;
        New-Item function:\script:Write-host -value "param([object] `$object, `$backgroundColor, `$foregroundColor, [switch] `$nonewline) " -Force | Out-Null;
        $private:p = PrePoshGitPrompt; if(--$global:poshScope -eq 0) {
            Remove-Item function:\Write-Host -Force
        }
    }
    PoshGitPrompt
}

$OrigBgColor = $host.ui.rawui.BackgroundColor
$OrigFgColor = $host.ui.rawui.ForegroundColor

# MSBUILD has a nasty habit of leaving the foreground color red
# # if you Ctrl+C while it is outputting errors.
function Reset-Colors {
    $host.ui.rawui.BackgroundColor = $OrigBgColor
    $host.ui.rawui.ForegroundColor = $OrigFgColor
}
