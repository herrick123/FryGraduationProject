/**
 * js工具
 * Created by zch on 2015/11/13.
 */
/**
 * 获取json长度
 * @param jsonData
 * @returns {number}
 */
function getJsonLength(jsonData){
    var jsonLength = 0;
    for(var item in jsonData){
        jsonLength++;
    }
    return jsonLength;
}

/**
 * 给新加入的节点绑定bootstratp.tree中的js事件
 */
function bindEvent(){
    $('.tree > ul').attr('role', 'tree').find('ul').attr('role', 'group');
    $('.tree').find('li:has(ul)').addClass('parent_li').attr('role', 'treeitem').find(' > span').on('click', function (e) {
        var children = $(this).parent('li.parent_li').find(' > ul > li');
        if (children.is(':visible')) {
            children.hide('fast');
            $(this).find(' > i').addClass('icon-plus-sign').removeClass('icon-minus-sign');
        }
        else {
            children.show('fast');
            $(this).find(' > i').addClass('icon-minus-sign').removeClass('icon-plus-sign');
        }
        e.stopPropagation();
    });
}

/**
 * 创建元素
 */
function getElementStr(element, no){
    var type = element.type;
    var title = element.title;
    var str = "";
    switch (type) {
        case 'Label':{// 标签
            str = '<div class="form-group"><label data="'+title+'" data-content="0" style="text-align: left" class="col-md-11 control-label" id="label#tabs-'+no+'-0">'+title+'</label></div>';
            break;
        }
        case  'Input':{// 输入框
            str = '<div class="form-group"><label data="'+title+'" data-content="1" for="input#tabs-'+no+'-1" class="col-md-2 control-label" id="label#tabs-'+no+'-1">'+title+'</label>' +
                '<div class="col-md-9"><input type="text" class="form-control" value="" placeholder="请输入'+title+'" id="input#tabs-'+no+'-1"></div></div>';
            break;
        }
        case 'Date':{// 时间
            str = '<div class="form-group"><label data="'+title+'" data-content="2" for="input#tabs-'+no+'-2" class="col-md-2 control-label" id="label#tabs-'+no+'-2">'+title+'</label>' +
                '<div class="col-md-9"><input type="text" readonly class="form-control form_datetime data-input" value="" placeholder="请选择日期" id="input#tabs-'+no+'-2"></div></div>';
            break;
        }
        case 'Item':{// 条目
            var items = element.items;
            var itemStr = "";
            for (var i = 0, l = items.length; i < l; i++) {
                var item = items[i].title;
                itemStr += '<div class="checkbox"><label><input type="checkbox" class="checkbox style-0" value="'+item+'"><span>'+item+'</span></label></div>';
            }
            str = '<div class="form-group"><label data="'+title+'" data-content="3" class="col-md-2 control-label" id="label#tabs-'+no+'-3">'+title+'</label>' +
                '<div class="col-md-9">'+itemStr+'</div></div>';
            break;
        }
    }
    return str;
}
/**
 * 格式化日期函数
 * fmt格式为("yyyy-MM-dd")或("yyyy-MM-DD hh:mm:ss")
 */
Date.prototype.Format = function (fmt) {
    var o = {
        "M+": this.getMonth() + 1, //月份
        "d+": this.getDate(), //日
        "h+": this.getHours(), //小时
        "m+": this.getMinutes(), //分
        "s+": this.getSeconds(), //秒
        "q+": Math.floor((this.getMonth() + 3) / 3), //季度
        "S": this.getMilliseconds() //毫秒
    };
    if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
    for (var k in o)
        if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
    return fmt;
}

/**
 * 全选/反选
 * @param obj
 */
function allCheck(obj){
    $(obj).parent().parent().parent().parent().siblings().find("tr").each(function(){
        $(this).find("td > label > input").prop("checked", $(obj).prop("checked"));
    });
}

/**
 * null转""
 * @param value
 * @returns {*}
 */
function removeNull(value){
    if (null == value || undefined == value) {
        return "";
    } else {
        return value;
    }
}

function showSomeSection(id){
	$("#"+id).show().siblings().hide();
}

function closeModal(id){
	$("#"+id).modal("hide");
}

function showModal(id){
	$("#"+id).modal("show");
}
