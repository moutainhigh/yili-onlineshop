<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/include/taglib.jsp" %><!-- 标签库引用 -->
<%@ include file="/WEB-INF/include/bootstrap.jsp" %><!--  主要的css样式和javascript的引用 -->
<%@ include file="/WEB-INF/include/dialog.jsp" %><!-- 弹出框引用 -->
<%@ include file="/WEB-INF/include/ztree.jsp" %><!-- 弹出框引用 -->


<!DOCTYPE html>
<html lang="zh-CN">
<head>
	<title>商品价格导入</title>
	 <script type="text/javascript">
	 </script>
</head>
 <body id="index"  style="background:#fff">
   
        <div class="container-fluid" >
            <div class="row">

			  <div class="col-md-10 content" >
			  
				      <form class="form-horizontal" method="post" enctype="multipart/form-data" 
				      		 id="skuPriceExcel" action="${contextPath}/sku/importSkuPriceExcel">
				 		
						<div class="form-group">
							<label class="col-sm-2 control-label">上传Excel路径：</label>
							<div class="col-sm-2">
						 		<input type="file"  id="excelFile" name="excelFile"/>
							</div>
						</div>
						
						<button type="submit" class="btn btn-success">提交</button> 
						
					</form>
       		</div>
       	  </div>
       	</div>
   </body>
</html>