package it.unisa;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Logger;

public class FilmixDatabase {
    private String url = "jdbc:mysql://localhost:3306/filmix";
    private String username = "root";
    private String password = "root";
    private Connection connection;
    private static FilmixDatabase instance;
    private static final Logger LOGGER = Logger.getLogger(FilmixDatabase.class.getName());

    
    public FilmixDatabase() {
    	try {
    		Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(url, username, password);
            LOGGER.info("Database connection established successfully.");
        } catch (Exception e) {
            LOGGER.severe("Error while establishing the database connection: " + e.getMessage());
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

    	try(Statement statement = connection.createStatement()){
        return statement.executeQuery(query);}
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
