#!/bin/bash

# Ottieni la lista di tutte le password in pass e salvale in un array
passwords=($(pass ls))

# Utilizza rofi per visualizzare la lista delle password e ottenere l'indice selezionato
selected_index=$(printf '%s\n' "${passwords[@]}" | rofi -dmenu -p "scegli password")

# Verifica se l'utente ha selezionato una password
if [ -n "$selected_index" ]; then
    # Ottieni la password corrispondente all'indice selezionato
    selected_password=$(pass show "${passwords[$selected_index]}")
    
    # Copia la password negli appunti (clipboard)
    echo -n "$selected_password" | xclip -selection clipboard

    # Notifica all'utente che la password è stata copiata negli appunti
#    notify-send "Password Copiata" "La password selezionata è stata copiata negli appunti."
fi
