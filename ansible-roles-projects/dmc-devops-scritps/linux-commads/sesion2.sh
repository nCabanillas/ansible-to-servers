demo.sh
# Proceso en background
#!/bin/bash
while [ true ]; do
    echo "Escribiendo"
    echo "hi" >> hi.log
    sleep 2
done



#Bash Scripting: Condicionales
#!/bin/bash
if [ "$1" == "hola" ]; then
    echo "Bienvenido "$USER
elif [ "$1" == "adios" ]; then
    echo "Hasta pronto"$USER
else
    echo "Option not found"
fi


#Bash Scripting: Case
#!/bin/bash
case $1 in
    "hola")
        echo "Bienvenido "$USER
	;;
    "adios" | "bye")
        echo "Hasta pronto "$USER
	;;
    *)
    echo "Option not found"
	;;
esac


#!/bin/bash
if [ -z $1 -];

if [ $1 -gt $2 ]; then
    echo X is greater than Y
elif [ $1 -lt $2 ]; then
    echo X is less than Y
elif [ $1 -eq $2 ]; then
    echo X is equal to Y
fi
