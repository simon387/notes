#!/bin/bash

# Configurazione
REPO_PATH="/c/g"  # Percorso dei repository (formato Unix per Git Bash)
OLD_EMAIL="simone.celia@eng.it"
NEW_EMAIL="simone.celia@simonecelia.it"
NEW_NAME="Simone Celia"

# Funzione per processare un singolo repository
process_repo() {
    local repo="$1"
    echo "===================================================="
    echo "Modificando repository: $repo"
    cd "$repo"
    
    # Verifica che sia un repository Git
    if [ -d ".git" ]; then
        echo "Repository Git trovato, applico le modifiche..."
        
        # Esegui filter-branch
        git filter-branch --force --env-filter "
        if [ \"\$GIT_COMMITTER_EMAIL\" = \"$OLD_EMAIL\" ]; then
            export GIT_COMMITTER_NAME=\"$NEW_NAME\"
            export GIT_COMMITTER_EMAIL=\"$NEW_EMAIL\"
        fi
        if [ \"\$GIT_AUTHOR_EMAIL\" = \"$OLD_EMAIL\" ]; then
            export GIT_AUTHOR_NAME=\"$NEW_NAME\"
            export GIT_AUTHOR_EMAIL=\"$NEW_EMAIL\"
        fi
        " --tag-name-filter cat -- --branches --tags
        
        # Verifica se il remote origin esiste
        if ! git remote get-url origin &>/dev/null; then
            echo "⚠️ Nessun remote origin trovato. Provo ad aggiungerlo..."
            
            # Ottieni il nome del repository dalla cartella
            repo_name=$(basename "$repo")
            
            if [ -z "$repo_name" ]; then
                echo "❌ Impossibile determinare il nome del repository. Skipping..."
                return
            fi
            
            repo_url="https://github.com/simon387/$repo_name.git"
            echo "Aggiungendo il remote: $repo_url"
            git remote add origin "$repo_url"
        fi
        
        # Push forzato a GitHub
        echo "🚀 Push delle modifiche..."
        git push origin --force --all
        git push origin --force --tags
        
        # Aggiorna configurazione locale
        git config user.email "$NEW_EMAIL"
        git config user.name "$NEW_NAME"
        
        echo "✅ Repository $repo_name aggiornato!"
    else
        echo "Non è un repository Git, salto..."
    fi
}

# Funzione principale
main() {
    echo "Inizio aggiornamento email in tutti i repository in $REPO_PATH"
    
    # Trova tutti i repository
    for repo_dir in "$REPO_PATH"/*; do
        if [ -d "$repo_dir" ]; then
            process_repo "$repo_dir"
        fi
    done
    
    echo "===================================================="
    echo "Tutti i repository sono stati processati!"
}

# Esegui lo script
main