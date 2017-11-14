<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
  xmlns:office="urn:oasis:names:tc:opendocument:xmlns:office:1.0"
  xmlns:meta="urn:oasis:names:tc:opendocument:xmlns:meta:1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
>
  <xsl:include href="shared.xsl"/>

  <!-- start with a clean root element to avoid namespaces that are not odf -->
  <xsl:template match="/office:document-meta">
    <office:document-meta
  xmlns:meta="urn:oasis:names:tc:opendocument:xmlns:meta:1.0"
  xmlns:dc="http://purl.org/dc/elements/1.1/"
>
      <xsl:apply-templates select="@*|node()"/>
    </office:document-meta>
  </xsl:template>

  <!-- remove unwanted entries from meta.xml -->
  <xsl:template match="meta:generator"/>

</xsl:stylesheet>
