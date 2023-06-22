<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="row mt-3">
  <div class="col-12">
    <!-- Button trigger modal -->
    <button type="button" class="btn bg-darkBlue cl-white btn-sm" data-bs-toggle="modal" data-bs-target="#addTask">
      + Добавить задание
    </button>

    <!-- Modal -->
    <div class="modal fade" id="addTask" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">Новое задание</h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <div class="modal-body">
            <form action="/add-task" method="post">
              <div class="row">
                <div class="col-12">
                  <label>Наименование : </label>
                </div>
              </div>
              <div class="row mt-2">
                <div class="col-12">
                  <input type="text" class="form-control" name="task-name" placeholder="Наименование...">
                </div>
              </div>
              <div class="row mt-3">
                <div class="col-12">
                  <label>Описание :</label>
                </div>
              </div>
              <div class="row mt-2">
                <div class="col-12">
                  <textarea rows="6" class="form-control" name="task-description" placeholder="Описание..."></textarea>
                </div>
              </div>
              <div class="row mt-3">
                <div class="col-12">
                  <label>Крайний срок :</label>
                </div>
              </div>
              <div class="row mt-2">
                <div class="col-12">
                  <input type="date" class="form-control" name="task-deadline">
                </div>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Закрыть</button>
                <button type="submit" class="btn btn-primary">Добавить</button>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
