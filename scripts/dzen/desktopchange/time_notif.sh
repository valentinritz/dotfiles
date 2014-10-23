#/bin/bash

MOIS=$(date +%b)
JOUR=$(date +%d)
HEURE=$(date +%H)
MIN=$(date +%M)

if (($HEURE < 6)); then
    COM="...nuit... ...fatigue... mmmmmmh"
else
  if (( $HEURE < 12 )); then
      COM="Bonjour, doux oisilleau."
  else
    if (( $HEURE < 18 )); then
        COM="Mec, c'est l'heure de bosser, dtc."
    else
      if (( $HEURE < 24 )); then
          COM="Voici l'heure :"
      fi
    fi
  fi
fi

notify-send "$COM" "On est le $JOUR $MOIS à $HEURE : $MIN ."
