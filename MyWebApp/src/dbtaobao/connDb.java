package dbtaobao;
import java.sql.*;
import java.util.ArrayList;
 
public class connDb {
    private static Connection con = null;
    private static Statement stmt = null;
    private static ResultSet rs = null;
 
    //连接数据库方法
    public static void startConn(){
        try{
            Class.forName("com.mysql.jdbc.Driver");
            //连接数据库中间件
            try{
                con = DriverManager.getConnection("jdbc:MySQL://localhost:3306/dbtaobao","root","1234asdf");
            }catch(SQLException e){
                e.printStackTrace();
            }
        }catch(ClassNotFoundException e){
            e.printStackTrace();
        }
    }
 
    //关闭连接数据库方法
    public static void endConn() throws SQLException{
        if(con != null){
            con.close();
            con = null;
        }
        if(rs != null){
            rs.close();
            rs = null;
        }
        if(stmt != null){
            stmt.close();
            stmt = null;
        }
    }
    //用户流量及购物情况
    public static ArrayList index() throws SQLException{
        ArrayList<String[]> list = new ArrayList();
        startConn();
        stmt = con.createStatement();
        rs = stmt.executeQuery("select *from daily_visits");
        while(rs.next()){
            String[] temp={rs.getString("day"),rs.getString("pv"),rs.getString("uv")};
            list.add(temp);
        }
            endConn();
        return list;
    }
    //用户行为转换率
        public static ArrayList index_1() throws SQLException{
            ArrayList<String[]> list = new ArrayList();
            startConn();
            stmt = con.createStatement();
            rs = stmt.executeQuery("select *from b_transform");
            while(rs.next()){
                String[] temp={rs.getString("pv"),rs.getString("fav_a_cart"),rs.getString("buy")};
                list.add(temp);
            }
            endConn();
            return list;
        }
        //一周活跃分布
        public static ArrayList index_2() throws SQLException{
            ArrayList<String[]> list = new ArrayList();
            startConn();
            stmt = con.createStatement();
            rs = stmt.executeQuery("select *from weekly_activity order by weekday");
            while(rs.next()){
                String[] temp={rs.getString("weekday"),rs.getString("pv"),rs.getString("fav"),rs.getString("cart"),rs.getString("buy")};
                list.add(temp);
            }
            endConn();
            return list;
        }
        //一天活跃分布
        public static ArrayList index_3() throws SQLException{
            ArrayList<String[]> list = new ArrayList();
            startConn();
            stmt = con.createStatement();
            rs = stmt.executeQuery("select *from hourly_activity order by hour");
            while(rs.next()){
            	String[] temp={rs.getString("hour"),rs.getString("pv"),rs.getString("fav"),rs.getString("cart"),rs.getString("buy")};
                list.add(temp);
            }
            endConn();
            return list;
        }
}
