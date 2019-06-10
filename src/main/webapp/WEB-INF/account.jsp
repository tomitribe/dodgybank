<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Jekyll v3.8.5">
    <title>Dodgy Bank</title>

    <!-- Bootstrap core CSS -->
    <link href="/bank/css/bootstrap.css" rel="stylesheet">


    <style>
        .bd-placeholder-img {
            font-size: 1.125rem;
            text-anchor: middle;
            -webkit-user-select: none;
            -moz-user-select: none;
            -ms-user-select: none;
            user-select: none;
        }

        @media (min-width: 768px) {
            .bd-placeholder-img-lg {
                font-size: 3.5rem;
            }
        }

        .starter-template {
            position: relative;
            top: 100px;
        }
    </style>
</head>
<body>
<nav class="navbar navbar-expand-md navbar-dark bg-dark fixed-top">
    <a class="navbar-brand" href="#">Navbar</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarsExampleDefault">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">Link</a>
            </li>
            <li class="nav-item">
                <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">Disabled</a>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="dropdown01" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Dropdown</a>
                <div class="dropdown-menu" aria-labelledby="dropdown01">
                    <a class="dropdown-item" href="#">Action</a>
                    <a class="dropdown-item" href="#">Another action</a>
                    <a class="dropdown-item" href="#">Something else here</a>
                </div>
            </li>
        </ul>
    </div>
</nav>

<main role="main" class="container">

    <div class="starter-template">
        <h1>Account Transactions: ${account.accountName}</h1>
        <table class="table table-striped table-bordered table-condensed">
            <tr>
                <th>Date</th>
                <th>Account</th>
                <th>Reference</th>
                <th>Amount</th>
            </tr>
            <c:forEach items="${account.accountTransactionList}" var="tx">
                <tr>
                    <td><fmt:formatDate pattern="yyyy-MM-dd" value="${tx.date}" /></td>
                    <td>${tx.targetAccountNumber}</td>
                    <td>${tx.reference}</td>
                    <td><fmt:formatNumber type="currency" value="${tx.amount}" currencySymbol="$" minFractionDigits="2" maxFractionDigits="2" /></td>
                </tr>
            </c:forEach>
        </table>
        <form method="post" action="/bank/account/withdrawal">
            <div class="form-group">
                <label for="targetAccountNumber" class="col-sm-4 control-label"> Name</label>
                <div class="col-sm-4">
                    <select id="targetAccountNumber" name="targetAccountNumber">
                        <option value=""></option>
                        <option value="007">007 - Jon</option>
                        <option value="12345678">12345678 - Grocery Store</option>
                        <option value="55490912">55490912 - Book Store</option>
                        <option value="001">001 - Bank Charges</option>
                        <option value="63850663">63850663 - Guitar Store</option>
                    </select>
                </div>
            </div>
            <div class="form-group">
                <label for="reference" class="col-sm-4 control-label">Description</label>
                <div class="col-sm-6">
                    <input type="text" class="form-control" id="reference" name="reference" placeholder="Reference" autofocus>
                </div>
            </div>
            <div class="form-group">
                <label for="amount" class="col-sm-4 control-label">Amount</label>
                <div class="col-sm-6">
                    <input type="text" class="form-control" id="amount" name="amount" placeholder="0.00" autofocus>
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-4 col-sm-8">
                    <button type="submit" class="btn btn-primary">Make Withdrawal</button>
                </div>
            </div>
        </form>
    </div>

</main><!-- /.container -->
</html>
