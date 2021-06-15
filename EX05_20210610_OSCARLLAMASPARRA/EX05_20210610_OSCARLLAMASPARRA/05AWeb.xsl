<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : 05AWeb.xsl
    Created on : 10 de junio de 2021, 8:39
    Author     : daw1
    Description:
        Purpose of transformation follows.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html"/>
    <xsl:include href="lib/web.xsl"/>
    <!-- TODO customize transformation rules 
         syntax recommendation http://www.w3.org/TR/xslt 
    -->
    <xsl:template match="mysqldump/database">
        <html>
            <head>
                <xsl:call-template name="metaweb"> 
                    <xsl:with-param name="titulo" select="'Examen 05 - LMSGI'"/>
                    <xsl:with-param name="descripcion" select="'Examen 05 - LMSGI'"/>
                </xsl:call-template>
                <link href="css/estilo.css"  rel="stylesheet"       type="text/css" />
            </head>
            <body>
                <div>
                    <h1>Base de datos: <xsl:value-of select="@name"/></h1>
                </div>
                <xsl:apply-templates select="table_data"/>
                
                <footer>
                    <div>Realizado por: Óscar Llamas Parra</div>
                </footer>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="table_data">
        <div>
            <h2>Tabla: <xsl:value-of select="current()/@name"/></h2>
            
        </div>
        <table>
            <tr>
        
            <xsl:apply-templates select="row/field"/>
        
       </tr>
                <xsl:apply-templates select="row"/>
            
                </table>
    </xsl:template>
    <xsl:template match="row">
       
        <tr>
            <xsl:apply-templates select="field" mode="datos"/>
        </tr>
        
    </xsl:template>
    
    <xsl:template match="field">
        <th>
            <xsl:value-of select="@name"/>
        </th>       
        
    </xsl:template>
    <xsl:template match="field" mode="datos">
        
            <td>
                <xsl:value-of select="current()/text()"/>
            </td>
       
    </xsl:template>
</xsl:stylesheet>
