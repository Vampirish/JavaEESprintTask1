package kz.bitlab.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kz.bitlab.db.DBManager;
import kz.bitlab.db.Task;

import java.io.IOException;

@WebServlet(value = "/change-task")
public class ChangeTaskServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getParameter("buttonDelete") != null) {
//            System.out.println("Hi");
            long id = Integer.parseInt(request.getParameter("id"));
            DBManager.deleteTask(id);

            response.sendRedirect("/");
        } else if (request.getParameter("buttonSave") != null) {
            long id = Integer.parseInt(request.getParameter("task-id"));
            String name = request.getParameter("task-name");
            String description = request.getParameter("task-description");
            String deadline = request.getParameter("task-deadline");
            String done = request.getParameter("task-done");

            Task task = DBManager.getTask(id);
            if (task!=null){
                task.setName(name);
                task.setDeadlineDate(deadline);
                task.setDone(done);
                task.setDescription(description);

                DBManager.updateTask(task);

                response.sendRedirect("/details?task_id=" + id);
            }else{
                response.sendRedirect("/");
            }
        }
    }
}
