<%@ page import="java.util.List" %>
<%@ page import="com.nf.bookstore1.entity.Book" %>
<%@ page import="util.WebUtil" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>图书列表</title>
    <link rel="stylesheet" href="../assets/css/bootstrap.css"/>
    <link rel="stylesheet" href="../assets/css/dashboard.css"/>
    <style>
        @-webkit-keyframes fadeIn {
            0% {
                opacity: 0; /*初始状态 透明度为0*/
            }
            50% {
                opacity: 0; /*中间状态 透明度为0*/
            }
            100% {
                opacity: 1; /*结尾状态 透明度为1*/
            }
        }

        table {
            padding: 5px 1em;
            border-collapse: collapse;
            -webkit-animation-name: fadeIn; /*动画名称*/
            -webkit-animation-duration: 1s; /*动画持续时间*/
            -webkit-animation-iteration-count: 1; /*动画次数*/
            -webkit-animation-delay: 0s; /*延迟时间*/
        }
    </style>
</head>
<body>

<%= WebUtil.popSessionMsg(request) %>

<form action="/book/del" method="post">
    <table class="table table-striped" id="tab">
        <tr>
            <th><input type="checkbox" onclick="alls(this)"></th>
            <th>id</th>
            <th>书名</th>
            <th>价格</th>
            <th>作者</th>
            <th>出版社</th>
            <th>其他</th>
        </tr>
        <%-- <%

             List<Book> books = (List<Book>) request.getAttribute("books");
             pageContext.setAttribute("bs", books);

         %>--%>
        <%--<c:forEach var="books" items="${requestScope.books}">
            <tr>
                <td><input name="id" value="<c:out value="${books.id}"/>" type="checkbox"></td>
                <td><c:out value="${books.id}"/>
                </td>
                <td><a href="book/detail?id=<c:out value="${books.id}"/>"><c:out value="${books.name}"/>
                </a></td>
                <td><c:out value="${books.price}"/>
                </td>
                <td><c:out value="${books.author}"/>
                </td>
                <td><c:out value="${books.press}"/>
                </td>
                <td>

                    <a href="/book/del?id=<c:out value="${books.id}"/>">删除</a>
                    <a data-toggle="modal" href="#myModal" data-id="${books.id}">更新</a>
                </td>
            </tr>
        </c:forEach>--%>
    </table>

    <div style="margin-top: 2em;">
        <input type="submit" value="删除" class="btn btn-success">
        <a href="/book/add">增加新的书籍</a>
        <br/>
        <br/>
        <!-- Button trigger modal -->
    </div>

</form>
<%@include file="book_update_modal.jsp" %>
<script>

    var list = function () {
        $.ajax({
            type: "post",
            url: "/book/bookInfo?action=list",
            success: function (data) {
                $("#tab tr:gt(0)").remove();
                $.each(data, function (index, da) {
                    var tr = "<tr>";
                    tr += "<td><input name='id' value=" + da.id + " type='checkbox'></td>";
                    tr += "<td>" + da.id + "";
                    tr += "</td>";
                    tr += "<td><a href='book/detail?id=" + da.id + "'>" + da.name + "";
                    tr += "</a></td>";
                    tr += " <td>" + da.price + "";
                    tr += "</td>";
                    tr += "<td>" + da.author + "";
                    tr += " </td>";
                    tr += "<td>" + da.press + "";
                    tr += "</td>";
                    tr += "<td>";
                    tr += " <a href='/book/del?id=" + da.id + "'>删除</a>";
                    tr += "<a  data-toggle='modal' href='#myModal' data-id=" + da.id + ">更新</a>";
                    tr += " </td>";
                    tr += "  </tr>";
                    $("#tab").append(tr);
                })
            }, error: function (xhr, textStatus, errorThrown) {
                alert("原生ajax：" + xhr + textStatus + "详细错误：" + errorThrown);
            }
        });
    };
    list();
    function alls(e) {
        var checkboxs = document.getElementsByName("id");
        for (var i = 0; i < checkboxs.length; i++) {
            checkboxs[i].checked = e.checked
        }
    }

    document.querySelector("#booklist").classList.add("active");
</script>
</body>
</html>
