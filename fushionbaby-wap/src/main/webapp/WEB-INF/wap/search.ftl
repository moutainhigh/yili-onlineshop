<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <title>Fushionbaby触屏版-搜索</title>
    <meta name="apple-mobile-web-app-title" content="兜士宝-搜索">
    <script type="text/javascript" src="js/public-headTag.js"></script><!-- 公共头部便签，css -->
  </head>
  <body id="search">
    <div class="container">
      <div class="public_header fl width100">
        <div class="public_header_wrap fl width100">
          <a class="public_back" href="javascript:void(0);" onclick="history.go(-1);">返回</a>
          搜索
          <a class="public_btn_r" href="javascript:void(0);" onclick="history.go(-1);">取消</a>
        </div>
      </div>
      <div class="public_form_wrap">
        <form action="">
          <div class="public_input_wrap">
            <input id="search_input" class="" type="text" name="" placeholder="请输入关键字" data-toggle="tooltip" title="请输入关键字">
            <button id="search_btn" type="button"></button>
          </div>
        </form>
      </div>
    </div>
    <script type="text/javascript" src="js/footer.js"></script>
    <script>
    $(function(){
      $('#search_input').tooltip({
        /*  工具提示显示方式：手动  */
        trigger: 'manual'
      });
      $("#search_btn").click(function() {
          /*  验证输入非空  */
        if ($('#search_input').val() != "") {
          window.location='search_result.html';/* 跳转到搜索结果页面(搜索结果为空的页面：search_result_none.html)  */
          $('#search_input').tooltip('hide');
          $(this).parent().removeClass("has-error").addClass("has-success");
        } else {
          $('#search_input').tooltip('show');
          $(this).parent().removeClass("has-success").addClass("has-error");
        }
      })
    })
    </script>
  </body>
</html>