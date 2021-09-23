package entrance;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.sql.SQLException;
import java.sql.DriverManager;
import java.sql.Statement;
import java.sql.Connection;

public class Entrance_Request_Status_DAO
{
    private static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/portfolio?characterEncoding=UTF-8";
    private static final String USER = "root";
    private static final String PASSWD = "9697aa";
    private Connection con;
    private Statement stmt;
    
    public Entrance_Request_Status_DAO() {
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
    
    public void update(final String m_id, final int s_status) {
        this.connect();
        int result = 0;
        try {
            this.stmt = this.con.createStatement();
            result = this.stmt.executeUpdate("update entrance_status set s_status = '" + s_status + "' where m_id = " + m_id + ";");
        }
        catch (SQLException e) {
            e.printStackTrace();
        }
        this.disconnect();
    }

    public void insert(final String m_id, final int s_status) {
        this.connect();
        int result = 0;
        try {
            this.stmt = this.con.createStatement();
            result = this.stmt.executeUpdate("insert into entrance_status (m_id, s_status) values('" + m_id + "', '" + s_status + "');");
        }
        catch (SQLException e) {
            e.printStackTrace();
        }
        this.disconnect();
    }

    public void delete(final String m_id) {
        this.connect();
        int result = 0;
        try {
            this.stmt = this.con.createStatement();
            result = this.stmt.executeUpdate("delete from entrance_status where m_id = "+m_id+";");
        }
        catch (SQLException e) {
            e.printStackTrace();
        }
        this.disconnect();
    }
    
    public ArrayList<Entrance_Request_Status_DTO> select(final String m_id) {
        this.connect();
        final ArrayList<Entrance_Request_Status_DTO> ent_req_status = new ArrayList<Entrance_Request_Status_DTO>();
        try {
            this.stmt = this.con.createStatement();
            final ResultSet rs = this.stmt.executeQuery("select s_status from entrance_status where m_id = '"+m_id+"';");
            while (rs.next()) {
                final Entrance_Request_Status_DTO dtobj = new Entrance_Request_Status_DTO();
                dtobj.setM_id(m_id);
                dtobj.setS_status(rs.getInt("s_status"));
                ent_req_status.add(dtobj);
            }
            rs.close();
        }
        catch (SQLException e) {
            e.printStackTrace();
            return ent_req_status;
        }
        finally {
            this.disconnect();
        }
        this.disconnect();
        return ent_req_status;
    }
}