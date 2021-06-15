<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : 05ATexto.xsl.xsl
    Created on : 10 de junio de 2021, 9:30
    Author     : daw1
    Description:
        Purpose of transformation follows.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="text"/>

    <!-- TODO customize transformation rules 
         syntax recommendation http://www.w3.org/TR/xslt 
    -->
    <xsl:template match="mysqldump">
        <xsl:text>
            <xsl:value-of select="concat('CREATE DATABASE if NOT EXISTS ',database/@name,';')"/>
        </xsl:text>
        <xsl:apply-templates select="database/table_structure"/>
    </xsl:template>
    <xsl:template match="table_structure">
        <xsl:text>
            <xsl:value-of select="concat('CREATE TABLE ',@name,'(')"/>
            <xsl:apply-templates select="field"/>
            <xsl:value-of select="');'"/>
        </xsl:text>
    </xsl:template>
    <xsl:template match="field">
        <xsl:text>
            <xsl:value-of select="concat(@Field,' ',@Type,',')"/>
        </xsl:text>
    </xsl:template>
</xsl:stylesheet>
