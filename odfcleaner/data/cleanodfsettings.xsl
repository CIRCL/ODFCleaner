<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
  xmlns:config="urn:oasis:names:tc:opendocument:xmlns:config:1.0"
  xmlns:office="urn:oasis:names:tc:opendocument:xmlns:office:1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
>
  <xsl:include href="shared.xsl"/>

  <!-- start with a clean root element to avoid namespaces that are not odf -->
  <xsl:template match="/office:document-settings">
    <office:document-settings
  xmlns:config="urn:oasis:names:tc:opendocument:xmlns:config:1.0"
>
      <xsl:apply-templates select="@*|node()"/>
    </office:document-settings>
  </xsl:template>

  <!-- remove all entries from settings.xml -->
  <xsl:template match="office:settings"/>

</xsl:stylesheet>
