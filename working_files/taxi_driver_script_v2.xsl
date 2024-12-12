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
            <nav>
                <a href="index.html">Home</a> |
                <a href="script.html">Overview</a> |
                <a href="methods.html">Methods</a> |
                <a href="output.html">Output</a> |
                <a href="scriptComp.html">Page vs. Screen</a>
            </nav>
            <body>
                <h1><u><xsl:value-of select="root/production-cred/title"/></u></h1>
                <h2>Written by <xsl:value-of select="root/production-cred/writer" /></h2>
                <h6>Production Credits: <xsl:value-of select="root/production-cred"/></h6>
                
                <div class="toc">
                    <h4><i>Scene Finder</i>:</h4>
                    <strong><div class="scene-string">
                        <xsl:for-each select="root/script/scene">
                            <xsl:variable name="sceneNumber" select="position()"/><a href="#scene{$sceneNumber}"><xsl:value-of select="$sceneNumber"/> | </a>
                        </xsl:for-each>
                        <a href="#scene52">Stats &amp; Info</a>
                    </div></strong>
                </div>
                
                <div class="cast-list">
                    <h4><i>Cast List (and links to first scenes)</i>:</h4>
                    <ul>
                        <li>Robert De Niro as <a href="#scene1">Travis Bickle</a></li>
                        <li>Cybill Shepherd as <a href="#scene9">Betsy</a></li>
                        <li>Jodie Foster as <a href="#scene31">Iris</a></li>
                        <li>Peter Boyle as <a href="#scene11">Wizard</a></li>
                        <li>Leonard Harris as <a href="#scene16">Charles Palantine</a></li>
                        <li>Harvey Keitel as <a href="#scene31">Sport</a></li>
                        <li>Martin Scorsese as a <a href="#scene23">Young Passenger</a></li>
                    </ul>
                </div>
                
                <div>
                    <xsl:apply-templates select="root/script/scene"/>
                </div>
                <hr/>
                
                <!-- stats -->
                
                <h2 id="scene52">Interesting Stats/Info from the Script:</h2>
                <div class="stats">
                    <p>The amount of times some characters were mentioned by other characters in dialogue or narration.</p>
                    <ul><xsl:variable name="count" select="count(//char[@who = 'trav'])" />
                    Travis is mentioned <xsl:value-of select="$count" /> times.</ul>
                    <ul><xsl:variable name="count" select="count(//char[@who = 'bets'])" />
                    Betsy is mentioned <xsl:value-of select="$count" /> times.</ul>
                    <ul><xsl:variable name="count" select="count(//char[@who = 'iris'])" />
                    Iris is mentioned <xsl:value-of select="$count" /> times.</ul>
                    <ul><xsl:variable name="count" select="count(//char[@who = 'pal'])" />
                    Palantine is mentioned <xsl:value-of select="$count" /> times.</ul>
                    <hr/>
                    <ul><xsl:variable name="count" select="count(//d[@who = 'trav'])" />
                        Travis has <xsl:value-of select="$count" /> instances of dialogue.</ul>
                    <ul><xsl:variable name="count" select="count(//d[@who = 'bets'])" />
                        Betsy has <xsl:value-of select="$count" /> instances of dialogue.</ul>
                    <ul><xsl:variable name="count" select="count(//d[@who = 'iris'])" />
                        Iris has <xsl:value-of select="$count" /> instances of dialogue.</ul>
                    <ul><xsl:variable name="count" select="count(//d[@who = 'pal'])" />
                        Palantine has <xsl:value-of select="$count" /> instances of dialogue.</ul>
                </div>
                
                <!-- we can write more obviously, just getting the first parts of it -->
                <!-- end of stats -->
                
            </body>
        </html>
    </xsl:template>
    
    <!-- script commands -->
  
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
    
    <xsl:variable name="count" select="count(//@char[. = 'trav'])" />
    
</xsl:stylesheet>