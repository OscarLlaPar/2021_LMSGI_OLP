<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : 03.xsl
    Created on : 13 de abril de 2021, 12:58
    Author     : daw1
    Description:
        Purpose of transformation follows.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html"/>

    <!-- TODO customize transformation rules 
         syntax recommendation http://www.w3.org/TR/xslt 
    -->
    <xsl:template match="/horario">
        <html>
            <head>
                <title>Examen 03</title>
                <style>
                    *{
                        background-color: black;
                        color: white;
                    }
                    table,tr,th,td{
                        border: solid white 1px;
                        border-collapse: collapse;
                    }
                    table{
                        margin-top: 10px;
                        margin-bottom: 10px;
                    }
                    th,td{
                        padding: 5px;
                    }
                    th{
                        background-color:#3D3D3D; 
                    }
                    td{
                        font-size: 10px;
                    }
                    footer{
                        font-size: 8px;    
                        text-align: center;
                        padding-top: 20px;
                    }
                </style>
            </head>
            <body>
                <table>
                    <tr>
                        <th>Código del módulo</th>
                        <th>Nombre del módulo</th>
                    </tr>
                    <xsl:apply-templates select="modulos/modulo">
                        <xsl:sort select="@codM"/>
                    </xsl:apply-templates>
                </table>
                <table>
                    <tr>
                        <th>Código del profesor</th>
                        <th>Nombre del profesor</th>
                    </tr>
                    <xsl:apply-templates select="profesores/profesor">
                        <xsl:sort select="@codP"/>
                    </xsl:apply-templates>
                </table>
                <table>
                    <tr>
                        <th></th>
                        <th>Lunes</th>
                        <th>Martes</th>
                        <th>Miércoles</th>
                        <th>Jueves</th>
                        <th>Viernes</th>
                    </tr>
                   <xsl:apply-templates select="grupo/hora"/>
                </table>
                <footer>
                    Realizado por Óscar Llamas Parra
                </footer>  
            </body>
        </html>
    </xsl:template>
    <xsl:template match="modulos/modulo">
        <tr>
        <td>
            <xsl:value-of select="./@codM"/>
        </td>
        <td>
            <xsl:value-of select="current()"/>
        </td>
            <xsl:apply-templates select="dia_sem"/>
          
        
        
        </tr>
    </xsl:template>
    <xsl:template match="profesores/profesor">
        <tr>
        <td>
            <xsl:value-of select="./@codP"/>
        </td>
        <td>
            <xsl:value-of select="current()"/>
        </td>
            <xsl:apply-templates select="dia_sem"/>
          
        
        
        </tr>
    </xsl:template>
    <xsl:template match="grupo/hora">
        <tr>
        <td>
            <xsl:value-of select="concat('De ', @entrada,' a ', @salida)"/>
        </td>
        
            <xsl:apply-templates select="dia_sem"/>
        </tr>
    </xsl:template>
    <xsl:template match="dia_sem">
        
        <td>
            <xsl:attribute name="rowspan">
                <xsl:value-of select="@num"/>
            </xsl:attribute>
            <abbr>
                <xsl:attribute name="title">
                    <xsl:value-of select="current()"/>
                </xsl:attribute>
                <xsl:value-of select="//modulos/modulo[@codM=current()]"/>
            </abbr>
            <br/>
            <xsl:variable name="listaProfesores" select="//asignatura[@codM=current()]/@codProfesor"/>
            <xsl:apply-templates select="asignatura"/>
            <abbr>
                <xsl:attribute name="title">
                    <xsl:apply-templates select="//profesores/profesor[contains($listaProfesores,@codP)]"/>
                    <xsl:value-of select="$listaProfesores"/>
                </xsl:attribute>
            <xsl:value-of select="//profesores/profesor[@codP=//imparte/asignatura[@codM=current()]/@codProfesor]"/>
            </abbr>
        </td>
    </xsl:template>
    
    <xsl:template match="profesor" mode="xxx">
        <xsl:if test="position()!=1">
            <xsl:text>, </xsl:text>
        </xsl:if>
        <xsl:value-of select="text()"/>
    </xsl:template>
</xsl:stylesheet>
