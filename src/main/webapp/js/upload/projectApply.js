var applyingColumns = [
	{
		id : 'serialId',
		title : '序号',
		type : 'string',
		columnClass : 'text-center',
		width : 45,
		resolution : function(value, record, column, grid, dataNo,
				columnNo) {
			return dataNo + 1;
		}
	},
	{
		id : 'id',
		title : '主键',
		type : 'string',
		hide : true
	},
	
	{
		id : 'stuName',
		title : '申请人姓名',
		width : 160,
		type : 'string',
		columnClass : 'text-center'
	},
	{
		id : 'isHead',
		title : '是否申请组长',
		type : 'String',
		width : 160,
		columnClass : 'text-center',
		resolution : function(value, record, column, grid, dataNo,
		columnNo) {
			if(value == '0'){
				return "否";
			}else if(value == '1'){
				return "是";
			}
		}
	},
	{
		id : 'applyReason',
		title : '申请理由',
		type : 'string',
		width : 160,
		columnClass : 'text-center'
	},
	{
		id : 'applyDate',
		title : '申请日期',
		type : 'date',
		width : 160,
		columnClass : 'text-center',
		resolution:function(value, record, column, grid, dataNo, columnNo){
			if(value != ''){
				return $.myTime.UnixToDate(value);
			}else{
				return "";
			}
        } 
	},
	{
		id : 'operation',
		title : '操作',
		width : 200,
		type : 'string',
		columnClass : 'text-center',
		resolution : function(value, record, column, grid, dataNo,
				columnNo) {
			var content = '';
			content += '  ';
			content += "<button class='sbtn sbtn-blue btn-sm' id='permitBtn' style='margin-right:20px' "
					+ "onclick=permitApply('"
					+ record.id
					+ "');><i class='fa fa-plus'></i> 同意</button>";
			content += "<button class='sbtn sbtn-default btn-sm' id='refuseBtn' "
				+ "onclick=refuseApply('"
				+ record.id
				+ "');><i class='fa fa-plus'></i> 拒绝</button>";
			return content;
		}
	}
];
	
var appliedColumns = [
	{
		id : 'serialId',
		title : '序号',
		type : 'string',
		columnClass : 'text-center',
		width : 45,
		resolution : function(value, record, column, grid, dataNo,columnNo) {
		return dataNo + 1;
		}
	},
	{
		id : 'id',
		title : '主键',
		type : 'string',
		hide : true
	},
	
	{
		id : 'stuName',
		title : '申请人姓名',
		width : 160,
		type : 'string',
		columnClass : 'text-center'
	},
	{
		id : 'isHead',
		title : '是否申请组长',
		type : 'String',
		width : 160,
		columnClass : 'text-center',
		resolution : function(value, record, column, grid, dataNo,columnNo) {
			if(value == '0'){
				return "否";
			}else if(value == '1'){
				return "是";
			}
		}
	},
	{
		id : 'applyReason',
		title : '申请理由',
		type : 'string',
		width : 160,
		columnClass : 'text-center'
	},
	{
		id : 'checkDate',
		title : '通过日期',
		type : 'date',
		width : 160,
		columnClass : 'text-center',
		resolution:function(value, record, column, grid, dataNo, columnNo){
			if(value != ''){
				return $.myTime.UnixToDate(value);
			}else{
				return "";
			}
	    } 
	}
];