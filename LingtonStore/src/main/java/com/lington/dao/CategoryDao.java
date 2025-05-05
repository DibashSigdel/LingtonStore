package com.lington.dao;

import java.sql.*;
import java.util.*;
import com.lington.Model.categorymodel;
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
                categorymodel cat = new categorymodel();
                cat.setId(rs.getInt("CategoryID"));
                cat.setName(rs.getString("CategoryName"));
                categories.add(cat);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return categories;
    }
}
