#Set-AdUserPwd -user "user" -oldpwd (ConvertTo-SecureString -AsPlainText "P@ssw0rd" -Force) -newpwd (ConvertTo-SecureString -AsPlainText "P@ssw0rd" -Force)

Function Set-AdUserPwd
{
    Param(
        [string]$user,
        [securestring]$oldpwd,
        [securestring]$newpwd
    ) #end param

    $user = (Get-ADUser $user).DistinguishedName
    Set-ADAccountPassword -Identity $user -NewPassword $newpwd -OldPassword $oldpwd -WhatIf
} # end function Set-AdUserPwd
