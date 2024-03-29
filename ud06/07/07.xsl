<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : 07.xsl
    Created on : 11 de mayo de 2021, 12:32
    Author     : daw1
    Description:
        Purpose of transformation follows.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html"/>
    <xsl:param name="corregido" select="'si'"/>
    <!-- TODO customize transformation rules 
         syntax recommendation http://www.w3.org/TR/xslt 
    -->
    <xsl:template match="/">
        <html>
            <head>
                <link href="07.css"  rel="stylesheet"       type="text/css" />
                <title>07 XSL - Test 
                <xsl:value-of select="//nombreModulo"/>
                 Óscar Llamas Parra
                </title>
            </head>
            <body>
                <h1><xsl:value-of select="//nombreCiclo"/></h1>
                <h2><xsl:value-of select="document('1dawModulos.xml')//modulo[@codM=current()//nombreModulo]/text()"/></h2>
                <h3>Fecha: <xsl:value-of select="concat(//dia,' de ',document('meses.xml')//mes[@id=current()//fecha/mes]/text(),' de',//anyo)"/></h3>
                <form action="test.php" method="get">
                        <xsl:apply-templates select="//pregunta"/>
                        <xsl:if test="$corregido!='no'">
                            <div id="botones">
                                <input type="submit" value="Enviar"/>
                                <input type="submit" value="Borrar"/>
                            </div>
                        </xsl:if>
                </form>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="pregunta">
        <fieldset>
            <xsl:value-of select="concat(@id,'.- ',enunciado)"/>
            <xsl:apply-templates select="respuestas/respuesta"/>
        </fieldset>
    </xsl:template>
    <xsl:template match="respuesta">
        <div class="respuesta">
            <label>
                <input type="radio">
                    <xsl:attribute name="name">
                        <xsl:value-of select="concat('p',../../@id)"/>
                    </xsl:attribute>
                    <xsl:attribute name="value">
                        <xsl:value-of select="position()"/>
                    </xsl:attribute>
                    <xsl:if test="$corregido='si'">
                        <xsl:attribute name="disabled"/>
                        <xsl:if test="@correcta='correcta'">
                            <xsl:attribute name="checked"/>
                        </xsl:if>
                    </xsl:if>
                </input>
                <xsl:value-of select="current()"/>
            </label>
        </div>
    </xsl:template>
</xsl:stylesheet>
