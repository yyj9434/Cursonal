package cusonal;

import java.sql.*;
import java.util.Vector;


public class OrderMgr {

    private DBConnectionMgr pool = null;


    public OrderMgr() {
        try {
            pool = DBConnectionMgr.getInstance();
        } catch (Exception e) {
            System.out.println("Error!!");
        }
    }

    
    public Vector getBestList() throws SQLException {
        Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;
        Vector vResult = new Vector();

        try {
            con = pool.getConnection();
            String query = "select product_num,sum(quantity) from cn_order group by product_num order by sum(quantity) desc;";
            stmt = con.createStatement();
            rs = stmt.executeQuery(query);

            while (rs.next()) {
                OrderBean order = new OrderBean();
                order.setNum(rs.getInt("sum(quantity)"));
                order.setProduct_num(rs.getInt("product_num"));
                vResult.add(order);
            }
        } catch (Exception ex) {
            System.out.println("Exception :" + ex);
        } finally {
            pool.freeConnection(con, stmt, rs);
        }
        return vResult;
    }
    

    public void insertOrder(OrderBean order) {
        Connection con = null;
        PreparedStatement pstmt = null;
        Vector vResult = this.getOrderList();
        try {
            con = pool.getConnection();
            String query = "insert into cn_order(num, product_num, quantity, date, state, id)"
                    + " values(?, ?, ? ,now() ,?, ?)";
            pstmt = con.prepareStatement(query);
            pstmt.setInt(1, vResult.size() + 1);
            pstmt.setInt(2, order.getProduct_num());
            pstmt.setInt(3, order.getQuantity());
            pstmt.setString(4, "1");
            pstmt.setString(5, order.getId());
            pstmt.executeUpdate();
        } catch (Exception ex) {
            System.out.println("Exception :" + ex);
        } finally {
            pool.freeConnection(con, pstmt);
        }
    }


    public Vector getOrder(String id) {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        Vector vResult = new Vector();

        try {
            con = pool.getConnection();
            String query = "select * from cn_order where id = ? order by num desc";
            pstmt = con.prepareStatement(query);
            pstmt.setString(1, id);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                OrderBean order = new OrderBean();
                order.setId(rs.getString("id"));
                order.setQuantity(rs.getInt("quantity"));
                order.setDate(rs.getString("date"));
                order.setNum(rs.getInt("num"));
                order.setState(rs.getString("state"));
                order.setProduct_num(rs.getInt("product_num"));
                vResult.add(order);
            }
        } catch (Exception ex) {
            System.out.println("Exception :" + ex);
        } finally {
            pool.freeConnection(con, pstmt, rs);
        }
        return vResult;
    }


    public Vector getOrderList() {
        Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;
        Vector vResult = new Vector();

        try {
            con = pool.getConnection();
            String query = "select * from cn_order order by num desc";
            stmt = con.createStatement();
            rs = stmt.executeQuery(query);
            while (rs.next()) {
                OrderBean order = new OrderBean();
                order.setId(rs.getString("id"));
                order.setQuantity(rs.getInt("quantity"));
                order.setDate(rs.getString("date"));
                order.setNum(rs.getInt("num"));
                order.setState(rs.getString("state"));
                order.setProduct_num(rs.getInt("product_num"));
                vResult.add(order);
            }
        } catch (Exception ex) {
            System.out.println("Exception :" + ex);
        } finally {
            pool.freeConnection(con, stmt, rs);
        }
        return vResult;
    }


    public OrderBean getOrderDetail(int num) {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        OrderBean order = null;

        try {
            con = pool.getConnection();
            String query = "select * from cn_order where num = ?";
            pstmt = con.prepareStatement(query);
            pstmt.setInt(1, num);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                order = new OrderBean();
                order.setId(rs.getString("id"));
                order.setQuantity(rs.getInt("quantity"));
                order.setDate(rs.getString("date"));
                order.setNum(rs.getInt("num"));
                order.setState(rs.getString("state"));
                order.setProduct_num(rs.getInt("product_num"));
            }
        } catch (Exception e) {
            System.out.println("Exception :" + e);
        } finally {
            pool.freeConnection(con, pstmt, rs);
        }
        return order;
    }


    public boolean updateOrder(int num, String state) {
        Connection con = null;
        PreparedStatement pstmt = null;
        boolean result = false;
        try {
            con = pool.getConnection();
            String query = "update cn_order set state = ? where num = ?";
            pstmt = con.prepareStatement(query);
            pstmt.setString(1, state);
            pstmt.setInt(2, num);
            int count = pstmt.executeUpdate();
            if (count == 1) result = true;
        } catch (Exception ex) {
            System.out.println("Exception :" + ex);
        } finally {
            pool.freeConnection(con, pstmt);
        }
        return result;
    }


    public boolean deleteOrder(int num) throws SQLException {
        Connection con = null;
        PreparedStatement pstmt = null;
        boolean result = false;

        try {
            con = pool.getConnection();
            String query = "delete from cn_order where num = ?";
            pstmt = con.prepareStatement(query);
            pstmt.setInt(1, num);
            int count = pstmt.executeUpdate();
            if (count == 1) result = true;
        } catch (Exception e) {
            System.out.println("Exception :" + e);
        } finally {
            pool.freeConnection(con, pstmt);
        }
        return result;
    }


}

