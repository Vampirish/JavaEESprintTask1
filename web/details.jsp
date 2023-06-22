<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="kz.bitlab.db.Task" %>
<%@ page import="java.util.ArrayList" %>
<html>
<head>
    <title>Task Details</title>
    <%@include file="head.jsp" %>
</head>
<body>
<%@include file="navbar.jsp" %>
<div class="container mt-5">
    <%
        Task task = (Task) request.getAttribute("task");
        if (task != null) {
    %>
    <div class="row">
        <div class="col-6 mx-auto">
            <form action="/change-task" method="post">
                <input type="hidden" name="task-id" value="<%=task.getId()%>">
                <div class="row">
                    <div class="col-12">
                        <label>Наименование : </label>
                    </div>
                </div>
                <div class="row mt-2">
                    <div class="col-12">
                        <input type="text" class="form-control" value="<%=task.getName()%>" name="task-name">
                    </div>
                </div>
                <div class="row mt-3">
                    <div class="col-12">
                        <label>Описание :</label>
                    </div>
                </div>
                <div class="row mt-2">
                    <div class="col-12">
                        <textarea rows="6" class="form-control"
                                  name="task-description"><%=task.getDescription()%></textarea>
                    </div>
                </div>
                <div class="row mt-3">
                    <div class="col-12">
                        <label>Крайний срок :</label>
                    </div>
                </div>
                <div class="row mt-2">
                    <div class="col-12">
                        <input type="date" class="form-control" value="<%=task.getDeadlineDate()%>"
                               name="task-deadline">
                    </div>
                </div>
                <div class="row mt-3">
                    <div class="col-12">
                        <label>Выполнено :</label>
                    </div>
                </div>
                <div class="row mt-2">
                    <div class="col-12">
                        <select type="done" class="form-control" property="<%=task.getDone()%>" name="task-done">
                            <option <%if (task.getDone().equals("Да")){%>selected<%}%>>Да</option>
                            <option <%if (task.getDone().equals("Нет")){%>selected<%}%>>Нет</option>
                        </select>
                    </div>
                </div>
                <div class="row mt-3">
                    <div class="col-12">
                        <button class="btn btn-success" type="submit" name="buttonSave">Сохранить</button>
                        <!-- Button trigger modal -->
                        <button type="button" class="btn btn-danger ms-2" data-bs-toggle="modal"
                                data-bs-target="#deleteTask">
                            Удалить
                        </button>

                        <!-- Modal -->
                        <div class="modal fade" id="deleteTask" tabindex="-1" aria-labelledby="exampleModal"
                             aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                        <input type="hidden" name="id" value="<%=task.getId()%>">
                                        <div class="modal-header">
                                            <!--<h5 class="modal-title">Подтверждение</h5>-->
                                            <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                    aria-label="Close"></button>
                                        </div>
                                        <div class="modal-body">
                                            <h5 class="text-center">Вы точно хотите удалить задачу?</h5>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">
                                                Нет
                                            </button>
                                            <button class="btn btn-danger" name="buttonDelete">Да</button>
                                        </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
        <%
        } else {
        %>
        <h3 class="text-center">
            TASK NOT FOUND
        </h3>
        <%
            }
        %>
    </div>
</div>
</body>
</html>
