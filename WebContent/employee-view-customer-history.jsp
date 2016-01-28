<!--Author: Xiangfei Dong-->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 

<!DOCTYPE html>
<html lang="en">
<head>
  <title>View Customer history</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</head>

<body>
  <!-- nav bar-->
  <jsp:include page="employee-header.jsp" />

  <div class="container-fluid">
    <div class="row-fluid">
      <!--side bar-->
      <div class="col-sm-2">
        <jsp:include page="employee-manage-customers-sidebar.jsp" />
      </div>

      <!--content-->
      <div class="col-sm-10">
        <!--current path-->
        <div>
          <ul class="breadcrumb">
            <li><a href="employee-index.jsp"> <i class="icon-home"></i>Home</a></li>
            <li class="active">View Transaction History</li>
          </ul>
        </div>

        <!--error panel-->
        <c:if test="${not empty errors}">
          <div>
            <div class="panel panel-danger">
              <div class="panel-heading">
                <h3 class="panel-title">Warning!</h3>
              </div>
              <div class="panel-body">
                <c:forEach var="error" items="${errors}">
                	<p>${error}</p>
                </c:forEach>
              </div>
            </div>
          </div>
        </c:if>
        
        <div class="row">
          <div class="col-sm-8">
            <!--customer's info-->
            <div class="panel panel-default">
                <div class="panel-heading">
                  <h3 class="panel-title">Customer's Information</h3>
                </div>
                <div class="panel-body">
                    <h5 class="text-info">Name: </h5>
                    <p>&nbsp;&nbsp;${visitor.firstName} ${visitor.lastName}</p>
                    <h5 class="text-info">Address</h5>
                    <p>&nbsp;&nbsp;${visitor.addrLine1}<br>&nbsp;&nbsp;${visitor.addrLine2}<br>&nbsp;&nbsp;${visitor.zip} &nbsp;&nbsp;${visitor.city}</p>
                </div>
              </div>
              
            <!--history list-->
            <div class="panel panel-default">
              <div class="panel-heading">
                <h3 class="panel-title">Customer's Transaction History</h3>
              </div>
              <div class="panel-body">
                <table class="table">
              <thead>
                <tr>
                  <th>Operation</th><th>Fund Name</th><th>Fund Symbol</th><th>Execute Date</th><th>Shares</th><th>Price</th><th>Amount</th>
                </tr>
              </thead>
              <tbody>
                <c:forEach var="transaction" items="${transactions}">
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

          <div class="col-sm-4">
            <!--input user name-->
            <div class="panel panel-default">
                <div class="panel-heading">
                  <h3 class="panel-title">Input Username</h3>
                </div>
                <div class="panel-body">
                  <form class="form-inline" role="form" method="post" action="employee_view_customer_transaction_history.do">
                    <div class="form-group"> 
                      <label for="balance">Username</label>
                      <input type="text" class="form-control" name="username" id="user-name" /><br><br>
                    </div>
                    <div>
                      <button type="submit" class="btn btn-default">Submit</button>
                    </div>
                  </form>
                </div>
              </div>

            <!--user list-->
              <div class="panel panel-default">
                <div class="panel-heading">
                  <h3 class="panel-title">Customer List</h3>
                </div>
                <div class="panel-body">
                  <table class="table">
                      <thead>
                        <tr>
                          <th>Username</th><th>Name</th><th></th>
                      </thead>
                      <tbody>
                        <c:forEach var="customer" items="${customerlist}">
                        	<tr>
		                      <td>${customer.userName}</td>
		                      <td>${customer.firstName} ${customer.lastName}</td>
		                      <td><button onclick="document.getElementById('user-name').value = '${customer.userName}';">View</button></td>
                     	</c:forEach>
                      </tbody>
                    </table>
                </div>
              </div>
          </div>
        </div>
      </div>
    </div>
  </div>

  <!--footer-->
  <jsp:include page="footer.jsp" />

</body>
</html>
