<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
    exclude-result-prefixes="xs math xd"
    version="3.0">
    <xsl:template match="/">
        
<!--  TAXI DRIVER SCREENPLAY XSLT - E. Larson -->
        <html>
            <head>
                <title><xsl:value-of select="root/production-cred/title"/></title>
                <style>
                    body {
                    font-family: "Courier New";
                    margin: 20px;
                    line-height: 1.5;
                    background-color: lemonchiffon;
                    }
                    h1, h2 {
                    text-align: center;
                    color: crimson;
                    }
                    
                    .narration {
                    font-style: italic;
                    color: 	darkgreen;
                    margin: 20px 20px;
                    }
                    
                    .dialogue {
                    margin-left: 15em;
                    margin-right: 15em;
                    }
                    
                    .scene-heading {
                    text-transform: uppercase;
                    font-weight: bold;
                    margin: 20px;
                    }
                    
                    hr {
                    border-top: 2px solid crimson;
                    margin: 20px;
                    }

                </style>
            </head>
            <body>
                <h1><u><xsl:value-of select="root/production-cred/title"/></u></h1>
                <h2>Written by <xsl:value-of select="root/production-cred/writer" /></h2>
                <h6>Production Credits: <xsl:value-of select="root/production-cred"/></h6>
                
                <div class="toc">
                    <h4><i>Scene Finder</i>:</h4>
                    <div class="scene-string">
                        <xsl:for-each select="root/script/scene">
                            <xsl:variable name="sceneNumber" select="position()"/><a href="#scene{$sceneNumber}"><xsl:value-of select="$sceneNumber"/> | </a>
                        </xsl:for-each>
                    </div>
                </div>
                
                <div>
                    <xsl:apply-templates select="root/script/scene"/>
                </div>
                <hr/>
                <h3>Interesting Stats/Info from the Script:</h3>
            </body>
        </html>
    </xsl:template>
  
    <xsl:template match="scene">
        <xsl:variable name="sceneNumber" select="position()"/>
        <div class="scene">
            <p class="scene-heading" id="scene{$sceneNumber}">SCENE <xsl:value-of select="$sceneNumber"/></p>
            <xsl:apply-templates select="*" />
            <hr/>
        </div>
    </xsl:template>
    
    <xsl:template match="narr">
        <p class="narration"><xsl:value-of select="normalize-space()"/></p>
    </xsl:template>
    
    <xsl:template match="d">
        <p class="dialogue">
            <xsl:value-of select="normalize-space()"/>
        </p>
    </xsl:template>
   
    <xsl:template match="desc">
        <span class="description"> <xsl:value-of select="normalize-space()"/></span>
    </xsl:template>
    
    <xsl:template match="text()">
        <xsl:value-of select="normalize-space()"/>
    </xsl:template>
    
</xsl:stylesheet>