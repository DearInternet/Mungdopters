package entrance;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.sql.SQLException;
import java.sql.DriverManager;
import java.sql.Statement;
import java.sql.Connection;

public class Entrance_Admin_Details_DAO
{
    private static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/portfolio?characterEncoding=UTF-8";
    private static final String USER = "root";
    private static final String PASSWD = "9697aa";
    private Connection con;
    private Statement stmt;
    
    public Entrance_Admin_Details_DAO() {
        this.con = null;
        this.stmt = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
        }
        catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public void connect() {
        try {
            this.con = DriverManager.getConnection("jdbc:mysql://localhost:3306/portfolio?characterEncoding=UTF-8", "root", "9697aa");
        }
        catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public void disconnect() {
        if (this.stmt != null) {
            try {
                this.stmt.close();
            }
            catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (this.con != null) {
            try {
                this.con.close();
            }
            catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
    
    public void StatusCountUpdate(final String m_id,final int count) {
        this.connect();
        int result = 0;
        try {
            this.stmt = this.con.createStatement();
            result = this.stmt.executeUpdate("update entrance_status set s_status = " + count + " where m_id = '" + m_id + "';");
        }
        catch (SQLException e) {
            e.printStackTrace();
        }
        this.disconnect();
    }
    

    
   
    public ArrayList<Entrance_Admin_Details_DTO> select(final String m_id) {
        this.connect();
        final ArrayList<Entrance_Admin_Details_DTO> ent_admin_details = new ArrayList<Entrance_Admin_Details_DTO>();
        try {
            this.stmt = this.con.createStatement();
            
            final ResultSet rs = this.stmt.executeQuery("select m_name, m_address, m_phone, r_addition from member, entrance_ready where member.m_id = entrance_ready.m_id and member.m_id = '"+m_id+"';");
            while (rs.next()) {
                final Entrance_Admin_Details_DTO dtobj = new Entrance_Admin_Details_DTO();
                dtobj.setM_id(m_id);
                dtobj.setM_name(rs.getString("m_name"));
                dtobj.setM_address(rs.getString("m_address"));
                dtobj.setM_phone(rs.getString("m_phone"));
                dtobj.setR_addition(rs.getString("r_addition"));
                ent_admin_details.add(dtobj);
            }
            rs.close();
        }
        catch (SQLException e) {
            e.printStackTrace();
            return ent_admin_details;
        }
        finally {
            this.disconnect();
        }
        this.disconnect();
        return ent_admin_details;
    }
    
}