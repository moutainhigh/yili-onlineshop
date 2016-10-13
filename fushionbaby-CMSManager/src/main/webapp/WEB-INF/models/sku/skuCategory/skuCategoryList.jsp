<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/include/taglib.jsp" %><!-- 标签库引用 -->
<%@ include file="/WEB-INF/include/bootstrap.jsp" %><!--  主要的css样式和javascript的引用 -->
<%@ include file="/WEB-INF/include/dialog.jsp" %><!-- 弹出框引用 -->
<%@ include file="/WEB-INF/include/datetimepicker.jsp" %><!-- 日历控件引用 -->
<!DOCTYPE html>
<html>
<head>
	<title>商品分类管理</title>
  	<script type="text/javascript">
	  	function showAddSkuCategory(){
	  		var url = "iframe:${contextPath}/skuCategory/gotoSkuCategoryAdd";
			$.jBox(url, {
	  		    title: "分类新增", width: 800,height: 600,
	  		    buttons: { '关闭': false }
			});
	  	}
	  	function showAddSkuCategoryByCategoryId(categoryId){
	  		var url = "iframe:${contextPath}/skuCategory/gotoSkuCategoryAddByCategoryId?categoryId="+categoryId;
			$.jBox(url, {
	  		    title: "新增子分类", width: 800,height: 600,
	  		    buttons: { '关闭': false }
			});
	  	}
	  	function showUpdateCategory(categoryId){
	  		var url = "iframe:${contextPath}/skuCategory/gotoSkuCategoryUpdate?categoryId="+categoryId;
			$.jBox(url, {
	  		    title: "分类修改", width: 800,height: 600,
	  		    buttons: { '关闭': false }
			});
	  	}
	  	
	  	function skuCategoryImageList(categoryCode){
	  		window.location.href="${contextPath}/skuCategory/skuCategoryImageList?categoryCode="+categoryCode+"&time="+new Date().getTime();
	  	}
	  	
	  
	 	function importSkuCategory(){
	  		var url = "iframe:${contextPath}/skuCategory/batchSkuCategory";
			$.jBox(url, {
	  		    title: "EXCEL批量导入商品分类", width: 400,height: 200,
	  		    buttons: { '关闭': false },
	  		  	submit: function (v, h, f) {
	              if (v == 0) {
	            	  return ;
	              }
	              
	  		  	}
			});
	  	}
	  	
	  	
	  	
	  	
  	</script>
	
