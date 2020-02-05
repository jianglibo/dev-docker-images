$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path) -replace '\.Tests\.', '.'
. (Join-Path -Path $here -ChildPath $sut) -Debug


# Get-ChildItem -Recurse -Path .\local_folder\ -File | ForEach-Object { ($_ | Get-Content) -replace "123", "321" | Out-File -FilePath $_.FullName }

# https://pester.dev/docs/usage/mocking

# https://social.technet.microsoft.com/wiki/contents/articles/7703.powershell-running-executables.aspx#The_Call_Operator_amp

# $AllArgs = @('filename1', '-someswitch', 'C:\documents and settings\user\desktop\some other file.txt', '-yetanotherswitch')
# $AllArgs = "image", "help"
# & "docker" $AllArgs


# Invoke-RestMethod -Uri https://static.rust-lang.org/rustup/archive/1.20.2/x86_64-unknown-linux-gnu/rustup-init.sha256

# Invoke-WebRequest -Uri https://static.rust-lang.org/rustup/archive/1.20.2/1.40.0/rustup-init.sha256

# https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_functions_advanced_parameters?view=powershell-7

Describe 'Notepad' {
    It 'Exists in Windows folder' {
        'C:\Windows\notepad.exe' | Should -Exist
    }
}

Describe 'Replace version string' {
    $c = "$RUSTUP_VERSION_PLACEHOLDER,$RUST_VERSION_PLACEHOLDER"
    $testPath = "TestDrive:\Dockerfile.tpl"
    Set-Content $testPath -value $c

    $inDeepFolder = "TestDrive:\a\b\c\Dockerfile.tpl"
    New-Item -Path (Split-Path -Path $inDeepFolder -Parent) -ItemType Directory
    Set-Content $inDeepFolder -value $c

    $testPath = "TestDrive:\Dockerfile"
    $inDeepFolder = "TestDrive:\a\b\c\Dockerfile"
    
    $rust_version = "1.41.0"
    $rustup_version = "1.21.1"
    $should_be = "1.21.1,1.41.0"

    It 'replace direct subfolder.' {
        Update-VersionString -Path "TestDrive:" -RustVersion $rust_version -RustupVersion $rustup_version -RustupSha "abc" | Measure-Object | Out-Host
        Get-Content $testPath | Should -Be $should_be
        Get-Content $inDeepFolder | Should -Be $should_be
    }
}