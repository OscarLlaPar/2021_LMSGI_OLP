<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : signos.xsl
    Created on : 14 de junio de 2019, 11:12
    Author     : 
    Description:
        Mostrar horoscopo / los signos del zodiaco
	-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method="html"/>
        <xsl:include href="../lib/web.xsl"/>
        <xsl:template match="/">
            <html>
                <xsl:call-template name="docTipo"/> 
                <head>
                    <xsl:call-template name="metaweb"> 
                        <xsl:with-param name="titulo" select="'Signos del horóscopo'"/>
                        <xsl:with-param name="descripcion" select="'Signos del horóscopo'"/>
                    </xsl:call-template>
                    <!--<title>Unidad 6 Ejercicio 08 Óscar Llamas</title>-->
                    <link href="css/estilos.css"  rel="stylesheet"       type="text/css" />
                </head>
                <body>
                    <h1>HORÓSCOPO/SIGNOS DEL ZODÍACO</h1>
                    <div class="padre">
                        <xsl:apply-templates select="horoscopo/signo"/>
                    </div>
                    
                </body>
            </html> 
        </xsl:template>
        
        <xsl:template match="signo">
            <div class="signo">
                <div class="contimg">
                    <img class="fondo">
                        <xsl:attribute name="src">
                            <xsl:value-of select="concat('images/bg-',@id,'.jpg')"/>
                        </xsl:attribute>
                        <xsl:attribute name="alt">
                            <xsl:value-of select="concat('Consulta el horóscopo de ',nombre)"/>
                        </xsl:attribute>
                    </img>
                    <abbr>
                        <xsl:attribute name="title">
                            <xsl:value-of select="concat('Consulta el horóscopo de ',nombre)"/>
                        </xsl:attribute>
                        <a>
                            <xsl:attribute name="href">
                                <xsl:value-of select="concat('horoscopo/',nombre,'/horoscopo.xml')"/>
                            </xsl:attribute>
                            <img class="imgsigno">
                                <xsl:attribute name="src">
                                    <xsl:value-of select="concat('images/',@id,'.svg')"/>
                                </xsl:attribute>
                                <xsl:attribute name="alt">
                                    <xsl:value-of select="concat('Consulta el horóscopo de ',nombre)"/>
                                </xsl:attribute>
                            </img>
                        </a>
                    </abbr>
                </div>    
                <h2>
                    <xsl:value-of select="nombre"/>
                </h2>
                <div class="fecha">
                    <p>
                        <xsl:value-of select="fecha"/>
                    </p>
                </div>    
            </div>
        </xsl:template>
        
</xsl:stylesheet>
