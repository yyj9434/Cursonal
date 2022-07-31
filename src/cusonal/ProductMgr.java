package cusonal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;


public class ProductMgr {

    private DBConnectionMgr pool = null;

    public ProductMgr() {
        try {
            pool = DBConnectionMgr.getInstance();
        } catch (Exception e) {
            System.out.println("Error !!");
        }
    }
    
    

    public boolean insertProduct(HttpServletRequest req) {
        Connection con = null;
        PreparedStatement pstmt = null;
        boolean result = false;
        try {
     
           String uploadDir =this.getClass().getResource("").getPath();
        	uploadDir =	   uploadDir.substring(1,uploadDir.indexOf(".metadata"))+"Cusonal/WebContent/data";
            MultipartRequest multi = new MultipartRequest(req, uploadDir, 5 * 1024 * 1024, "UTF-8", new DefaultFileRenamePolicy());

            Vector vResult = this.getProductList();
            con = pool.getConnection();
            String query = "insert into cn_product(num, name, price, detail, date, stock, image)"
                    + "values(?, ?, ?, ?, now(), ?, ?)";
            pstmt = con.prepareStatement(query);
            pstmt.setInt(1, vResult.size() + 1);
            pstmt.setString(2, multi.getParameter("name"));
            pstmt.setString(3, multi.getParameter("price"));
            pstmt.setString(4, multi.getParameter("detail"));
            pstmt.setString(5, multi.getParameter("stock"));

            if (multi.getFilesystemName("image") == null) {
                pstmt.setString(6, "ready.gif");
            } else {
                pstmt.setString(6, multi.getFilesystemName("image"));
            }
            int count = pstmt.executeUpdate();
            if (count == 1) result = true;

        } catch (Exception ex) {
            System.out.println("Exception :" + ex);
        } finally {
            pool.freeConnection(con, pstmt);
        }
        return result;
    }

    public ProductBean getProduct(int num) {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        ProductBean product = null;

        try {
            con = pool.getConnection();
            String query = "select * from cn_product where num=?";
            pstmt = con.prepareStatement(query);
            pstmt.setInt(1, num);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                product = new ProductBean();
                product.setNum(rs.getInt("num"));
                product.setName(rs.getString("name"));
                product.setPrice(rs.getString("price"));
                product.setDetail(rs.getString("detail"));
                product.setDate(rs.getString("date"));
                product.setStock(rs.getString("stock"));
                product.setImage(rs.getString("image"));
            }
        } catch (Exception ex) {
            System.out.println("Exception :" + ex);
        } finally {
            pool.freeConnection(con, pstmt, rs);
        }
        return product;

    }

    public boolean updateProduct(HttpServletRequest req) {
        Connection con = null;
        PreparedStatement pstmt = null;
        boolean result = false;
        
        String uploadDir =this.getClass().getResource("").getPath();
     	uploadDir =	   uploadDir.substring(1,uploadDir.indexOf(".metadata"))+"Cusonal/WebContent/data";

        try {
            con = pool.getConnection();
            MultipartRequest multi = new MultipartRequest(req, uploadDir, 5 * 1024 * 1024, "UTF-8", new DefaultFileRenamePolicy());

            if (multi.getFilesystemName("image") == null) {
                String query = "update cn_product set name = ?, price = ?, detail = ?, stock = ?  where num = ?";
                pstmt = con.prepareStatement(query);
                pstmt.setString(1, multi.getParameter("name"));
                pstmt.setString(2, multi.getParameter("price"));
                pstmt.setString(3, multi.getParameter("detail"));
                pstmt.setString(4, multi.getParameter("stock"));
                pstmt.setString(5, multi.getParameter("num"));
            } else {
                String query = "update cn_product set name =? ,price = ?, detail = ?,stock = ?, image = ?  where num = ?";
                pstmt = con.prepareStatement(query);
                pstmt.setString(1, multi.getParameter("name"));
                pstmt.setString(2, multi.getParameter("price"));
                pstmt.setString(3, multi.getParameter("detail"));
                pstmt.setString(4, multi.getParameter("stock"));
                pstmt.setString(5, multi.getFilesystemName("image"));
                pstmt.setString(6, multi.getParameter("num"));
            }
            int count = pstmt.executeUpdate();
            if (count == 1) result = true;
        } catch (Exception ex) {
            System.out.println("Exception :" + ex);
        } finally {
            pool.freeConnection(con, pstmt);
        }
        return result;
    }

    public void reduceProduct(OrderBean order) {
        Connection con = null;
        PreparedStatement pstmt = null;

        try {
            con = pool.getConnection();
            String query = "update cn_product set stock = (stock - ? ) where num = ? ";
            pstmt = con.prepareStatement(query);
            pstmt.setInt(1, order.getQuantity());
            pstmt.setInt(2, order.getProduct_num());
            pstmt.executeUpdate();
        } catch (Exception ex) {
            System.out.println("Exception :" + ex);
        } finally {
            pool.freeConnection(con, pstmt);
        }
    }


    public Vector getProductList() throws SQLException {
        Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;
        Vector vProduct = new Vector();

        try {
            con = pool.getConnection();
            String query = "select * from cn_product order by num desc";
            stmt = con.createStatement();
            rs = stmt.executeQuery(query);

            while (rs.next()) {
                ProductBean product = new ProductBean();
                product.setNum(rs.getInt("num"));
                product.setName(rs.getString("name"));
                product.setPrice(rs.getString("price"));
                product.setDetail(rs.getString("detail"));
                product.setDate(rs.getString("date"));
                product.setStock(rs.getString("stock"));
                product.setImage(rs.getString("image"));
                vProduct.add(product);
            }
        } catch (Exception ex) {
            System.out.println("Exception :" + ex);
        } finally {
            pool.freeConnection(con, stmt, rs);
        }
        return vProduct;
    }


    public boolean deleteProduct(String num) {
        Connection con = null;
        PreparedStatement pstmt = null;
        boolean result = false;

        try {
            con = pool.getConnection();
            String query = "delete from cn_product where num = ?";
            pstmt = con.prepareStatement(query);
            pstmt.setString(1, num);
            int count = pstmt.executeUpdate();
            if (count == 1) result = true;
        } catch (Exception ex) {
            System.out.println("Exception :" + ex);
        } finally {
            pool.freeConnection(con, pstmt);
        }
        return result;
    }


}
