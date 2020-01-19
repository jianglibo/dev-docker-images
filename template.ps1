Param(
    [Parameter(Mandatory=$false)]
    [String]
    $BuildGroup="centos7",

    [Parameter(Mandatory=$false)]
    [String]
    $DockerHubUserName="jianglibo",

    [Parameter(Mandatory=$false)]
    [ValidateSet("Build", "Push", "Pull")]
    [String]
    $Action="Build"

    # [Parameter(Mandatory=$true,
    # ParameterSetName="User")]
    # [String[]]
    # $UserName,

    # [Parameter(Mandatory=$false)]
    # [Switch]
    # $Summary
)

$Prefix = switch -Exact ($BuildGroup) {
    "centos7" {"c7"; Break}
    Default {
        Return "No matches for $BuildGroup"
    }
}

# find all Dockerfile under the specified directory build them in order.
$Dockerfiles = @("rust", "vcpkg", "ssh", "bk-over-ssh-cached", "bk-over-ssh-dev", "bk-over-ssh-run")

if (-not (Test-Path $BuildGroup)) {
    Return "Folder $BuildGroup doesn't exist."
}

$TargetFolder = Get-Item $BuildGroup

$SomeArgsArray = $Dockerfiles | ForEach-Object -Process {
    $FullFolderName = Join-Path -Path $TargetFolder -ChildPath $_
    @{tag="${DockerHubUserName}/${Prefix}-$_"; folder=$FullFolderName}
}

# https://stackoverflow.com/questions/29973212/pipe-complete-array-objects-instead-of-array-items-one-at-a-time
# https://stackoverflow.com/questions/19652498/powershell-an-empty-pipe-element-is-not-allowed
# it's a sub expression. $()
# copy an array: @($a;)
$(switch -Exact ($Action) {
    "Build" {
        $SomeArgsArray | ForEach-Object -Process {
            # docker build -t centos7/bk-over-ssh-cached centos7/bk-over-ssh-cached/
            ,@("build", "-t", $_.tag, $_.folder)
        }
    }
    "Push" {
        $SomeArgsArray | ForEach-Object -Process {
            # docker push jianglibo/bk-over-ssh-cached
            ,@("push", $_.tag)
        }
    }
    Default {
        ,@()
    }
}) | ForEach-Object -Process {& "docker" $_}


# https://social.technet.microsoft.com/wiki/contents/articles/7703.powershell-running-executables.aspx#The_Call_Operator_amp

# $AllArgs = @('filename1', '-someswitch', 'C:\documents and settings\user\desktop\some other file.txt', '-yetanotherswitch')
# $AllArgs = "image", "help"
# & "docker" $AllArgs

# Get-ChildItem -Recurse -Path .\local_folder\ -File| ForEach-Object {($_ | Get-Content) -replace "123","321" | Out-File -FilePath $_.FullName}

# Invoke-RestMethod -Uri https://static.rust-lang.org/rustup/archive/1.20.2/x86_64-unknown-linux-gnu/rustup-init.sha256

# Invoke-WebRequest -Uri https://static.rust-lang.org/rustup/archive/1.20.2/1.40.0/rustup-init.sha256

# https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_functions_advanced_parameters?view=powershell-7
