<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : 05.xsl
    Created on : 13 de mayo de 2021, 0:08
    Author     : Oscar
    Description:
        Purpose of transformation follows.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html"/>

    <!-- TODO customize transformation rules 
         syntax recommendation http://www.w3.org/TR/xslt 
    -->
    <xsl:template match="/">
        <html>
            <head>
                <link href="05.css"  rel="stylesheet"       type="text/css" />
                <title>05.xsl</title>
            </head>
            <body>
                <table>
                    <tr>
                        <th>
                            <xsl:attribute name="colspan">
                                <xsl:value-of select="4"/>
                            </xsl:attribute>
                            FACTURA NÚMERO <xsl:value-of select="//n_factura/text()"/>
                        </th>
                    </tr>
                    <tr>
                        <td class="apartado">
                            <xsl:attribute name="colspan">
                                <xsl:value-of select="4"/>
                            </xsl:attribute>
                            DATOS EMISOR
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <xsl:attribute name="colspan">
                                <xsl:value-of select="2"/>
                            </xsl:attribute>
                            <strong>RAZÓN SOCIAL: </strong><xsl:value-of select="//datos_emisor/nombre"/>
                        </td>
                        <td>
                            <xsl:attribute name="colspan">
                                <xsl:value-of select="2"/>
                            </xsl:attribute>
                            <strong>NIF/CIF: </strong><xsl:value-of select="//datos_emisor/cif"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <xsl:attribute name="colspan">
                                <xsl:value-of select="2"/>
                            </xsl:attribute>
                            DIRECCIÓN:
                        </td>
                        <td>
                            <xsl:attribute name="colspan">
                                <xsl:value-of select="2"/>
                            </xsl:attribute>
                            <xsl:value-of select="//datos_emisor/dir/text()"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <xsl:attribute name="colspan">
                                <xsl:value-of select="4"/>
                            </xsl:attribute>
                            DATOS DE CONTACTO
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <xsl:attribute name="colspan">
                                <xsl:value-of select="2"/>
                            </xsl:attribute>
                            TELÉFONO: <xsl:value-of select="//datos_emisor/num_tel/text()"/>
                        </td>
                        <td>
                            <xsl:attribute name="colspan">
                                <xsl:value-of select="2"/>
                            </xsl:attribute>
                            FAX: <xsl:value-of select="//datos_emisor/num_fax/text()"/>
                        </td>
                    </tr>
                    <tr>
                        <td class="apartado">
                            <xsl:attribute name="colspan">
                                <xsl:value-of select="4"/>
                            </xsl:attribute>
                            DATOS RECEPTOR
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <xsl:attribute name="colspan">
                                <xsl:value-of select="4"/>
                            </xsl:attribute>
                            <strong>NÚM. CLIENTE: </strong><xsl:value-of select="//datos_receptor/n_cli"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <xsl:attribute name="colspan">
                                <xsl:value-of select="2"/>
                            </xsl:attribute>
                            DIRECCIÓN:
                        </td>
                        <td>
                            <xsl:attribute name="colspan">
                                <xsl:value-of select="2"/>
                            </xsl:attribute>
                            <xsl:value-of select="//datos_receptor/dir/text()"/>
                        </td>
                    </tr>
                    <tr>
                        <td class="apartado">
                            <xsl:attribute name="colspan">
                                <xsl:value-of select="4"/>
                            </xsl:attribute>
                            RESUMEN FACTURA
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <xsl:attribute name="colspan">
                                <xsl:value-of select="2"/>
                            </xsl:attribute>
                            <strong>Número pedido: </strong><xsl:value-of select="//datos_factura/n_ped"/>
                        </td>
                        <td>
                            <strong>IVA: </strong><xsl:value-of select="//datos_factura/iva"/>
                        </td>
                        <td>
                            <strong>Forma de Pago: </strong><xsl:value-of select="//datos_factura/f_pago"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <xsl:attribute name="colspan">
                                <xsl:value-of select="2"/>
                            </xsl:attribute>
                            <strong>Moneda: </strong><xsl:value-of select="//datos_factura/moneda"/>
                        </td>
                        <td>
                            <xsl:attribute name="colspan">
                                <xsl:value-of select="2"/>
                            </xsl:attribute>
                            <strong>Fecha: </strong><xsl:value-of select="//datos_factura/fecha"/>
                        </td>
                        
                    </tr>
                    <tr>
                        <td class="apartado">
                            <xsl:attribute name="colspan">
                                <xsl:value-of select="4"/>
                            </xsl:attribute>
                            DETALLE FACTURA
                        </td>
                    </tr>
                    <tr>
                        <table class="dentro">
                            <tr>
                                <th>
                                    Ref
                                </th>
                                <th>
                                    Descripción
                                </th>
                                <th>
                                    Cantidad
                                </th>
                                <th>
                                    Precio
                                </th>
                                <th>
                                    Importe
                                </th>
                            </tr>
                        </table>
                    </tr>
                    <tr>
                        <td class="apartado">
                            <xsl:attribute name="colspan">
                                <xsl:value-of select="4"/>
                            </xsl:attribute>
                            IMPORTES FACTURA
                        </td>
                    </tr>
                </table>
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>
