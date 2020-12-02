package autoattendance;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.swing.table.DefaultTableModel;


public class DatabaseConnection {
    
    public Connection createConnection(){
    
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost/java_project","root","");
            return con;
           
            } 
        catch (Exception ex) {
           
        }
        return null;
    }
}
