<xsl:stylesheet	version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
                              xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/" 
							  xmlns:def="http://DefaultNamespace">							  
	<xsl:template match="/">
	  <triangleTypeReturn>
  			<xsl:variable name="a" select="soap:Envelope/soap:Body/def:triangleType/def:a"/>
			<xsl:variable name="b" select="soap:Envelope/soap:Body/def:triangleType/def:b"/>
			<xsl:variable name="c" select="soap:Envelope/soap:Body/def:triangleType/def:c"/>
			<xsl:choose>

<!--am adaugat si validarea pentru numar. In xsd cei 3 parametri (a,b,c) ii am de tip int
	si teoretic daca-as folosi requestul n-ar trebui sa am variabile de tip string.
	Am pus si aceasta validare.
-->	
<!--adaugat-->			
				<xsl:when test="not(number($a))">
					Triangle cannot be formed
				</xsl:when>		
				<xsl:when test="not(number($b))">
					Triangle cannot be formed
				</xsl:when>			
				<xsl:when test="not(number($c))">
					Triangle cannot be formed
				</xsl:when>		
 <!--adaugat-->					
				<xsl:when test=" ($a &lt; 1) or ($b &lt; 1) or ($c &lt; 1)">
					Triangle cannot be formed
				</xsl:when>			 
				<xsl:when test=" $a=$b and $b=$c ">
					Equilateral
				</xsl:when>	
				<xsl:when test=" $b=$c or $a=$b or $c=$a">
					Isosceles
				 </xsl:when>		 	 
				<xsl:when test=" ($a >= $b +$c ) or ($c >= $a +$b) or ($b >= $a +$c)">
					Triangle cannot be formed
				 </xsl:when>			 
				  <xsl:otherwise>
					Scalene
				  </xsl:otherwise>
				</xsl:choose>							
	  </triangleTypeReturn>  
	</xsl:template>
</xsl:stylesheet>