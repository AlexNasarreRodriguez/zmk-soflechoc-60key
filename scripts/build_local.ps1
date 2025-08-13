param(
    [string]$Board = "nice_nano_v2",
    [string]$Shield = "sofle_left",
    [string]$Snippet = "studio-rpc-usb-uart",
    [switch]$NoPull
)

$ErrorActionPreference = "Stop"

function Require-Command {
    param([string]$Name)
    if (-not (Get-Command $Name -ErrorAction SilentlyContinue)) {
        Write-Error "'$Name' no está instalado o no está en PATH. Instálalo y vuelve a intentarlo."
    }
}

# 1) Pre-checks
Require-Command docker

# 2) Paths y variables
$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$RepoRoot  = Resolve-Path (Join-Path $ScriptDir "..")
$HostPath  = ($RepoRoot.Path -replace '\\','/')
$Image     = "zmkfirmware/zmk-build-arm:stable"
$WorkDir   = "/workdir"

# 3) Construir comando 'west build'
$BuildDir  = "build/$Board-$($Shield -replace ' +','_')"
$westArgs  = "-s zmk/app -d $BuildDir -b $Board"
if ($Snippet -and $Snippet.Trim() -ne "") { $westArgs = "$westArgs -S $Snippet" }

# Aseguramos que el módulo externo esté disponible explícitamente
# Nota: En PowerShell, para comillas dobles literales dentro de una cadena con expansión, usa el escape con backtick `"
$cmakeArgs = "-DZMK_CONFIG=$WorkDir/config -DSHIELD=`"$Shield`" -DZMK_EXTRA_MODULES=$WorkDir/ZMKprommtbehaviors"

$Cmd = @(
    "set -e",
    "[ -d .west ] || west init -l config",
    "west config manifest.path config || true",
    "west update --fetch-opt=--filter=tree:0",
    "west zephyr-export",
    "west build $westArgs -- $cmakeArgs"
) -join '; '

# 4) Construcción del contenedor y ejecución
if (-not $NoPull) {
    Write-Host "[INFO] Descargando/actualizando imagen $Image ..." -ForegroundColor Cyan
    docker pull $Image | Out-Host
}

Write-Host "[INFO] Ejecutando build en contenedor..." -ForegroundColor Cyan
$MountSpec = ('{0}:{1}' -f $HostPath, $WorkDir)
$dockerArgs = @(
    'run','--rm','-t',
    '-v', $MountSpec,
    '-w', $WorkDir,
    $Image,
    'sh','-lc', $Cmd
)

Write-Host ("[DEBUG] docker " + ($dockerArgs -join ' ')) -ForegroundColor DarkGray

# Ejecutar
& docker @dockerArgs

if ($LASTEXITCODE -ne 0) {
    Write-Error ("Build falló en el contenedor. Código: {0}" -f $LASTEXITCODE)
    exit $LASTEXITCODE
}

Write-Host "[OK] Build finalizada." -ForegroundColor Green
Write-Host "    Artefactos esperados: $BuildDir/zephyr/ (zmk.uf2, .bin, etc.)" -ForegroundColor Green
