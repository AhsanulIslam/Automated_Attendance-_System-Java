package autoattendance;


import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Locale;

public class ReportClass {
    private int cid = 0;
    
    private String sec;
    private String course;
    private ResultSet rs; 
   
    public void setSnameAndCid(String course,String sec){
       
        this.sec=sec; 
        this.course=course; 
        
        try{
        DatabaseConnection dbConnection = new DatabaseConnection();
        Connection con=dbConnection.createConnection();
    
        Statement st=con.createStatement();
       Statement st1=con.createStatement();
       
        ResultSet rs1=st.executeQuery("SELECT * FROM `course` where `course`.`Course_Name` = \'"+course+"\' and `course`.`Section` = \'"+sec+"\' ");
           
        
            if(rs1.next()){
                cid=rs1.getInt("id");
            
            }
            
         ResultSet rs=st.executeQuery("SELECT * FROM `report` where `report`.`course_id` = \'"+cid+"\'");
        
        
        }          
        catch(Exception e){System.out.println(e);}
       }



    public int getCID(){return cid;}   
   
    public ResultSet getSname(){return this.rs; }
    
}