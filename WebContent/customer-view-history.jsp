<!--Author: Xiangfei Dong-->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 

<!DOCTYPE html>
<html lang="en">
<head>
  <title>Transaction History</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

<!-- styles -->
<link href="css/bootstrap.css" rel="stylesheet" />
<link href="css/datepicker.css" rel="stylesheet" />
<link href="css/bootstrap-responsive.css" rel="stylesheet" />
<link href="css/style.css" rel="stylesheet" />
</head>

<body>
  <!-- nav bar-->
  <jsp:include page="customer-header.jsp" />

  <div class="container-fluid">
    <div class="row-fluid">
      <!--side bar-->
      <div class="col-sm-2">
        <jsp:include page="customer-manage-fund-sidebar.jsp" />
      </div>

      <!--content-->
      <div class="col-sm-10">
        <!--current path-->
        <div>
          <ul class="breadcrumb">
            <li><a href="visitor_view_account.do"> <i class="icon-home"></i>Home</a></li>
            <li class="active">View History</li>
          </ul>
        </div>
        
        <!--buy fund-->
        <div class="panel panel-default">
          <div class="panel-heading">
            <h3 class="panel-title">Transaction History</h3>
          </div>
          <div class="panel-body">
            <table class="table">
              <thead>
                 <tr>
                  <th>Operation</th><th>Fund Name</th><th>Fund Symbol</th><th>Execute Date</th><th>Shares</th><th>Price</th><th>Amount</th>
                </tr>
              </thead>
              <tbody>
                <c:forEach var="transaction" items="${customerFundBeans}">
                	   <c:if test="${not empty transaction.executeDate}">
	                	     <tr class="success">
	                </c:if>
	                <c:if test="${empty transaction.executeDate}">
	                	     <tr class="warning">
	                </c:if>
		                	     <td>
		                        <c:if test="${transaction.transactionType == 1}">Buy Fund</c:if>
		                        <c:if test="${transaction.transactionType == 2}">Sell Fund</c:if>
		                        <c:if test="${transaction.transactionType == 3}">Request Check</c:if>
		                        <c:if test="${transaction.transactionType == 4}">Deposit Check</c:if>
		                      </td>
		                      <td>${transaction.name}</td>
		                      <td>${transaction.symbol}</td>
		                      <td>${transaction.executeDate}</td>
		                      <td align="right">${transaction.shares}</td>
		                      <td align="right">${transaction.price}</td>
		                      <td align="right">${transaction.value}</td>
	                    </tr>
                </c:forEach>
              </tbody>
            </table>
          </div>  
        </div>
      </div>
    </div>
  </div>

  <!--footer-->
  <jsp:include page="footer.jsp" />

</body>
</html>
