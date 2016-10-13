<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <title>Fushionbaby触屏版-修改密码</title>
    <meta name="apple-mobile-web-app-title" content="兜士宝-修改密码">
    <script type="text/javascript" language="javascript">
	    var _ContextPath = "${rc.contextPath}";
    </script>
    <script type="text/javascript" src="${rc.contextPath}/wap/js/public-headTag.js"></script><!-- 公共头部便签，css -->
  </head>
  <body id="change-passward">
    <div class="container">
      <div class="public_header fl width100">
        <div class="public_header_wrap fl width100">
          <a class="public_back" href="javascript:void(0);"  onclick="history.go(-1);">返回</a>
          修改密码
          <a class="public_btn_r disabled" href="javascript:void(0);"></a>
        </div>
      </div>
      <div class="public_form_wrap">
        <form action="">
          <div class="public_input_wrap">
            <input id="passwards_input_change_1" class="passwards_input required" type="password" name="oldPwd" placeholder="请输入您的旧密码" data-toggle="tooltip" title="请输入您的旧密码">
          </div>
          <div class="public_input_wrap">
            <input id="passwards_repeat" class="passwards_input passwards_repeat required" type="password" name="passward" placeholder="请设置您的密码" data-toggle="tooltip" title="请设置6位登录密码">
          </div>
          <div class="public_input_wrap">
            <input id="passwards_repeat_2" class="passwards_repeat_2 required" type="password" name="passwards_repeat_2" placeholder="请再次输入您的密码" data-toggle="tooltip" title="请再次输入您的密码">
          </div>
          <button id="change_passward_btn" class="public_button" type="button">确定修改</button>
        </form>
      </div>
    </div>

    <!-- 对话框 -->
    <div class="public_modal_backup">
      <div class="public_modal">
        <div class="modal_body" id="modal_body">修改成功</div>
        <div class="modal_foot">
          <button class="modal_confirm only_confirm">好</button>
        </div>
      </div>
    </div>
  

    <script type="text/javascript" src="${rc.contextPath}/wap/js/footer.js"></script>
    <script type="text/javascript" src="${rc.contextPath}/wap/js/iPass.packed.js"></script>
    <script>
    $(function(){
      /*  表单提交，最终验证  */
      $("#change_passward_btn").click(function() {
        $(".required").trigger('blur');
        var numError = $('form .has-error').length;
        if (numError) {
          return false;
        }
        /*  alert("成功.");  */
        var url = "${rc.contextPath}/changePassword/confirmChangePassword.do";
			$.ajax({
				type:"POST",
	            async:false,
	            url:url,
	            data:"oldPwd="+$("#passwards_input_change_1").val()+"&password="+$("#passwards_repeat").val(),
				success : function(data) {
					if(data.responseCode==0){
						$(this).addClass('public_loading');
						$("#modal_body").text("修改成功");
						$('.public_modal_backup').fadeIn();/* 显示对话框  */
						$(".modal_confirm").click(function() {
				            $('.public_modal_backup').fadeOut();
				            $("#change_passward_btn").removeClass('public_loading');
				          });
					}else{
						$(this).addClass('public_loading');
						$("#modal_body").text(data.msg);
						$('.public_modal_backup').fadeIn();/* 显示对话框  */
						$(".modal_confirm").click(function() {
				            $('.public_modal_backup').fadeOut();
				            $("#change_passward_btn").removeClass('public_loading');
				          });
					}
				}//end success
			});//end ajax
        
        
      })
    })
    </script>
  </body>
</html>