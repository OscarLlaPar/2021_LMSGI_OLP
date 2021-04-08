<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : 01.xsl
    Created on : 8 de abril de 2021, 9:08
    Author     : daw1
    Description:
        Purpose of transformation follows.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html"/>

    <!-- TODO customize transformation rules 
         syntax recommendation http://www.w3.org/TR/xslt 
    -->
    <xsl:template match="/edificio">
        <html>
            <head>
                <meta charset="utf-8"/>
                <title>UD06EJ01 Óscar Llamas Parra</title>
                <style>
                    *{
                        background-color: black;
                        color: white;
                    }
                    h1{
                        text-decoration:underline;
                    }
                    footer{
                        font-size: 6px;    
                        text-align: center;
                    }
                    ul{
                       list-style: none; 
                    }
                    ul li{
                        font-size: 12px;
                    }
                    ol li{
                        font-size: 10px;
                    }
                    p{
                        font-size: 8px;
                        margin: 1px;
                    }
                    
                </style>
            </head>
            <body>
                <h1>Información de las viviendas</h1>
                <ul>
                    <xsl:apply-templates select="vivienda"/>
                </ul>
                <p>Número de viviendas: <xsl:value-of select="count(vivienda)"/></p>
                <p>Número total de vecinos: <xsl:value-of select="count(vivienda/vecinos/nombre)"/></p>
                <footer>
                    Realizado por Óscar Llamas Parra
                </footer>  
            </body>
        </html>
    </xsl:template>
    <xsl:template match="vivienda">   
        <li>
            <xsl:value-of select="concat('Piso: ',piso,', ')"/>
            <xsl:value-of select="concat('Puerta: ',puerta)"/>
            <ol>
                <xsl:apply-templates select="vecinos"/>   
            </ol>
        </li>
    </xsl:template>
    <xsl:template match="vecinos">   
            <xsl:apply-templates select="nombre"/>       
    </xsl:template>
    <xsl:template match="nombre">   
        <li>
            <xsl:value-of select="."/>
        </li>   
    </xsl:template>
</xsl:stylesheet>
