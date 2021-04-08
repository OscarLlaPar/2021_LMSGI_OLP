<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : 03.xsl
    Created on : 15 de abril de 2020, 11:14
    Author     : amor
    Description:
       Manejar mútiples patrones o plantillas para obtener una pagina web
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html"/>
<!-- Creación de la estructura de la página web -->
    <xsl:template match="/alumnos">
        <html>
            <head>
                <meta charset="utf-8"/>
                <title>01-3 XSLT - Informacion de alumnos </title>
                <style>
                    *{
                        background-color: black;
                        color: white;
                    }
                    table,tr,th,td{
                        border: solid white 1px;
                        border-collapse: collapse;
                    }
                    th,td{
                        padding: 5px;
                    }
                    th{
                        background-color:#3D3D3D; 
                    }
                    footer{
                        font-size: 6px;    
                        text-align: center;
                    }
                </style>
            </head>
            <body>
                <h1>Listado de alumnos</h1>
                <table>
                    <tr>
                        <th>Nombre</th>
                        <th>Apellido</th>
                    </tr>
                        <xsl:apply-templates select="alumno"/>
                </table>
                <footer>
                    Realizado por Óscar Llamas Parra
                </footer>  
            </body>
        </html>
    </xsl:template>
    <xsl:template match="alumno">   
        <tr>
            <td>
                <xsl:value-of select="nombre"/>
            </td>
            <td>
                <xsl:value-of select="apellido"/>
            </td>
        </tr>
    </xsl:template>
</xsl:stylesheet>
