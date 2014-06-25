<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add New News</title>
<link rel="stylesheet" type="text/css" href="./css/nrg.css">

<script type="text/javascript" src="./js/jquery-1.9.1.js"></script>
<script type="text/javascript" src="./js/jquery.validate.js"></script>
<script type="text/javascript" src="./js/jquery-form.js"></script>


<!-- <script type='text/javascript' src='http://code.jquery.com/jquery-1.6.2.js'></script> -->
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.14/jquery-ui.js"></script>
<link rel="stylesheet" type="text/css"
	href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.14/themes/base/jquery-ui.css">
<link rel="stylesheet" type="text/css"
	href="http://trirand.com/blog/jqgrid/themes/ui.jqgrid.css">
<script type='text/javascript'
	src="http://trirand.com/blog/jqgrid/js/i18n/grid.locale-en.js"></script>
<script type='text/javascript'
	src="http://trirand.com/blog/jqgrid/js/jquery.jqGrid.min.js"></script>



<script type='text/javascript'>
	//<![CDATA[ 
	//    $(window).load(function(){
	//     var data = [[48803, "DSK1", "", "02200220", "OPEN1"], [48769, "APPR", "", "77733337", "ENTERED1"]];

	//     $("#grid").jqGrid({
	//         datatype: "local",
	//         height: 250,
	//         colNames: ['SNo', 'Title', 'Description', 'Status'],
	//         colModel: [{
	//             name: 'id',
	//             index: 'id',
	//             width: 60,
	//             sorttype: "int",
	//             sortable:"true"},
	//         {
	//             name: 'Title',
	//             index: 'Title',
	//             width: 90,
	//             sortable: "false"},
	//         {
	//             name: 'Description',
	//             index: 'Description',
	//             width: 90,
	//             sortable: "false"},
	//         {
	//             name: 'Status',
	//             index: 'Status',
	//             width: 80,
	//             sortable: "false"}
	//         ],
	//         caption: "News Data Admin",
	//         // ondblClickRow: function(rowid,iRow,iCol,e){alert('double clicked');}
	//     });

	//     var names = ["id", "Title", "Description", "Status"];
	//     var mydata = [];

	//     for (var i = 0; i < data.length; i++) {
	//         mydata[i] = {};
	//         for (var j = 0; j < data[i].length; j++) {
	//             mydata[i][names[j]] = data[i][j];
	//         }
	//     }

	//     for (var i = 0; i <= mydata.length; i++) {
	//         $("#grid").jqGrid('addRowData', i + 1, mydata[i]);
	//     }

	//     /*
	//     $("#grid").jqGrid('setGridParam', {onSelectRow: function(rowid,iRow,iCol,e){alert('row clicked');}});
	//     */
	//     $("#grid").jqGrid('setGridParam', {ondblClickRow: function(rowid,iRow,iCol,e){alert('double clicked');}});

	//    });//]]>

	//    $("#pcSelect").change(function(){
	//        var postcode = $("#pcSelect").val();
	//        jQuery("#projectTable").jqGrid(
	//                "setGridParam",{
	//                    url:"LoadJsonDataServlet?type="+ postcode,
	//                    page:1})
	//                .trigger("reloadGrid");
	//    });
</script>

<script type="text/javascript">
	$(document).ready(function() {

		jQuery("#projectTable").jqGrid({
			url : "admin/viewAllNews",
			datatype : "json",
			jsonReader : {
				repeatitems : false,
				id : "ref"
			},
			colNames : [ 'SNo.', 'Title', 'Description', 'Status' ],
			colModel : [ {
				name : 'id',
				index : 'id',
				width : 30
			}, {
				name : 'title',
				index : 'title',
				width : 100
			}, {
				name : 'description',
				index : 'description',
				width : 300
			}, {
				name : 'status',
				index : 'status',
				width : 50
			} ],
			rowNum : 20,
			rowList : [ 20, 60, 100 ],
			height : 460,
			pager : "#pagingDiv",
			viewrecords : true,
			caption : "Json Example"
		});
		$("#addnewsButton").click(function() {
			console.log("");
			var hidden = $("#form_container").is(":hidden");
			if (hidden) {
				$("#form_container").show();   
				$("#gridContainer").hide();
			}
		});

		$("#newsForm").validate({
			rules : {
				news_title : {
					required : true
				}

			},
			messages : {
				news_title : {
					required : "Title is required"
				}

			},
			errorElement : "div",
			errorPlacement : function(error, element) {
				element.before(error);
				offset = element.offset();
				error.css('left', offset.left);
				error.css('bottom', offset.top - element.outerHeight());
			},
			submitHandler : function(form) {
				$(form).ajaxSubmit({
					url : "admin/addNews",
					type : "POST",
					data : $("#newsForm").serialize(),
					success : function(msg) {
						alert('News Added Successfully');
						$("#newsForm").resetForm();
						$("#form_container").hide();   
						$("#gridContainer").show();
						reloadGrid();

					},
					error : function(e) {
						alert("Please try again later");
					}
				});
			}
		});

	});
	function reloadGrid()
	{
		jQuery("#projectTable").jqGrid(
	               "setGridParam",{
	                   url:"admin/viewAllNews",
	                   page:1})
	               .trigger("reloadGrid");
	}
</script>
</head>
<body>
	<%@include file="/WEB-INF/jsp/header.jsp"%>
	<div class="bodyContent">
		<div class="constrain contactus_banner banner centered "></div>
		<div class="contact_us_container constrain centered ">
			<div id="form_container" style="padding: 50px; display: none;">


				<form id="newsForm" name="newsForm" method="post" action=""
					autocomplete="off">
					<table style="margin-left: auto; margin-right: auto;">
						<tr>
							<td>Title</td>
							<td>:</td>
							<td><input type="text" id="news_title" name="news_title" /></td>
						</tr>
						<tr>
							<td>Description</td>
							<td>:</td>
							<td><input type="text" id="news_desc" name="news_desc" /></td>

						</tr>
						<tr>
							<td>URL</td>
							<td>:</td>
							<td><input type="text" id="news_url" name="news_url" /></td>
						</tr>

						<tr>

							<td colspan="3" style="text-align: center;"><input
								type="submit" value="Save" /></td>
						</tr>


					</table>
				</form>
			</div>
			<div id="gridContainer" class="centerd" >
				<input type="button" value="ADD NEWS" id="addnewsButton" />
				<table id="projectTable"></table>
				<div id="pagingDiv"></div>
			</div>
		</div>
	</div>
	<%@include file="/WEB-INF/jsp/footer.jsp"%>
</body>
</html>