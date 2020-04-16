function add_richtext() {
    window.location.href='index2.html';
}

$(function() {
	$("#check").click (function() {
		if($('#inputEmail').val()=='abc@qq.com'&& $('#inputPassword').val()=='123'){
            alert('登陆成功！');
            add_richtext();
            return true;
        } else {
            $('#inputEmail').val('');//清空输入框
            $('#inputPassword').val('');
            alert('登陆失败！');
            return false;
        }
	});
});