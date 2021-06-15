<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : 05AXml.xsl
    Created on : 10 de junio de 2021, 9:09
    Author     : daw1
    Description:
        Purpose of transformation follows.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="xml" indent="yes"/>

    <!-- TODO customize transformation rules 
         syntax recommendation http://www.w3.org/TR/xslt 
    -->
    <xsl:template match="mysqldump/database">
        <xsl:element name="{current()/@name}">
            <xsl:apply-templates select="table_data"/>
        </xsl:element>
    </xsl:template>
    <xsl:template match="table_data">
        <xsl:element name="{current()/@name}">
                <xsl:apply-templates select="row"/>
            
        </xsl:element>
    </xsl:template>
    <xsl:template match="row">
        <row>
            
                <xsl:apply-templates select="field"/>
            
        </row>
    </xsl:template>
    <xsl:template match="field">
       <xsl:element name="{@name}">
            <xsl:value-of select="current()"/>
        </xsl:element>
    </xsl:template>
</xsl:stylesheet>
