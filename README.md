# pbi-tools

## Overview
pbi-tools is a command-line tool for managing Power BI projects. It provides various functionalities to help you automate and streamline your Power BI development workflow.

## Installation
- Descargar **pbi-tools.1.2.0.zip** de [enlace](https://github.com/pbi-tools/pbi-tools/releases/download/1.2.0/pbi-tools.1.2.0.zip)
- Agregar a variables de entorno para acceder al ejecutable


Abrir CMD en el directorio del reporte PBIX

## Extraer desde archivo PBIX a Directorio
```sh
pbi-tools extract Reporte.pbix -extractFolder Dashboard
```

### Generar archivo PBIT en directorio **PBIT**
```sh
pbi-tools compile Dashboard/ PBIT PBIT
```