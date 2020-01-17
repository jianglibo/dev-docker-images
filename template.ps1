Param(
    [Parameter(Mandatory=$true,
    ParameterSetName="Computer")]
    [String[]]
    $ComputerName,

    [Parameter(Mandatory=$true,
    ParameterSetName="User")]
    [String[]]
    $UserName,

    [Parameter(Mandatory=$false)]
    [Switch]
    $Summary
)

Get-ChildItem -Recurse -Path .\local_folder\ -File| ForEach-Object {($_ | Get-Content) -replace "123","321" | Out-File -FilePath $_.FullName}

Invoke-RestMethod -Uri https://static.rust-lang.org/rustup/archive/1.20.2/x86_64-unknown-linux-gnu/rustup-init.sha256

Invoke-WebRequest -Uri https://static.rust-lang.org/rustup/archive/1.20.2/1.40.0/rustup-init.sha256

https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_functions_advanced_parameters?view=powershell-7
