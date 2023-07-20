package it.unisa;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class FilmixDatabase {
    private String url = "jdbc:mysql://localhost:3306/filmix";
    private String username = "root";
    private String password = "root";
    private Connection connection;
    private static FilmixDatabase instance;

    public FilmixDatabase() {
        try {
            connection = DriverManager.getConnection(url, username, password);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static FilmixDatabase getInstance() {
        if (instance == null) {
            instance = new FilmixDatabase();
        }
        return instance;
    }

    public ResultSet executeQuery(String query) throws SQLException {
        Statement statement = connection.createStatement();
        return statement.executeQuery(query);
    }

    public Connection getConnection() {
        return connection;
    }

    public void closeConnection() {
        try {
            if (connection != null) {
                connection.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}