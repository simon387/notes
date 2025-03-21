$repoPath = "C:\g"  # Cambia con la tua cartella dei repo
$gitUsername = "simon387"  # Modifica con il tuo GitHub username
$remoteType = "https"  # Cambia in "ssh" se usi SSH

# Trova tutti i repository nella cartella
Get-ChildItem -Path $repoPath -Directory | ForEach-Object {
    $repo = $_.FullName
    Write-Host "🔄 Controllando repository: $repo"
    Set-Location $repo

    # Controlla se il repository ha un remote valido
    $remote = git remote get-url origin 2>$null
    if (-not $remote -or $remote -eq "") {
        Write-Host "⚠️ Nessun remote trovato. Aggiungo 'origin'..."
        
        if ($remoteType -eq "https") {
            $newRemote = "https://github.com/$gitUsername/$($_.Name).git"
        } else {
            $newRemote = "git@github.com:$gitUsername/$($_.Name).git"
        }

        git remote add origin $newRemote
    }

    # Controlla se l'URL del remote è accessibile
    $testRemote = git ls-remote origin 2>$null
    if (-not $testRemote) {
        Write-Host "⚠️ Remote non accessibile. Correggo..."
        git remote remove origin
        git remote add origin $newRemote
    }

    # Push forzato di tutti i branch e tag
    Write-Host "🚀 Push forzato in corso..."
    git push origin --all --force
    git push origin --tags --force
}

Write-Host "✅ Tutti i repository sono stati aggiornati correttamente!"
