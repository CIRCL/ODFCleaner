<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"

  xmlns:calcext="urn:org:documentfoundation:names:experimental:calc:xmlns:calcext:1.0"
  xmlns:css3t="http://www.w3.org/TR/css3-text/"
  xmlns:drawooo="http://openoffice.org/2010/draw"
  xmlns:field="urn:openoffice:names:experimental:ooo-ms-interop:xmlns:field:1.0"
  xmlns:formx="urn:openoffice:names:experimental:ooxml-odf-interop:xmlns:form:1.0"
  xmlns:grddl="http://www.w3.org/2003/g/data-view#"
  xmlns:loext="urn:org:documentfoundation:names:experimental:office:xmlns:loext:1.0"
  xmlns:officeooo="http://openoffice.org/2009/office"
  xmlns:oooc="http://openoffice.org/2004/calc"
  xmlns:ooow="http://openoffice.org/2004/writer"
  xmlns:rpt="http://openoffice.org/2005/report"
  xmlns:tableooo="http://openoffice.org/2009/table"
>
  <!-- do not indent! it introduces unwanted spaces -->
  <xsl:output method="xml" indent="no"/>

  <!-- copy everything that is not matched in other templates -->
  <xsl:template match="@*|node()">
    <xsl:copy>
      <xsl:apply-templates select="@*|node()"/>
    </xsl:copy>
  </xsl:template>

  <!-- filter out stuff from known foreign namespaces -->
  <xsl:template match="calcext:*|@calcext:*"/>
  <xsl:template match="css3t:*|@css3t:*"/>
  <xsl:template match="drawooo:*|@drawooo:*"/>
  <xsl:template match="field:*|@field:*"/>
  <xsl:template match="formx:*|@formx:*"/>
  <xsl:template match="grddl:*|@grddl:*"/>
  <xsl:template match="loext:*|@loext:*"/>
  <xsl:template match="officeooo:*|@officeooo:*"/>
  <xsl:template match="oooc:*|@oooc:*"/>
  <xsl:template match="ooow:*|@ooow:*"/>
  <xsl:template match="rpt:*|@rpt:*"/>
  <xsl:template match="tableooo:*|@tableooo:*"/>

</xsl:stylesheet>
