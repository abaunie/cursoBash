#/bin/bash

//Comprobamos que recibimos alo menos un parámetro
if [[ $# -ne 0 ]]; then
  //comprobamos que o primeiro parámetro sea c ou s
  if [[ $1 == "c" || $1 == "s" ]]; then
    //comprobamos que o segundo parámetros sexa un parámetro pertencente ao sistema
    if [[ -f $2 ]]; then
      echo "Habemus espacio"
      if [[ $1 == "c" ]]; then
        speedtest-cli
      elif [[ $1 == "s" ]]; then 
        speedtest-cli --simple | awk '{$2}' >> $2
      fi
    else
      echo "Entrada incorrecta, debe ser coma segue: ./velocidade.sh c nombredelarchivo.extension"
    fi
  else
    echo "Erro, no primeiro parámetro no es ni "c" ni "s" "
  fi
else
  echo "Erro, faltan parámetros"
fi
  
