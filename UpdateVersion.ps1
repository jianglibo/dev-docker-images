Param(
    [Parameter(Mandatory=$false)]
    [String]
    $RustVersion="1.41.0",

    [Parameter(Mandatory=$false)]
    [String]
    $RustupVersion="1.21.1",
    [Parameter(Mandatory=$false)]
    [String]
    $Arch="x86_64-unknown-linux-gnu"
)

Set-StrictMode -Version Latest
$RUSTUP_VERSION_PLACEHOLDER="%%RUSTUP-VERSION%%"
$RUST_VERSION_PLACEHOLDER="%%RUST-VERSION%%"
$RUSTUP_SHA_PLACEHOLDER="%%RUSTUP-SHA%%"

function Update-VersionString($Path, $RustVersion, $RustupVersion, $RustUpSha) {
    Get-ChildItem -Recurse -Path $Path -File | Where-Object Name -eq "Dockerfile.tpl" | ForEach-Object -Process {
        $Content = $_ | Get-Content;
        $Content = $Content -replace $RUST_VERSION_PLACEHOLDER, $RustVersion;
        $Content = $Content -replace $RUSTUP_VERSION_PLACEHOLDER,$RustupVersion;
        $Content = $Content -replace $RUSTUP_SHA_PLACEHOLDER,$RustUpSha;
        $Content | Out-File -FilePath $_.FullName.Substring(0, $_.FullName.Length - 4) -Encoding Ascii
    }
}

if ($DebugPreference -ne "Inquire") {
    $here = Split-Path -Parent $MyInvocation.MyCommand.Path
    $RustUpSha = (Invoke-RestMethod -Uri "https://static.rust-lang.org/rustup/archive/${RustupVersion}/${Arch}/rustup-init.sha256") -split "\s+" | Select-Object -First 1
    Update-VersionString -Path $here -RustVersion $RustVersion -RustupVersion $RustupVersion -RustupSha $RustupSha
}



# https://social.technet.microsoft.com/wiki/contents/articles/7703.powershell-running-executables.aspx#The_Call_Operator_amp

# $AllArgs = @('filename1', '-someswitch', 'C:\documents and settings\user\desktop\some other file.txt', '-yetanotherswitch')
# $AllArgs = "image", "help"
# & "docker" $AllArgs

# Invoke-RestMethod -Uri https://static.rust-lang.org/rustup/archive/1.20.2/x86_64-unknown-linux-gnu/rustup-init.sha256

# Invoke-WebRequest -Uri https://static.rust-lang.org/rustup/archive/1.20.2/1.40.0/rustup-init.sha256

# https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_functions_advanced_parameters?view=powershell-7

