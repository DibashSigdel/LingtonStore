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

                // Set image based on name
                String name = cat.getName().toLowerCase();
                String imageUrl;

                switch (name) {
                    case "instantfood and drinks":
                        imageUrl = "https://cdn-icons-png.flaticon.com/512/1046/1046784.png";
                        break;
                    case "fruits and vegetables":
                        imageUrl = "https://cdn-icons-png.flaticon.com/512/1046/1046786.png";
                        break;
                    case "milk & dairy":
                        imageUrl = "https://cdn-icons-png.flaticon.com/512/3075/3075977.png";
                        break;
                    case "kitchen utensils and accessories":
                        imageUrl = "https://cdn-icons-png.flaticon.com/512/3600/3600923.png";
                        break;
                    case "extras":
                        imageUrl = "https://cdn-icons-png.flaticon.com/512/3600/3600923.png";
                        break;
                    default:
                        imageUrl = "https://cdn-icons-png.flaticon.com/512/3600/3600923.png"; // fallback
                }

                cat.setImageUrl(imageUrl);  // this requires adding imageUrl to model
                categories.add(cat);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return categories;
    }

}
