package db;

import model.Category;
import java.sql.Connection;
import java.sql.CallableStatement;
import java.sql.SQLException;
import java.util.List;
import java.util.ArrayList;
import java.sql.ResultSet;

public class Category_StorkTeam {
    public List<Category> selectAllFromCategory() {
        List<Category> listOfCategories = new ArrayList<Category>();
        Connection conn = null;
        try {
            conn = ConnectionUtil.getConnection();
            CallableStatement caslor = conn.prepareCall("{call sp_category_select}");
            ResultSet rs = caslor.executeQuery();
            while(rs.next()) {
                int cate_Id = rs.getInt("Cate_Id");
                String categoryName = rs.getString("CategoryName");
                Category category = new Category(cate_Id, categoryName);
                listOfCategories.add(category);
            }
            return listOfCategories;
        } catch(SQLException se) {
            se.printStackTrace();
        } finally {
            try {
                if(conn != null) {
                    conn.close();
                }
            } catch(SQLException se) {
                se.printStackTrace();
            }
        }
        return null;
    }
}
