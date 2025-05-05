package com.lington.dao;


import java.sql.*;
import java.util.*;

import com.lington.Model.categorymodel;
import com.lington.Model.productmodel;
import com.lington.config.Dbconfig;
public class CategoryDao {
    private Connection conn;

    public CategoryDao() throws Exception {
        conn = Dbconfig.getDbConnection();
    }

    public List<categorymodel> getAllCategories() {
        List<categorymodel> categories = new ArrayList<>();
        String sql = "SELECT * FROM category";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                categorymodel c = new categorymodel();
                c.setId(rs.getInt("CategoryID"));
                c.setName(rs.getString("CategoryName"));
                categories.add(c);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return categories;
    }
}

