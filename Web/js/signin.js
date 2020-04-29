function add_richtext() {
    window.location.href='index2.html';
}
var jsonData = 
$(function() {
	$("#check").click (function() {
		if($('#inputEmail').val()=='abc@qq.com'&& $('#inputPassword').val()=='123'){
            alert('Success Login!');
            add_richtext();
            return true;
        } else {
            $('#inputEmail').val('');//清空输入框
            $('#inputPassword').val('');
            alert('Fail Login');
            return false;
        }
	});
});