<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : 02.xsl
    Created on : 28 de abril de 2021, 23:01
    Author     : Oscar
    Description:
        Purpose of transformation follows.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html"/>

    <!-- TODO customize transformation rules 
         syntax recommendation http://www.w3.org/TR/xslt 
    -->
    <xsl:template match="/listatickets">
        <html>
            <head>
                <title>02 XSL Tickets Óscar Llamas Parra</title>
                <link href="02.css"  rel="stylesheet"       type="text/css" />
            </head>
            <body>
                <header>
                    Información de tickets
                </header>
                
                    <h1>Listado de tickets</h1>
                    <xsl:apply-templates select="ticket"/>   
                    
                <p class="numeros"><xsl:value-of select="concat('Número de tickets: ',count(ticket))"/></p>
                <p class="numeros"><xsl:value-of select="concat('Total de tickets: ',sum(ticket/producto/precio))"/></p>
            </body>
        </html>
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
                        <xsl:value-of select="sum(producto/precio)"/>
                    </th>
                </tr>  
            </table>
            <p class="fecha">
                <xsl:value-of select="concat('Fecha del ticket: ',fecha)"/>
            </p>
            
        </div>
    </xsl:template>
    <xsl:template match="producto">
        <tr>
            <td>
                <xsl:value-of select="nombre"/>
            </td>
            <td class="price">
                <xsl:value-of select="precio"/>
            </td>
        </tr>
    </xsl:template>
</xsl:stylesheet>
