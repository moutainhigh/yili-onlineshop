<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/include/taglib.jsp" %><!-- 标签库引用 -->
<%@ include file="/WEB-INF/include/bootstrap.jsp" %><!--  主要的css样式和javascript的引用 -->
<%@ include file="/WEB-INF/include/dialog.jsp" %><!-- 弹出框引用 -->
<%@ include file="/WEB-INF/include/datetimepicker.jsp" %><!-- 日历控件引用 -->
<!DOCTYPE html>
<html>
<head>
	<title>会员邮箱列表</title>
  	<script type="text/javascript">
  	
	  	function queryEmail(){
	  		
	  		$("#findForm").submit();
	  	}
	  	
  	</script>
	
</head>
<body id="index">
		<tags:message content="${message }"></tags:message>
	
        <div class="container-fluid">
            <div class="row">
			  <div class="col-md-12 content">

				<div class="panel panel-info">
                   <div class="panel-heading">
                      <h3 class="panel-title"><i class="fa fa-cog"></i> 会员邮箱列表</h3>
                   </div>
                   <div class="panel-body">
				     <form class="form-inline page" id="findForm" method="post" action="${contextPath }/memberEmail/memberEmailList">
				     
					   <div class="form-group col-md-4 mB15">
	    					<label for="label">邮箱：</label>
	      					<input type="text" id="email" name="email" class="form-control"  value="${memberDto.email}" placeholder="请输入邮箱"/>
	  					</div>
						<div class="form-group col-md-4 mB15">
                            <label for="d" class="col-label">注册开始时间：</label>
                             <div class="input-group">
                                 <input type="text" class="timeS form-control form_datetime" readonly name="createTimeFrom" value="${memberDto.createTimeFrom}">
                                 <div class="input-group-addon form_datetime_addon"><i class="fa fa-times"></i></div>
                             </div>
                         </div>
                         <div class="form-group col-md-4 mB15">
                             <label for="e" class="col-label">注册结束时间：</label>
                             <div class="input-group">
                                 <input type="text" class="timeE form-control form_datetime" readonly name="createTimeTo" value="${memberDto.createTimeTo}">
                                 <div class="input-group-addon form_datetime_addon"><i class="fa fa-times"></i></div>
                             </div>
                             
                         </div>				    
					    	
					    
					    <div class="col-md-4">
	                        <button type="button" class="btn btn-info" onclick="queryEmail()">确认查询</button>
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
							  <th>序号</th>
							  <th>邮箱号</th>
							  <th>注册时间</th>
							 </tr>
                            </thead>
                            <tbody>
                              <c:forEach items="${emailList}" var="tmp" varStatus="status">
								<tr>
								   <td>${status.count}</td>	
								   <td>${tmp.email}</td>	
								   <td><fmt:formatDate value="${tmp.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
								  </tr>
								 </c:forEach>
                                </tbody>
                              </table>
                           </div>
                            
							<tags:page formId="findForm" url="${contextPath }/memberEmail/memberEmailList"></tags:page>
                            <!-- 分页 end -->
                        </div>
					</div>
                </div>
                <!-- /.content -->
            </div>
		</div>
       
        <!-- /.container-fluid -->
</body>
</html>
