#!/bin/bash
# Navegar al directorio donde se encuentra este archivo
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd "$DIR"

PORT=8000

echo "=========================================================="
echo "   🏢 Visor Inmobiliario 3D - Proyecto Delta"
echo "=========================================================="
echo ""
echo "Iniciando servidor de desarrollo en http://localhost:$PORT..."
echo ""

# Abrir el navegador tras 1 segundo
(sleep 1 && open "http://localhost:$PORT") &

# Ejecutar servidor Ruby nativo de macOS
ruby server.rb $PORT
