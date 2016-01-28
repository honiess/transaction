<!--Author: Xiangfei Dong-->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 

<!DOCTYPE html>
<html lang="en">
<head>
  <title>View Customer Account</title>
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
            <li><a href="#"> <i class="icon-home"></i>Home</a></li>
            <li class="active">View Customer Account</li>
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

        <!--success panel-->
        <c:if test="${not empty success}">
          <div>
            <div class="panel panel-success">
              <div class="panel-heading">
                <h3 class="panel-title">Success!</h3>
              </div>
              <div class="panel-body">
                <p>${success}</p>
                <a href="employee-index.jsp">Return</a>
              </div>
            </div>
          </div>
        </c:if>
        
        <div class="container-fluid">
          <div class="row">
            <div class="col-md-7">
              <!--basic info-->
              <div class="panel panel-default">
                <div class="panel-heading">
                  <h3 class="panel-title">Customer's Information</h3>
                </div>
                <div class="panel-body">
                    <h5 class="text-info">Name: </h5>
                    <p>&nbsp;&nbsp;${visitor.firstName} ${visitor.lastName}</p>
                    <h5 class="text-info">Address</h5>
                    <p>&nbsp;&nbsp;${visitor.addrLine1}<br>&nbsp;&nbsp;${visitor.addrLine2}<br>&nbsp;&nbsp;${visitor.zip} ${visitor.city}</p>
                </div>
              </div>

              <!--fund list-->
              <div class="panel panel-default">
                <div class="panel-heading">
                  <h3 class="panel-title">Customer's Funds</h3>
                </div>
                <div class="panel-body">
                  <h5 class="text-info">Cash Balance: $</h5><p>${cash}<p>
                  <h5 class="text-info">Last Trading Day: </h5><p>${lastdate}<p>
                  <table class="table">
                    <thead>
                      <tr>
                        <th align="center">Fund Name</th><th align="center">Fund Symbol</th><th align=right>Shares</th><th align="right">Available Shares</th><th align="right">Price</th><th align="right">Value</th>
                      </tr>
                    </thead>
                    <tbody>
                      <c:forEach var="fund" items="${customerfund}">
                        <tr>
                          <td>${fund.name}</td>
                          <td>${fund.symbol} </td>
                          <td align="right">${fund.shares} </td>
                          <td align="right">${fund.availableShares} </td>
                          <td align="right">${fund.price} </td>
                          <td align="right">${fund.value} </td>
                        </tr>
                      </c:forEach>
                    </tbody>
                  </table>
                </div>
              </div>
            </div>

            <div class="col-md-5">
              <!--input user name-->
            <div class="panel panel-default">
                <div class="panel-heading">
                  <h3 class="panel-title">Input Username</h3>
                </div>
                <div class="panel-body">
                  <form class="form-inline" role="form" method="post" action="employee_view_customer_account.do">
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
                          <th>ID</th><th>Username</th><th>Name</th><th></th>
                      </thead>
                      <tbody>
                        <c:forEach var="customer" items="${customerlist}">
                        	<tr>
		                      <td>${customer.visitorId} </td>
		                      <td>${customer.userName}</td>
		                      <td>${customer.firstName} ${customer.lastName}</td>
		                      <td><button onclick="document.getElementById('user-name').value = '${customer.userName}';">View</button></td>
		                	</tr>
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
  </div>

  <!--footer-->
  <jsp:include page="footer.jsp" />

</body>
</html>
