<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="text"/>

  <xsl:template match="/wallpapers">
    <xsl:for-each select="wallpaper[1]">

      <xsl:call-template name="gconf">
        <xsl:with-param name="key">/desktop/gnome/background/picture_filename</xsl:with-param>
        <xsl:with-param name="value" select="filename"/>
      </xsl:call-template>

      <xsl:call-template name="gconf">
        <xsl:with-param name="key">/desktop/gnome/background/picture_options</xsl:with-param>
        <xsl:with-param name="value" select="options"/>
      </xsl:call-template>

      <xsl:call-template name="gconf">
        <xsl:with-param name="key">/desktop/gnome/background/color_shading_type</xsl:with-param>
        <xsl:with-param name="value" select="shade_type"/>
      </xsl:call-template>

      <xsl:call-template name="gconf">
        <xsl:with-param name="key">/desktop/gnome/background/primary_color</xsl:with-param>
        <xsl:with-param name="value" select="pcolor"/>
      </xsl:call-template>

      <xsl:call-template name="gconf">
        <xsl:with-param name="key">/desktop/gnome/background/secondary_color</xsl:with-param>
        <xsl:with-param name="value" select="scolor"/>
      </xsl:call-template>

    </xsl:for-each>
  </xsl:template>

  <xsl:template name="gconf">
    <xsl:param name="key"/>
    <xsl:param name="value"/>

    <xsl:choose>
      <xsl:when test="$value">
        <xsl:value-of select="$key"/>
        <xsl:text> "</xsl:text>
        <xsl:value-of select="$value"/>
        <xsl:text>"&#xA;</xsl:text>
      </xsl:when>

      <xsl:otherwise>
        <xsl:message>
          <xsl:text>WARNING: No value for </xsl:text>
          <xsl:value-of select="$key"/>
        </xsl:message>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

</xsl:stylesheet>
