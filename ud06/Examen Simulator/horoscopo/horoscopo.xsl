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
    <xsl:include href="../../lib/web.xsl"/>
    <xsl:include href="../signos.xsl"/>
    <!-- TODO customize transformation rules 
         syntax recommendation http://www.w3.org/TR/xslt 
    -->
    <xsl:template match="/">
        <xsl:call-template name="docTipo"/>
        <html>
            <head>
                <xsl:call-template name="metaweb"> 
                    <xsl:with-param name="titulo" select="'Consulta del signo'"/>
                    <xsl:with-param name="descripcion" select="'Consulta del signo'"/>
                </xsl:call-template>
                <link href="../css/estilos.css"  rel="stylesheet"       type="text/css" />
                <!--<title>Unidad 6 Ejercicio 08 Óscar Llamas</title>-->
                
            </head>
            <body>
                <div class="padre">
                    <h1>HOROSCOPO<xsl:value-of select="document('signos.xml')//signo[@id=current()//sign/@id]/nombre"/></h1>
                </div>
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>
