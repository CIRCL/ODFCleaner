<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
  xmlns:draw="urn:oasis:names:tc:opendocument:xmlns:drawing:1.0"
  xmlns:office="urn:oasis:names:tc:opendocument:xmlns:office:1.0"
  xmlns:style="urn:oasis:names:tc:opendocument:xmlns:style:1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
>
  <xsl:include href="shared.xsl"/>

  <!-- convert draw:fit-to-size='true' to style:shrink-to-size='true' -->
  <xsl:template match="@draw:fit-to-size[not(parent::style:shrink-to-size) and .='true']">
    <xsl:message>Convert draw:fit-to-size='true' to style:shrink-to-size='true'.</xsl:message>
    <xsl:attribute name="style:shrink-to-size">
      <xsl:value-of select="'true'"/>
    </xsl:attribute>
  </xsl:template>

  <!-- remove invalid attribute from draw:enhanced-geometry -->
  <xsl:template match="draw:enhanced-geometry[@enhanced-path]/@draw:enhanced-path"/>
  <xsl:template match="draw:enhanced-geometry/@enhanced-path">
    <xsl:attribute name="draw:enhanced-path" >
      <xsl:value-of select="@enhanced-path"/>
    </xsl:attribute>
  </xsl:template>

  <!-- start with a clean root element to avoid namespaces that are not odf -->
  <xsl:template match="/office:document-content">
    <office:document-content
  xmlns:draw="urn:oasis:names:tc:opendocument:xmlns:drawing:1.0"
  xmlns:fo="urn:oasis:names:tc:opendocument:xmlns:xsl-fo-compatible:1.0"
  xmlns:form="urn:oasis:names:tc:opendocument:xmlns:form:1.0"
  xmlns:office="urn:oasis:names:tc:opendocument:xmlns:office:1.0"
  xmlns:presentation="urn:oasis:names:tc:opendocument:xmlns:presentation:1.0"
  xmlns:style="urn:oasis:names:tc:opendocument:xmlns:style:1.0"
  xmlns:svg="urn:oasis:names:tc:opendocument:xmlns:svg-compatible:1.0"
  xmlns:table="urn:oasis:names:tc:opendocument:xmlns:table:1.0"
  xmlns:text="urn:oasis:names:tc:opendocument:xmlns:text:1.0"
  xmlns:xlink="http://www.w3.org/1999/xlink"
>
      <xsl:apply-templates select="@*|node()"/>
    </office:document-content>
  </xsl:template>
  <xsl:template match="/office:document-styles">
    <office:document-styles
  xmlns:draw="urn:oasis:names:tc:opendocument:xmlns:drawing:1.0"
  xmlns:fo="urn:oasis:names:tc:opendocument:xmlns:xsl-fo-compatible:1.0"
  xmlns:form="urn:oasis:names:tc:opendocument:xmlns:form:1.0"
  xmlns:office="urn:oasis:names:tc:opendocument:xmlns:office:1.0"
  xmlns:presentation="urn:oasis:names:tc:opendocument:xmlns:presentation:1.0"
  xmlns:style="urn:oasis:names:tc:opendocument:xmlns:style:1.0"
  xmlns:svg="urn:oasis:names:tc:opendocument:xmlns:svg-compatible:1.0"
  xmlns:table="urn:oasis:names:tc:opendocument:xmlns:table:1.0"
  xmlns:text="urn:oasis:names:tc:opendocument:xmlns:text:1.0"
  xmlns:xlink="http://www.w3.org/1999/xlink"
>
      <xsl:apply-templates select="@*|node()"/>
    </office:document-styles>
  </xsl:template>
</xsl:stylesheet>
