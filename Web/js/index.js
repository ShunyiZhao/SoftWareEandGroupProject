/* location different part of the html */
function heightToTop(ele){
    var height = $('#'+ele).offset().top
    var navHeight = $('#logo').outerHeight()
    //console.log(navHeight)
    return height-navHeight
}
$('.nav').click(function(){
    var targetEle = $(this).text().toLocaleLowerCase()
    //console.log(targetEle)
    var top = heightToTop(targetEle)
    console.log(top)
    window.scrollTo({
        top:top,
        behavior:'smooth'
    })
})
