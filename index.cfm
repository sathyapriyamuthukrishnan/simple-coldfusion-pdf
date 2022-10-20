<cfoutput>
	<cfset student =  queryNew("studentId, studentName, studentAge", "integer, varchar, integer", [{"studentId": 1, "studentName": 'Test student 1', "studentAge": 23 }, {"studentId": 2, "studentName": 'Test student 2', "studentAge": 22 }]  )>

	<!--- Sample data to print in pdf --->
	<cfsavecontent variable="pdfcontent">
		<div class="pdfcontent">
			<table>
				<thead>
					<tr>
						<th>S.no.</th>
						<th>Student Name</th>
						<th>Student Age</th>
					</tr>
				</thead>
				<cfloop query="student">
					<tr>
						<td>#student.currentRow#</td>
						<td>#student.studentName#</td>
						<td>#student.studentAge#</td>
					</tr>
				</cfloop>
			</table>
		</div>
	</cfsavecontent>

	<!--- Print pdf --->
	<cfdocument format="PDF" margintop="2" unit="cm">
		<style>
			.pdfcontent {
				margin-top: 10px;
				text-align: center;
			}
			table, td, th {
				border: 1px solid ##a1a1a1;
			}
		</style>
		<cfdocumentitem type="header">
			<div align="center" class="header">
				<h1>Sample PDF content</h1>
			</div>
		</cfdocumentitem>
		#pdfcontent#
		<cfdocumentitem type="pagebreak"></cfdocumentitem>
		#pdfcontent#
		<cfdocumentitem type="footer">
			<div class="footer-text">
				<div class="pagenum">#CGI.http_host#</div>
				<div align="right">#cfdocument.CURRENTPAGENUMBER#</div>
			</div>
		</cfdocumentitem>
	</cfdocument>
</cfoutput>