package com.lington.dao;

import java.sql.*;
import java.util.*;
import com.lington.Model.productmodel;
import com.lington.config.Dbconfig;

public class ProductDao {
    private Connection conn;

    public ProductDao() throws Exception {
        conn = Dbconfig.getDbConnection();
    }

    public List<productmodel> getProductsByCategory(int categoryId) {
        List<productmodel> products = new ArrayList<>();
        String sql = "SELECT * FROM product WHERE CategoryID = ?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, categoryId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                productmodel p = new productmodel();
                p.setId(rs.getInt("ProductID"));
                p.setName(rs.getString("ProductName"));
                p.setDescription(rs.getString("Description"));
                p.setPrice(rs.getDouble("Price"));
                p.setImageUrl(rs.getString("ImageURL")); // optional column
                p.setCategoryId(rs.getInt("CategoryID"));
                products.add(p);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return products;
    }
}
