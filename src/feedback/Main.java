/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package feedback;
import java.sql.*;

/**
 *
 * @author owner
 */
public class Main {

    /**
     * @param args the command line arguments
     */
    private static javax.swing.JOptionPane opp;
    public static void main(String[] args) {
        // TODO code application logic here
        try{
         Class.forName("java.sql.Driver");
         Connection  con = DriverManager.getConnection("jdbc:mysql://localhost/feedback","root","jirs");
            System.out.println("Connecting JDBC...(main)");
            System.out.println("Connection Sucessful!!");
         Home form = new Home();
        form.setVisible(true);
        }
        catch(Exception e)
        {
            opp.showMessageDialog(null,"Connectivity Error." );
        }
        
        
    }
    
}
