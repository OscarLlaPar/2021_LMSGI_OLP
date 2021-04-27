<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : museo2.xsl
    Created on : 27 de abril de 2021, 13:21
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
            <xsl:apply-templates select="nombre"/>
            <xsl:apply-templates select="ciudad"/>
        </xsl:element>
    </xsl:template>
    <xsl:template match="nombre">
        <xsl:element name="{name()}">
            <xsl:value-of select="current()"/>
        </xsl:element>
    </xsl:template>
    <xsl:template match="ciudad">
        <xsl:element name="{name()}">
            <xsl:attribute name="pais">
                <xsl:value-of select="../pais"/>
            </xsl:attribute>
            <xsl:value-of select="current()"/>
        </xsl:element>
    </xsl:template>
</xsl:stylesheet>
