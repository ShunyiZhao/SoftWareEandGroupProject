function add_richtext() {
    window.location.href='index2.html';
}
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
var obj;
function getResult(obj){
    $.ajax({
    type:"GET",
    url: "json/admin.json",
    dataType: "json",
    async: false,
    success:function(data){
            obj = JSON.parse(data) 
        }
    });
    return obj;
}
obj = getResult(obj)
console.log(obj.admin[1].name)