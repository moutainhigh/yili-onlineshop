<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/include/taglib.jsp" %><!-- 标签库引用 -->
<%@ include file="/WEB-INF/include/bootstrap.jsp" %><!--  主要的css样式和javascript的引用 -->
<%@ include file="/WEB-INF/include/dialog.jsp" %><!-- 弹出框引用 -->
<%@ include file="/WEB-INF/include/datetimepicker.jsp" %><!-- 日历控件引用 -->    
<!DOCTYPE html>
<html lang="zh-CN">
    <head>
        <meta charset="utf-8" />
        <title>如意宝账户银行列表</title>
    </head>
    <script type="text/javascript">
    

    function Edit(id){
    	window.location.href = "${contextPath}/alabaoBankConfig/alabaoBankConfigEditJsp/"+id+"/"+new Date().getTime();
    }
    
    
    function  Del(id){
		
  		var submit =  function(v,h,f){
  			if(v=="ok"){
  				window.location.href = "${contextPath}/alabaoBankConfig/alabaoBankConfigDel/"+id+"/"+new Date().getTime();
  			}
  			return true;
  		} 
  		$.jBox.confirm("你确定要删除吗？", "删除提示",submit);
    }
    
    
    function change_bankBranch(id,bankBranchName){
  		$('#bankBranch_'+id).html("<input id='bankBranchInput_"+id+"' value='"+bankBranchName+"'>");
  		var confirmA="<a class='btn btn-danger btn-xs' href='javascript:update_bankBranch("+id+")' title='修改'>确定修改</a>";
  		$('#changeBankBranch_'+id).html(confirmA);
  	}
  	function update_bankBranch(id){
  		var bankBranchName=$("#bankBranchInput_"+id).val();
  		var submit =  function(v,h,f){
  			if(v=="ok"){
  				$.post('${pageContext.request.contextPath}/alabaoAccountBank/updateBankBranch',{id:id,bankBranchName:bankBranchName,time:new Date().getTime()},
  	  					 function(data){
  	  					   if(data.result=="success"){
  	  						    jBox.tip("修改支行信息成功");
	  	  						window.setTimeout(function () {  
	  	  							$("#findForm").submit();
	  							}, 500);
	  	  						   
  	  					   }else{
  	  							jBox.tip("修改支行信息失败");
  	  					   }
  	  				});//post
  			}else{
  	  			 $("#findForm").submit();
  	  		}
  			return true;
  		} 
  		$.jBox.confirm("确定修改支行信息吗？", "修改支行信息提示",submit);
  		
  	}
  	
  
  	function deleteAccountBank(id){
  		var submit =  function(v,h,f){
  			if(v=="ok"){
  				$.post('${pageContext.request.contextPath}/alabaoAccountBank/deleteAccountBank',{id:id,time:new Date().getTime()},
  	  					 function(data){
  	  					   if(data=="SUCCESS"){
  	  						    jBox.tip("删除成功");
	  	  						window.setTimeout(function () {  
	  	  							$("#findForm").submit();
	  							}, 500);
	  	  						   
  	  					   }else{
  	  							jBox.tip("删除失败");
  	  					   }
  	  				});//post
  			}else{
  	  			 $("#findForm").submit();
  	  		}
  			return true;
  		} 
  		$.jBox.confirm("确定删除吗？", "删除支行信息提示",submit);
  		
  	}
  	
  	function change_isValidate(id,validateStatus){
  		var submit =  function(v,h,f){
  			if(v=="ok"){
  				window.location.href = "${contextPath}/alabaoAccountBank/updateAccountIsValidate/"+id+"/"+ validateStatus +"/"+new Date().getTime();
  			}
  			return true;
  		} 
  		$.jBox.confirm("你确定要修改认证状态吗？", "修改认证状态提示",submit);
  	}
    </script>
    
    <body id="" class="Cog">
           <tags:message content="${message}"></tags:message>
        <div class="container-fluid">
            <div class="row">
               <%--  <div id="menu">
                <script src="${contextStatic}/bootstrap/js/leftMenu.js"></script><!-- 公共左侧菜单 -->
                </div> --%>
                <div class="col-md-12 content">
                    <div class="panel panel-info">
                        <div class="panel-heading">
                            <h3 class="panel-title"><i class="fa fa-user"></i>如意宝账户银行列表 </h3>
                        </div>
                        <div class="panel-body">
                            <form class="form-inline page" id="findForm" method="post" action="${contextPath}/alabaoAccountBank/alabaoAccountBankList">
                                
					   <div class="form-group col-md-4 mB15">
	    					<label for="code" class="col-label">如意宝账户名称：</label>
	      					<input type="text" id="account" name="account" class="form-control" value="${account}"
	      						 placeholder="如意宝账户名称">
	  					</div>
				    
					    <div class="form-group col-md-4 mB15">
	    					<label for="name" class="col-label">银行卡卡号：</label>
	      					<input type="text" id="cardNo" name="cardNo" class="form-control" value="${cardNo}"  
	      						placeholder="银行卡卡号" >
	  					</div>
	  					
	  					<div class="form-group col-md-4 mB15">
	    					<label for="name" class="col-label">持卡人姓名：</label>
	      					<input type="text" id="cardNo" name="cardHolder" class="form-control" value="${cardHolder}"  
	      						placeholder="持卡人姓名" >
	  					</div>
	  					
	                    <div class="form-group col-md-4 mB15">
			                  <label for="a" class="col-label">创建开始时间：</label>
			                  <div class="input-group">
			                  <input type="text" name="createTimeFrom" value="${createTimeFrom}" class="timeS form-control form_datetime" readonly>
			                  <div class="input-group-addon form_datetime_addon"><i class="fa fa-times"></i></div>
			                  </div>
			            </div>
			            <div class="form-group col-md-4 mB15">
			                  <label for="a" class="col-label">创建结束时间：</label>
			                  <div class="input-group">
			                  <input type="text" name="createTimeTo" value="${createTimeTo}" class="timeE form-control form_datetime" readonly>
			                  <div class="input-group-addon form_datetime_addon"><i class="fa fa-times"></i></div>
			                  </div>
			            </div>

                                <div class="form-group col-md-4 mB15">
                                <button type="submit" class="btn btn-success speBtn">查 询</button>
                                </div>
                                
                                <input type="hidden" name="currentPage" value="${page.currentPage}"/>
								<input type="hidden" name="totalPage" value="${page.totalPage}" disabled="disabled"/>  
								<input type="hidden" name="limit" value="${page.limit}"  size="3"/>
								<input type="hidden" name="total" value="${page.total}"/>
								
                                <div class="clearfix"></div>
                        </form>   
                            <!-- table -->
                            <div class="table-responsive">
                                <table class="table table-bordered table-hover" id="roleTable">
                                    <thead>
                                        <tr>
                                            <th>序号</th>
                                            <th>如意宝账户名</th>
                                            <th>银行名称</th>
                                            <th>支行名称</th>
                                            <th>银行卡号</th>
                                            <th>持有人</th>
                                            <th>创建时间</th>
                                            <th>认证状态</th>
											<th>操作</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${page.result}" var="list" varStatus="status">
                                    	<tr>
                                            <td>${status.count}</td>
                                            <td>${list.account}</td>
                                            <td>${list.bankName}</td>
                                            <td id="bankBranch_${list.id}">${list.bankBranchName}</td>
                                            <td>${list.cardNo}</td>
                                            <td>${list.cardHolder}</td>
                                            <td><fmt:formatDate value="${list.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                                          
                                            <td>
                                                <c:if test="${list.isValidate=='1'}">未认证</c:if>
                                            	<c:if test="${list.isValidate=='2'}">认证失败</c:if>
                                            	<c:if test="${list.isValidate=='3'}">已认证</c:if>
                                            </td>
                                           
                                            <td>
                                            	<div id="changeBankBranch_${list.id}">
													<a class="btn btn-info btn-xs" href="javascript:change_bankBranch('${list.id}','${list.bankBranchName}')" title="修改支行名称">	
														修改支行名称
													</a>
												</div>
												<c:if test="${list.isValidate ne '3'}"><a class="btn btn-info btn-xs" href="javascript:change_isValidate('${list.id}','3')" title="通过认证">	
														通过认证
													</a></c:if>
												<c:if test="${list.isValidate ne '2'}"><a class="btn btn-info btn-xs" href="javascript:change_isValidate('${list.id}','2')" title="不通过认证">	
														不通过认证
													</a></c:if>
												<a class="btn btn-danger btn-xs" href="javascript:deleteAccountBank('${list.id}')" title="删除支行名称">	
														删除
												</a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                            <!-- 分页 -->
                             <tags:page formId="findForm" url="${contextPath}/alabaoAccountBank/alabaoAccountBankList"></tags:page>
                            <!-- 分页 end -->
                             
                        </div>
                        <!-- /.panel-body -->
                    </div>
                </div>
                <!-- /.content -->
            </div>
        </div>
        <!-- /.container-fluid -->

    </body>
</html>