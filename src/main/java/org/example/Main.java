package org.example;

import java.sql.*;
import java.time.Year;
import java.util.Scanner;


public class Main {
    static String url = "jdbc:mysql://localhost/razgon";
    static String username = "root";
    static String password = "root";
    static Connection connection;



    public static void main(String[] args) throws SQLException {
        try {
            connection = DriverManager.getConnection(url, username, password);
            System.out.println("Connection to Store DB succesfull!");
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        System.out.println("Хотите внести режиссера? yes/no");
        Scanner scanner = new Scanner(System.in);
        String otvet1 = scanner.nextLine();
        if (otvet1.equals("yes")){
            insertDirector(connection);showDirector(connection);
        } else if (otvet1.equals("no")) {
            System.out.println("Хотите внести фильм? yes/no");
            String otvet2 = scanner.nextLine();
            if (otvet2.equals("yes")){
                insertMovie(connection);showMovie(connection);
            } else if (otvet2.equals("no")) {
                System.out.println("Хотите посмотреть список фильмов? yes/no");
                String otvet3 = scanner.nextLine();
                if (otvet3.equals("yes")){
                    showMovie(connection);
                } else if (otvet3.equals("no")) {
                    System.out.println("Удалить к херам комедии? yes/no");
                    String otvet4 = scanner.nextLine();
                    if (otvet4.equals("yes")){
                        deleteMovieComedy(connection);
                        showMovie(connection);
                    } else if (otvet4.equals("no")) {
                        System.out.println("ну и иди нахуй, заебал");
                    }
                }
                }
        }
        }







    public static void insertDirector (Connection connection) throws SQLException {
        Scanner scanner = new Scanner(System.in);
        System.out.println("Фамилия режиссера");
        String LastName = scanner.nextLine();
        System.out.println("Имя режиссера");
        String Name = scanner.nextLine();
        System.out.println("Дата рождения в формате yyyy-MM-dd");
        String birthDaySt = scanner.nextLine();


        String sql = "INSERT INTO `director` ( `Last Name`, `Name`, `date_of_birth`) VALUES (?, ?, ?);";
        PreparedStatement ps = connection.prepareStatement(sql);
        ps.setString(1, LastName);
        ps.setString(2, Name);
        ps.setDate(3, java.sql.Date.valueOf(birthDaySt));
        ps.executeUpdate();

    }
    public static void insertMovie (Connection connection) throws SQLException {
    Scanner scanner = new Scanner(System.in);
    System.out.println("Название фильма");
    String movie_name = scanner.nextLine();
    System.out.println("Жанр");
    String genre = scanner.nextLine();
    System.out.println("Дата выхода в формате yyyy");
    String release_year = scanner.nextLine();
    System.out.println("Бюджет");
    String budget = scanner.nextLine();
    System.out.println("айди директора 1:5");
    String id_director = scanner.nextLine();


    String sql = "INSERT INTO `movies` ( `movies_name`, `genre`,`release_year`, `budget`, `id_director`) VALUES (?, ?, ?, ?, ?);";
    PreparedStatement ps = connection.prepareStatement(sql);
    ps.setString(1, movie_name);
    ps.setString(2, genre);
    ps.setInt(3, Integer.parseInt(release_year));
    ps.setInt(4, Integer.parseInt((budget)));
    ps.setString(5, id_director);


        ps.executeUpdate();

}
    public static void showDirector (Connection connection) throws SQLException {
        PreparedStatement ps = connection.prepareStatement("SELECT * FROM `director`;");
        ResultSet rs = ps.executeQuery();
        while (rs.next()){
            System.out.println();
            for (int i = 1; i < 5; i++) {
                System.out.print( rs.getString(i)+"\t"+"\t");
            }
        }
    }
    public static void showMovie (Connection connection) throws SQLException {
        PreparedStatement ps = connection.prepareStatement("SELECT * FROM `movies`;");
        ResultSet rs = ps.executeQuery();
        while (rs.next()){
            System.out.println();
            for (int i = 1; i < 8; i++) {
                System.out.print( rs.getString(i)+"\t"+"\t");
            }
        }
    }
    public static void deleteMovieComedy (Connection connection) throws SQLException {
        PreparedStatement ps = connection.prepareStatement("DELETE FROM `movies` WHERE genre = 'comedy';");
        ps.executeUpdate();
        }
    }

    //select();

//    }
//    public static void select() throws SQLException {
//        Statement statement = connection.createStatement();
//        ResultSet resultSet = statement.executeQuery("SELECT * FROM director");
//        while(resultSet.next()){
//
//            Date date = resultSet.getDate("date_of_birth");
//            String name_last = resultSet.getString("Last Name");
//            String name = resultSet.getString("Name");
//
//            System.out.printf(date +"\n", name +"\n" ,name_last);
////            System.out.printf("\n2. %s\n",name_last);
////            System.out.printf("\n3. %s\n", name);
//
//
//        }
//    }
    // connection.close();

