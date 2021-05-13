<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : 08.xsl
    Created on : 13 de mayo de 2021, 9:12
    Author     : daw1
    Description:
        Purpose of transformation follows.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html"/>

    <!-- TODO customize transformation rules 
         syntax recommendation http://www.w3.org/TR/xslt 
    -->
    <xsl:template match="/">
        <html>
            <head>
                <title>Unidad 6 Ejercicio 08 Óscar Llamas</title>
                <link href="08.css"  rel="stylesheet"       type="text/css" />
            </head>
            <body>
                <h1>Predicción por munincipios</h1>
                <div>
                    <h2>
                        <xsl:value-of select="concat('EL TIEMPO: ',//municipio/nombre,' (',//municipio/provincia,')')"/>
                    </h2>
                    <table>
                        <tr>
                            <th>
                                Día
                            </th>
                            <th>
                                Prob. precip.
                            </th>
                            <th>
                                Estado del cielo
                            </th>
                            <th>
                                Temperatura (ºC)
                            </th>
                            <th>
                                Viento (km/h)
                            </th>
                        </tr>
                        <xsl:apply-templates select="prediccion/dia"/>
                    </table>
                </div>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="dia">
        <tr>
            <td>
                <xsl:value-of select="substring(@fecha,9)"/>
            </td>
            <td>
                <xsl:value-of select="concat(prob_precipitacion,'%')"/>
            </td>
            <td>
                <img>
                    <xsl:attribute name="src">
                        <xsl:value-of select="concat('images/',estado_cielo,'.gif')"/>
                    </xsl:attribute>
                    <xsl:attribute name="alt">
                        <xsl:value-of select="estado_cielo/@descripcion"/>
                    </xsl:attribute>
                </img>
            </td>
            <td>
                <span class="min">
                    <xsl:value-of select="temperatura/minima"/>
                </span>
                /
                <span class="max">
                    <xsl:value-of select="temperatura/maxima"/>
                </span>
            </td>
            <td>
                <img>
                    <xsl:attribute name="src">
                        <xsl:value-of select="concat('images/',viento/direccion,'.gif')"/>
                    </xsl:attribute>
                    <xsl:attribute name="alt">
                        <xsl:value-of select="viento/direccion"/>
                    </xsl:attribute>
                </img>
                <xsl:value-of select="viento/velocidad"/>
            </td>
        </tr>
    </xsl:template>
</xsl:stylesheet>
