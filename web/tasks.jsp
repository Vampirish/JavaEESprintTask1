<%@ page import="kz.bitlab.db.Task" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>Task Manager</title>
        <%@include file="head.jsp"%>
    </head>
    <body>
        <%@include file="navbar.jsp"%>
        <div class="container mt-3">
            <%@include file="addTask.jsp"%>
            <div class="row mt-3">
                <div class="col-12">
                    <table class="table">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Наименование</th>
                                <th>Крайний срок</th>
                                <th>Выполнено</th>
                                <th style="width: 10%">Детали</th>
                            </tr>
                        </thead>
                        <tbody>
                        <%
                            ArrayList<Task> tasks = (ArrayList<Task>) request.getAttribute("tasks");
                            if (tasks != null){
                                for (Task task : tasks ){
                        %>
                        <tr>
                            <td>
                                <%=task.getId()%>
                            </td>
                            <td>
                                <%=task.getName()%>
                            </td>
                            <td>
                                <%
                                    String deadline = task.getDeadlineDate();
                                    deadline = deadline.substring(8, 10) + "." + deadline.substring(5, 7) + "." + deadline.substring(0, 4);
                                %>
                                <%=deadline%>
                            </td>
                            <td>
                                <%=task.getDone()%>
                            </td>
                            <td>
                                <a class="btn bg-darkBlue cl-white btn-sm" href="/details?task_id=<%=task.getId()%>">Детали</a>
                            </td>
                        </tr>
                        <%
                                }
                            }
                        %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </body>
</html>
