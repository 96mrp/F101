  <?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html"/>
    <xsl:param name="bgColor"/>
    <link rel="stylesheet" href="style.css">
    <xsl:template match="shop">
		<html>
			<head>
				<style>
					table{
					width:50%;
					}
					th, td {
					text-align:left;
					padding: 8px;
					}
					th {
					background-color: #4CAF50;
					color: white;
					font-weight:bold;
					}
					h2,p{
					background-color: #4CAF50;
					width:50%;
					font-weight:bold;
					}					
				</style>
			</head>
			<body>
				<xsl:apply-templates />
				<p>Available flights: <xsl:value-of select="count(flights/flight)"/></p>
			</body>
		</html>
	</xsl:template>
	
	<xsl:template match="flights">
		<table>
			<thead>
				<tr>
					<th>Flight Number</th>
					<th>From</th>
					<th>To</th>
                                        <th>Departure Time</th>
                                        <th>Arrival Time</th>
                                        <th>Price</th>
                                        <th>Type</th>
				</tr>
			</thead>
			<tbody>
				<xsl:apply-templates />
			</tbody>
		</table>
	</xsl:template>
	<xsl:template match="flight">
		<tr>
			<td>
				<xsl:value-of select="id" />
			</td>
			<td>
				<xsl:value-of select="origin" />
			</td>
                        <td>
				<xsl:value-of select="destination" />
			</td>
                        <td>
				<xsl:value-of select="departure" />
			</td>
                        <td>
				<xsl:value-of select="arrival" />
			</td>
                        <td>
				<xsl:value-of select="price" />
			</td>
                        <td>
				<xsl:value-of select="type" />
			</td>
			
		</tr>
	</xsl:template>
</xsl:stylesheet>

