$(document).ready(function() {
	listCategories();
});

function reloadCategories() {
    var dataTable = $(tblCategory).dataTable();
    dataTable.fnReloadAjax();
}

function listCategories() {

	if ($.fn.DataTable.fnIsDataTable(tblCategory)) {
		$(tblCategory).dataTable().fnDestroy();
	}

	var path = $("#path").val();

	$('#tblCategory')
			.dataTable(
					{
						"sAjaxSource" : path + "/admin/category/categoriesJSON",
						"bServerSide" : true,
						"bProcessing" : true,
						"sDom" : "<'row'<'col-sm-6'l><'col-sm-6'f>r>t<'row'<'col-sm-5'><'col-sm-7'p>>",
						"sPaginationType" : "full_numbers",
						"bAutoWidth" : false,
						"aoColumns" : [
								{
									mData : "idcategory",
									sWidth : "10%",
									"bSortable" : false
								},
								{
									mData : "name",
									sWidth : "40%"
								},
								{
									mData : "status",
									sWidth : "10%",
									"mRender" : function(data, type, row) {
										var resultStatus = $.trim(data);
										var StatusText = '';
										if (resultStatus === "1") {
											StatusText = "Activo";
										} else {
											StatusText = "Inactivo";
										}
										return StatusText;
									}
								},
								{
									mData : "parentid",
									sWidth : "10%"
								},
								{
									mData : "idcategory",
									sWidth : "10%",
									"bSortable" : false,
									"mRender" : function(data, type, row) {

										var editHTML = '';
										var stateHTML = '';
										var deleteHTML = '';

										editHTML += '<a href="#" class="btn btn-primary btn-xs" onclick="getCategory('
												+ data
												+ ', event, this)" title="Edit"><i class="fa fa-pencil"></i></a>';
										stateHTML += '<a href="#" class="btn btn-info btn-xs" onclick="changeStateCategory('
												+ data
												+ ', event, this)" title="Change state"><i class="fa fa-refresh"></i></a>';
										deleteHTML += '<a href="#" class="btn btn-danger btn-xs" onclick="deleteCategory('
												+ data
												+ ', event, this)" title="Delete"><i class="fa fa-trash-o"></i></a>';

										return editHTML + stateHTML
												+ deleteHTML;
									}
								} ]
					});
}

$('input:radio').change(function() {
	var $self = $(this);
	if ($self.prop('checked')) {
		$('#status').val('1');
		$('input[type=radio]').parent().removeClass('btn-primary');
		$self.parent().addClass('btn-primary');
		//alert($("#gender input[type='radio']:checked").val());
	} else {
		$('#status').val('0');
		$self.parent().removeClass('btn-default');
		//alert($("#gender input[type='radio']:checked").val());
	}
});

$('#btnSave').click(function(e) {
	var path = $("#path").val();
	var categorySend = {
            name: $('#name').val(),
            status: $('#status').val(),
            parentid: $('#parentid').val()
        };
	
    $.ajax({
        url: path + "/admin/category/save",
        data: JSON.stringify(categorySend),
        type: "POST",
        dataType: 'json',
        contentType: 'application/json',
        success: function(dataResponse) {
        	$('#formCategory').trigger("reset");
        	if (jsonToDivError(dataResponse, '#formCategory #divMessage')) {
        		reloadCategories();
            }
        }
    });

    e.preventDefault();
});