</head>
<body id="index">
		<tags:message content="${message}"></tags:message>

        <div class="container-fluid">
            <div class="row">
			  <div class="col-md-12 content">
				<div class="panel panel-info">
                   <div class="panel-heading">
                      <h3 class="panel-title"><i class="fa fa-cog"></i> 商品分类列表</h3>
                   </div>
                   <div class="panel-body">
				     <form class="form-inline page" id="findForm" method="post">
				     
					   <div class="form-group col-md-4 mB15">
	    					<label for="code" class="col-label">分类编码：</label>
	      					<input type="text" id="brandCode" name="code" class="form-control" value="${skuCategoryDto.code}"
	      						 placeholder="分类编码">
	  					</div>
				    
					    <div class="form-group col-md-4 mB15">
	    					<label for="name" class="col-label">分类名称：</label>
	      					<input type="text" id="brandName" name="name" class="form-control" value="${skuCategoryDto.name}"  
	      						placeholder="分类名称" >
	  					</div>
	  					
				   		<div class="form-group col-md-4 mB15">
    						<label class="col-label">是否显示：</label>
      						<select name="isShow" class="form-control lg-select" data-placeholder="Choose a Category" tabindex="1">
								<option value="" selected="selected">所有</option>
					            <option value="y" ${skuCategoryDto.isShow =='y'?'selected':''}>显示</option>
					            <option value="n" ${skuCategoryDto.isShow =='n'?'selected':''}>不显示</option>
					        </select>
    					</div>
					    
					    <div class="form-group col-md-4 mB15">
    						<label class="col-label">分类级别：</label>
      						<select name="categoryLevel" class="form-control lg-select" data-placeholder="Choose a Category" tabindex="1">
								<option value="" selected="selected">所有</option>
					            <option value="1" ${skuCategoryDto.categoryLevel =='1'?'selected':''}>一级</option>
					            <option value="2" ${skuCategoryDto.categoryLevel =='2'?'selected':''}>二级</option>
					            <option value="3" ${skuCategoryDto.categoryLevel =='3'?'selected':''}>三级</option>
					        </select>
    					</div>
					    
					    <div class="form-group col-md-4 mB15">
	    					<label for="code" class="col-label">父分类编码：</label>
	      					<input type="text" id="grandcategoryCode" name="grandcategoryCode" class="form-control" value="${skuCategoryDto.grandcategoryCode}"
	      						 placeholder="父分类编码">
	  					</div>
	  					<div class="form-group col-md-12 mB15">
	                        <button type="submit" class="btn btn-info" >确认查询</button>
	                        <button type="button" class="btn btn-primary" onclick="showAddSkuCategory()">新增分类</button>
	                        <button type="button" class="btn btn-warning" onclick="importSkuCategory()">批量导入商品分类</button>
	                        <button type="button" class="btn btn-success" onclick="downLoadExcel('批量导入商品分类模板\.xls')">下载批量导入商品分类模板</button>
				    	</div>
				   		<div class="clearfix"></div>
				   		 
				   		<input type="hidden" name="currentPage" value="${page.currentPage}"/>
						<input type="hidden" name="totalPage" value="${page.totalPage}" disabled="disabled"/>  
						<input type="hidden" name="limit" value="${page.limit}"  size="3"/>
						<input type="hidden" name="total" value="${page.total}"/>
					  </form>
                      <!-- table -->
                      <div class="table-responsive">
                        <table class="table table-bordered table-hover" id="roleTable">
                           <thead>
                             <tr>
                              <th>
                                <label for="checkAllBtn" class="check-label">
                                   <input type="checkbox" name="checkAllBtn" id="checkAllBtn">
                                </label>
                              </th>
                              <th>序号</th>
							  <th>分类编码</th>
							  <th>分类名称</th>
							  <th>分类图片</th>
							  <th>英文名称</th>
							  <th>父分类编码</th>
							  <th>父分类名称</th>
							  <th>分类级别</th>
							  <th>创建时间</th>
							  <th>是否显示</th>
							  <th>操作</th>
							 </tr>
                            </thead>
                            <tbody>
                              <c:forEach items="${skuCategoryDtoList}" var="skuCategoryList" varStatus="status">
								<tr>
								  <td>
									<label for="checkAllBtn" class="check-label">
                                      <input type="checkbox" name="checkAllBtn" id="checkAllBtn">
                                     </label>
								   </td>	
								   <td scope="row">${status.count}</td>
								   <td>${skuCategoryList.code}</td>	
								   <td>${skuCategoryList.name}</td>	
								   <td><a href="${imagePath}${skuCategoryList.categoryLogoUrl}"  class="fancybox" rel="gallery">
								   	<img src="${imagePath}${skuCategoryList.categoryLogoUrl}"
								   		kesrc ="${imagePath}${skuCategoryList.categoryLogoUrl}" width="50" height="50" /></a>
								   </td>
								   <td>${skuCategoryList.englishName}</td>
								   <td>${skuCategoryList.grandcategoryCode}</td>
								   <td>${skuCategoryList.grandcategoryName}</td>
								   <td>${skuCategoryList.categoryLevel}</td>
								   <td><fmt:formatDate value="${skuCategoryList.createTime}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
								   <td>
								   	 <c:if test="${skuCategoryList.isShow=='y'}">显示</c:if>
								   	 <c:if test="${skuCategoryList.isShow=='n'}">不显示</c:if>
								   </td>
								   <td>	
								   	 <c:if test="${skuCategoryList.categoryLevel != '3'}">												
										 <a class="btn btn-default btn-xs edit-role" href="javascript:showAddSkuCategoryByCategoryId('${skuCategoryList.id}');" title="新增">	
											新增
										 </a>
									 </c:if>	
									 <a class="btn btn-default btn-xs edit-role" href="javascript:showUpdateCategory('${skuCategoryList.id}');" title="修改">	
										修改
									 </a>
									 <a class="btn btn-default btn-xs edit-role" href="${contextPath}/skuCategory/brandListByCategory?categoryCode=${skuCategoryList.code}" title="关联品牌">	
										关联品牌
									 </a>
									 <a class="btn btn-default btn-xs edit-role" href="javascript:skuCategoryImageList('${skuCategoryList.code}');" title="分类图片">	
										分类图片
									 </a>
								   </td>	
								  </tr>
								 </c:forEach>
                                </tbody>
                              </table>
                           </div>
                           <tags:page formId="findForm" url="${contextPath}/skuCategory/findSkuCategoryList"></tags:page>
                        </div>
					</div>
                </div>
                <!-- /.content -->
            </div>
		</div>
        <!-- /.container-fluid -->
</body>
</html>
