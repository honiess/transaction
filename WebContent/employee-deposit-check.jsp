<!--Author: Xiangfei Dong-->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 

<!DOCTYPE html>
<html lang="en">
<head>
  <title>Deposit Check</title>
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
            <li class="active">Deposit Check</li>
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
                <a href="employee_deposit_check.do">Return</a>
              </div>
            </div>
          </div>
        </c:if>

		<c:if test="${empty success}">
        <!--deposit check-->
        <div class="panel panel-default">
          <div class="panel-heading">
            <h3 class="panel-title">Deposit Check</h3>
          </div>
          <div class="panel-body">
            <form class="form-inline" role="form" method="post" action="employee_deposit_check.do">
              <h5 class="text-info">Customer Name</h5><p id="customer-name"></p>
              <h5 class="text-info">Balance: </h5><p id="customer-balance"></p>
              <label for="balance">User Name</label>
              <input type="text" class="form-control" name="userName" id="customer-username" value="form.userName" />
              <label for="balance">Amount $</label>
              <input type="text" class="form-control" name="amount" value="form.amount" />
              <button type="submit" class="btn btn-default">Submit</button>
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
                  <th>Customer#</th><th>User Name</th><th>Name</th><th>Balance</th><th></th>
                </tr>
              </thead>
              <tbody>
                  <c:forEach var="customer" items="${customerlist}">
                  <tr>
                    <td>${customer.visitorId} </td>
                    <td>${customer.userName}</td>
                    <td>${customer.firstName} ${customer.lastName}</td>
                    <td>${customer.availableCash} </td>
                    <td><button type="submit" class="btn btn-default" onclick="document.getElementById('customer-username').value = '${customer.userName}';document.getElementById('customer-balance').innerHTML = '$'+'${customer.availableCash}';document.getElementById('customer-name').innerHTML = '${customer.firstName}' + ' ' + '${customer.lastName}';">Deposit</button></td>
                    
                    </tr>
                   </c:forEach>
              </tbody>
            </table>
          </div>
        </div> 
        </c:if>
      </div>
    </div>
  </div>

  <!--footer-->
  <jsp:include page="footer.jsp" />

</body>
</html>
