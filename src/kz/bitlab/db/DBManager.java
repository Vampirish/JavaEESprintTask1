package kz.bitlab.db;

import java.util.ArrayList;

public class DBManager {
    private static final ArrayList<Task> tasks = new ArrayList<>();
    private static long id = 6;
    static {
        tasks.add(
                new Task(1,
                        "Создать веб приложение на Java EE",
                        "Нужно будет создать собственное приложение на Java EE для себя. Для начала я установлю себе" +
                                "на комп Composer. Затем тупо загружу Java EE и запущу.",
                        "2021-10-23"
                )
        );
        tasks.add(
                new Task(2,
                        "Убраться дома и закупиться продукатми",
                        "Нужно будет убраться дома и закупиться продукатми. Уберу первый и второй этаж, потом схожу" +
                                "в магнум и куплю то что надо, по списку что дала мама.",
                        "2021-10-25"
                )
        );
        tasks.add(
                new Task(3,
                        "Выполнить все домашние задания",
                        "У меня их нету, но ладно, пусть задача стоит ))0)",
                        "2021-10-28"
                )
        );
        tasks.add(
                new Task(4,
                        "Записаться на качку",
                        "Найти хорошее место и записаться.",
                        "2021-12-12"
                )
        );
        tasks.add(
                new Task(5,
                        "Учить немецкий",
                        "Здесь могла бы быть ваша реклама.",
                        "2022-05-01"
                )
        );
    }
    public static Task getTask(long id) {
        return tasks
                .stream()
                .filter(task -> task.getId()==id)
                .findFirst()
                .orElse(null);
    }
    public static ArrayList<Task> getAllTasks(){
        return tasks;
    }
    public static void addTask(Task task){
        task.setId(id);
        tasks.add(task);
        id++;
    }
    public static void deleteTask(long id){
        tasks.remove((int)id-1);
        for (int i = 0; i < tasks.size(); i++) {
            tasks.get(i).setId(i+1);
        }
    }

    public static void updateTask(Task task){
        for (int i = 0; i < tasks.size(); i++){
            if (tasks.get(i).getId() == task.getId()) {
                tasks.set(i, task);
                break;
            }
        }
    }
}
