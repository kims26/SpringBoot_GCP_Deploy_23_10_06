<%@ page language='java' contentType='text/html;charset=UTF-8' pageEncoding='UTF-8'%>
<%@ taglib prefix='c'    uri='http://java.sun.com/jsp/jstl/core' %>
<%@ taglib prefix='fmt'  uri='http://java.sun.com/jsp/jstl/fmt'%>
<%@ taglib prefix='fn'  uri='http://java.sun.com/jsp/jstl/functions'%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <!-- $("#total_amount").val(""); -->
    


</head>
<body>
    <form method="POST" action="ready">
       <input type="hidden"  name="product_name" value="컴퓨터">
       <input type="hidden"  name="quantity" value="1">
       <input type="hidden" id="total_amount"  name="total_amount" value="10000">
       <input type="submit" value="결제하기" >
    </form>
</body>
</html>