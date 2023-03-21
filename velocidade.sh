#/bin/bash

#Comprobamos que recibimos alo menos un parámetro
if [[ $# -ne 0 ]]; then
  #comprobamos que o primeiro parámetro sea c ou s
  if [[ $1 == "c" || $1 == "s" ]]; then
    #comprobamos que o segundo parámetros sexa un parámetro pertencente ao sistema
    if [[ -f $2 ]]; then
      if [[ $1 == "c" ]]; then
        speedtest-cli  | awk '$1 ~ /^Download|^Upload/' | awk '{print $2}' > $2
      elif [[ $1 == "s" ]]; then 
        speedtest-cli --simple | awk '{print $2}' | tail -2 > $2
      fi
      #hai valores dentro do ficheiro
      if [[ `tail -1 $2` > 3.0 ]]; then
        echo "a tua conexion e rapida"
      else
	      echo "a tua conexion e lenta"
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
  
