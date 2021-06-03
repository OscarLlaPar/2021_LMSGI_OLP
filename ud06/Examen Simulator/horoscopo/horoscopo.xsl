<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : horoscopo.xsl
    Created on : 14 de junio de 2019, 11:12
    Author     : 
    Description:
        Mostrar horoscopo / los signos del zodiaco
	-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html"/>
    <xsl:include href="../signos.xsl"/>
    <!-- TODO customize transformation rules 
         syntax recommendation http://www.w3.org/TR/xslt 
    -->
    <xsl:template match="/">
        <!--<xsl:call-template name="docTipo"/>-->
        <html>
            <head>
                <!--<xsl:call-template name="metaweb"> 
                    <xsl:with-param name="titulo" select="'Consulta del signo'"/>
                    <xsl:with-param name="descripcion" select="'Consulta del signo'"/>
                </xsl:call-template>-->
                <link href="../css/estilos.css"  rel="stylesheet"       type="text/css" />
                <!--<title>Unidad 6 Ejercicio 08 Óscar Llamas</title>-->
                
            </head>
            <body>
                <div class="padre">
                    <div class="contimg">
                    <img class="fondo">
                        <xsl:attribute name="src">
                            <xsl:value-of select="concat('../images/bg-',horoscope/sign/@id,'.jpg')"/>
                        </xsl:attribute>
                        <xsl:attribute name="alt">
                            <xsl:value-of select="concat('Consulta el horóscopo de ',nombre)"/>
                        </xsl:attribute>
                    </img>
                    <img class="imgsigno">
                        <xsl:attribute name="src">
                            <xsl:value-of select="concat('../images/',horoscope/sign/@id,'.svg')"/>
                        </xsl:attribute>
                        <xsl:attribute name="alt">
                            <xsl:value-of select="concat('Consulta el horóscopo de ',nombre)"/>
                        </xsl:attribute>
                    </img>
                    </div>
                    <h1>HOROSCOPO <xsl:value-of select="document('../signos.xml')//signo[@id=current()//sign/@id]/nombre"/></h1>
                    <h3>Predicción para hoy <xsl:value-of select="document('../signos.xml')//signo[@id=current()//sign/@id]/fecha"/></h3>
                    <div class="pred">
                        <p><xsl:value-of select="horoscope/sign/message"/></p>
                    </div>
                </div>
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>
