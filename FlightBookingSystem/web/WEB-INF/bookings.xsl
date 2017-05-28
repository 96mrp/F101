<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html"/>
    <link rel="stylesheet" href="style.css">

        <xsl:template match="bookings">
            <html>
                <head>
                    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                        <title>Administration</title>
                </head>
                <body>
                    <h1>Administration</h1>
                    <table>
			<thead>
				<tr>
					<th>Booking ID</th>
					<th>Flight Number</th>
					<th>Customer Name</th>
                                </tr>
			</thead>
			<tbody>
				<xsl:apply-templates />
			</tbody>
		</table>
                </body>
            </html>
        </xsl:template>
        <xsl:template match="flight">
		<tr>
			<td>
				<xsl:value-of select="id" />
			</td>
			<td>
				<xsl:value-of select="flightId" />
			</td>
                        <td>
				<xsl:value-of select="customer" />
			</td>
                </tr>
	</xsl:template>

</xsl:stylesheet>
