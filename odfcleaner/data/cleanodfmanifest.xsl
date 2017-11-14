<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
  xmlns:manifest="urn:oasis:names:tc:opendocument:xmlns:manifest:1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
>
  <xsl:include href="shared.xsl"/>

  <!-- start with a clean root element to avoid namespaces that are not odf -->
  <xsl:template match="/manifest:manifest">
    <manifest:manifest>
      <xsl:apply-templates select="@*|node()"/>
    </manifest:manifest>
  </xsl:template>

  <!-- remove unwanted files from the manifest
    Also remove them from the zip!
  -->
  <xsl:template match="manifest:file-entry[@manifest:full-path='layout-cache']"/>
  <xsl:template match="manifest:file-entry[@manifest:full-path='Configurations2/']"/>

</xsl:stylesheet>
