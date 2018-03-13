// 保存当前选择的（更新后）文件列表
var curFiles = [];
$(function() {
	// 初始选择文件时触发
	
	$('#fileTest').change(function() {
	    var $this = $(this),
	        $temp = $('.file-temp'),
	        files = this.files;

	    if (files && files.length) {
	        // 原始FileList对象不可更改，所以将其赋予curFiles提供接下来的修改
	        Array.prototype.push.apply(curFiles, files);
	        addItem(curFiles);

	        $this.hide();
	        $temp.css('display', 'inline-block');
	    }
	});

	$(document)
	    // 取消选择某个文件时，在文件列表数组对象中删除这个值，并更新列表
	    .on('click', '.file-temp-btn, .file-item-more-btn', function() {
	        $('.upload-tip').hide();
	        var name = $(this).prev().text();
	        // 去除该文件
	        curFiles = curFiles.filter(function(file) {
	            return file.name !== name;
	        });
	        // 文件列表数组对象长度大于5才显示“更多文件列表”下拉项
	        if (curFiles.length <= 1) {
	            $('.item-more').hide();
	        }
	        // 文件列表数组被清空则重置文件选择表单项
	        if (!curFiles.length) {
	            $('#fileTest').val('').show();
	            $('.file-temp').css('display', 'none');
	        } else {
	            addItem(curFiles);
	        }

	        console.log(curFiles)
	    })
	    // 显示“更多文件列表”下拉项
	    .on('click', '.item-more-btn', function() {
	        $('.upload-tip').hide();
	        $('.item-more').show('normal');
	    });

	// 上传操作
	$('#addFileBtn').click(function() {
	    $("#fileTest").click();
	});
	
	
})
/**
 * 向文件列表元素中添加相应的文件项
 * @param {Array} files 当前的文件列表数组对象
 */
function addItem(files) {
	$('.item-more').show('normal');
	$("#file-btn").css("display","inline-block");
    var fileTempItemTpl = $('#file-temp-item-tpl').html(),
        fileMoreItemTpl = $('#file-more-item-tpl').html()
        htmlTemp = [], 
        htmlMoreTemp = [],
        // 文件列表中各文件坐标位置及所占空间
        left = 2,
        width = 100,
        // 最多取前5个文件
        fileTempLen = files.length > 5 ? 5 : files.length;

    for (var i = 0, j = files.length; i < j; ++i) {
        // 当i > 4，即第6个文件开始
        if (i >= 0) {
            htmlMoreTemp.push(fileMoreItemTpl.replace('{{name}}', files[i].name));
            continue;
        }

        // 计算每一项坐标left、占宽width
        left = i === 0 ? 0 : 0 + i * (100 / fileTempLen);
        width = 100 / fileTempLen - 2;

        
    }
    
        

    // 渲染相关元素内容
    $('.file-temp').html(''
        + '<input type="text" style="background-color:#fff;" class="form-control" id="fileTemp" readonly>'
        + htmlTemp.join('')
        + (files.length > 1000
            ? '<span class="item-more-btn" title="查看更多">=</span>'
            : ''
        )
    );
    var info = "已上传"+files.length+"个文件";
    $("#fileTemp").val(info);
    $('.item-more').html(htmlMoreTemp.join(''));
}




