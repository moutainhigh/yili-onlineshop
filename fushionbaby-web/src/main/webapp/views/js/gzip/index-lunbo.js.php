<?php if ( extension_loaded('zlib') ) {ob_start('ob_gzhandler');}header("Content-Type: text/javascript"); ?>
$(document).ready(function(){function c(){$(".tuul").is(":animated")||(a<$("#chuantong .tuul li").length-2?(a+=1,d()):(a=0,$("#chuantong .tuul").animate({left:-882*($("#chuantong .tuul li").length-1)},500,function(){$("#chuantong .tuul").css("left",0)}),$("#chuantong .dianul li").eq(a).addClass("cur").siblings().removeClass("cur")))}function d(){$("#chuantong .tuul").animate({left:-882*a},500),$("#chuantong .dianul li").eq(a).addClass("cur").siblings().removeClass("cur")}var a=0;$("#chuantong .tuul li").eq(0).clone().appendTo("#chuantong .tuul");var b=setInterval(c,5e3);$("#chuantong").mouseenter(function(){clearInterval(b),$(".anniu .leftbut").animate({left:"0",opacity:"0.5"},200),$(".anniu .rightbut").animate({right:"0",opacity:"0.5"},200)}),$("#chuantong").mouseleave(function(){clearInterval(b),b=setInterval(c,5e3),$(".anniu .leftbut").animate({left:"-45px",opacity:"0"},200),$(".anniu .rightbut").animate({right:"-45px",opacity:"0"},200)}),$("#chuantong .anniu .rightbut").click(c),$("#chuantong .anniu .leftbut").click(function(){$(".tuul").is(":animated")||(a>0?(a-=1,d()):(a=$("#chuantong .tuul li").length-2,$("#chuantong .tuul").css("left",-882*($("#chuantong .tuul li").length-1)),$("#chuantong .tuul").animate({left:-882*($("#chuantong .tuul li").length-2)},500),$("#chuantong .dianul li").eq(a).addClass("cur").siblings().removeClass("cur")))}),$("#chuantong .dianul li").click(function(){var b=$(this).index();if($("#chuantong .dianul li").eq(b).addClass("cur").siblings().removeClass("cur"),a>b){console.log("\u4e3b\u4eba~\u60a8\u70b9\u7684\u5c0f\u4e8e\u4fe1\u53f7\u91cf");var c=$("#chuantong .tuul li img").eq(a-1).attr("src"),d=$("#chuantong .tuul li img").eq(b).attr("src");$("#chuantong .tuul li img").eq(a-1).attr("src",d),$("#chuantong .tuul").animate({left:-882*(a-1)},500,function(){$("#chuantong .tuul").css("left",-882*b),$("#chuantong .tuul li img").eq(a-1).attr("src",c),a=b})}else{console.log("\u4e3b\u4eba~\u60a8\u70b9\u7684\u5927\u4e8e\u4fe1\u53f7\u91cf");var c=$("#chuantong .tuul li img").eq(a+1).attr("src"),d=$("#chuantong .tuul li img").eq(b).attr("src");$("#chuantong .tuul li img").eq(a+1).attr("src",d),$("#chuantong .tuul").animate({left:-882*(a+1)},500,function(){$("#chuantong .tuul").css("left",-882*b),$("#chuantong .tuul li img").eq(a+1).attr("src",c),a=b})}})});
<?php if(extension_loaded('zlib')) {ob_end_flush();} ?>