<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : 02.xsl
    Created on : 28 de abril de 2021, 23:01
    Author     : Oscar
    Description:
        Purpose of transformation follows.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    
    <xsl:output method="html" omit-xml-declaration="yes" encoding="UTF-8" indent="yes"/>
    <xsl:decimal-format name="euro" decimal-separator="," grouping-separator="."/>
    
    <xsl:template match="/listatickets">
        <xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html&gt;</xsl:text>
        
        <xsl:apply-templates select="comment()"/>   
        <xsl:text xml:space="preserve">
            <html>
                <head>
                    <META http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
                    <title>02 XSL Tickets Óscar Llamas Parra</title>
                    <meta charset="UTF-8"/>
                    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
                    <meta name="author" content="Oscar Llamas Parra"/>
                    <meta name="application-name" content="AppWeb de LMSGI"/>
                    <meta name="description" content="Informacion de tickets"/>
                    <meta name="keywords" content="tickets, total, xslt, xml"/>
                    <meta name="robots" content="index, follow"/>
                    <link href="02.css"  rel="stylesheet"       type="text/css" />
                    <link rel="icon" href="../../imagen/favicon.ico" type="image/x-icon"/>
                </head>
                <body>
                    <header>
                        Información de tickets
                    </header>
                        <h1>Listado de tickets</h1>
                        <xsl:apply-templates select="ticket"/>   
                    <p class="numeros"><xsl:value-of select="concat('Número de tickets: ',count(ticket))"/></p>
                    <p class="numeros"><xsl:value-of select="concat('Total de tickets: ',format-number(sum(ticket/producto/precio),'#,##' ,'euro'))"/></p>
                </body>
            </html>
        </xsl:text>
    </xsl:template>
    <xsl:template match="comment()">
        <xsl:text xml:space="preserve">
        <xsl:comment>
            <xsl:value-of select="."/>
        </xsl:comment>
        </xsl:text>
    </xsl:template>
    <xsl:template match="ticket">
        <div>
            <p class="numTicket">
                <xsl:value-of select="concat('Ticket: ',numero)"/>
            </p>
            <table>
                <tr>
                    <th>Producto</th>
                    <th>Precio</th>
                </tr>
                <xsl:apply-templates select="producto"/> 
                <tr>
                    <th>Total</th>
                    <th>
                        <xsl:value-of select="format-number(sum(producto/precio),'#,##' ,'euro')"/>
                    </th>
                </tr>  
            </table>
            <p class="fecha">
                <xsl:value-of select="concat('Fecha del ticket: ',substring(fecha,9,2),'-',substring(fecha,6,2),'-',substring(fecha,1,4))"/>
            </p>
            
        </div>
    </xsl:template>
    <xsl:template match="producto">
        <tr>
            <td>
                <xsl:value-of select="nombre"/>
            </td>
            <td class="price">
                <xsl:value-of select="format-number(precio,'#,##' ,'euro')"/>
            </td>
        </tr>
    </xsl:template>
</xsl:stylesheet>
