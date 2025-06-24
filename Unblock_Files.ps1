param (
    [Parameter(Mandatory = $true, HelpMessage = "Informe o caminho da pasta de arquivos a desbloquear.")]
    [string]$path
)

# 🚀 Verificar se o caminho informado existe
if (-Not (Test-Path -Path $path)) {
    Write-Host "❌ O caminho especificado '$path' não existe. Verifique e tente novamente." -ForegroundColor Red
    exit 1
}

# 🔓 Desbloquear arquivos
Write-Host "🔓 Desbloqueando arquivos em '$path'..." -ForegroundColor Cyan

try {
    Get-ChildItem -Path $path -Recurse -ErrorAction Stop | Unblock-File -ErrorAction SilentlyContinue
    Write-Host "✅ Arquivos desbloqueados com sucesso." -ForegroundColor Green
}
catch {
    Write-Host "⚠️ Ocorreu um erro ao tentar desbloquear os arquivos: $_" -ForegroundColor Red
    exit 1
}
