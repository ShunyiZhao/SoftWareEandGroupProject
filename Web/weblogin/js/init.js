/**
 * Created by jetamie on 2018/4/2.
 */
$(function () {
    var mh=$('header').height()
    var wh=$(window).height()
    $("#setHeight").css("height",wh-mh)
    //鼠标悬浮效果
    $(".nav-link").hover(function () {
        $(this).css("background","#cf7500")
    },function () {
        $(this).css("background","#f0a500")
    })
    //菜单点击效果
    $("#mi-f").addClass("fa-folder")
    var bool_f=false
    $("#mi-folder").click(function () {
        if(bool_f) {
            $("#mi-f").addClass("fa-folder")
            $("#mi-f").removeClass("fa-folder-open")
            bool_f=false
        }else {
            $("#mi-f").addClass("fa-folder-open")
            $("#mi-f").removeClass("fa-folder")
            bool_f=true
        }
    })
    //位置显示效果
    var bool_menu=true
    $.each($(".mi-item"),function () {
        var $this = $(this)
        $this.click(function () {
            var value = $this.children("a").children("span").text()
            //获取跳转页面
            var page = $this.data("href")
            console.log(page)
            loadPage(page)
            $("#mi-show-location").text(value)
            //移除二级菜单效果
            $("#mi-course").addClass("d-none")
            $("#mi-course").removeClass("d-inline")
        })
    })
    //默认加载页面
/*     $.getJSON("./js/page.json",function (res) {
        console.log("默认页面路径:")
        console.log(res)
        loadPage(res["defaultPage"])
    }) */
    //信息注入
    /* insert() */
})
//切换页面函数
/* function loadPage(page) {
    $("#mi-page").load(page,function (reponse,statu,xhr) {//结果，状态[success]，XMLHttpRequest
        $("#mi-page").html(reponse)
    })
} */
//版权信息注入
function insert() {
    var htm = '<pre class="d-none">' +
        '<p>邮箱：jetamiett@163.com</p>' +
        '<p>作者：Mi咪糖</p>'+
        '<p>作品：轻量级MiTang后台管理框架</p>'+
        '</pre>'
    $("#foot").append(htm)
}