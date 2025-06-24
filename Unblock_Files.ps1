param(
    [string]$TargetFolder
)

if (!(Test-Path -Path $TargetFolder)) {
    Write-Error "❌ Pasta '$TargetFolder' não existe. Verifique o caminho."
    exit 1
}

Write-Host "🔓 Desbloqueando arquivos em '$TargetFolder'..."

try {
    Get-ChildItem -Path $TargetFolder -Recurse | Unblock-File -ErrorAction SilentlyContinue
    Write-Host "✅ Arquivos desbloqueados com sucesso em '$TargetFolder'."
} catch {
    Write-Error "❌ Ocorreu um erro ao tentar desbloquear os arquivos: $_"
    exit 1
}

Write-Host "🎉 Processo concluído com sucesso!"
