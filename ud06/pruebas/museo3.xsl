<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : museo3.xsl
    Created on : 27 de abril de 2021, 13:49
    Author     : daw1
    Description:
        Purpose of transformation follows.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="xml" indent="yes"/>

    <!-- TODO customize transformation rules 
         syntax recommendation http://www.w3.org/TR/xslt 
    -->
    <xsl:template match="/">
        <museos>
            <xsl:apply-templates select="museos/museo"/>
        </museos>
    </xsl:template>
    <xsl:template match="museo">
        <xsl:element name="{name()}">
            <xsl:element name="nombre">
                <xsl:value-of select="@nombre"/>
            </xsl:element>
            <xsl:element name="ciudad">
                <xsl:value-of select="@ciudad"/>
            </xsl:element>
            <xsl:element name="pais">
                <xsl:value-of select="@pais"/>
            </xsl:element>
        </xsl:element>
    </xsl:template>
</xsl:stylesheet>
