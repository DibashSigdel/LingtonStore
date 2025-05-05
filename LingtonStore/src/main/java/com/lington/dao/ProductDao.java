package com.lington.dao;

import java.sql.*;
import java.util.*;
import com.lington.Model.productmodel;
import com.lington.config.Dbconfig;

public class ProductDao {
    private Connection conn;

    public ProductDao() throws Exception {
        conn = Dbconfig.getDbConnection();
        if (conn == null) {
            throw new SQLException("❌ DB Connection is null");
        } else {
            System.out.println("✅ DB Connection established");

            // Ensures changes persist if not already enabled
            if (conn.getAutoCommit() == false) {
                conn.setAutoCommit(true);
            }
        }
    }

    public void insertProduct(productmodel p) {
        String sql = "INSERT INTO product (ProductName, Description, Price, StockQuantity, CategoryID, ImageURL) VALUES (?, ?, ?, ?, ?, ?)";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            System.out.println("➡️ Preparing to insert product...");
            System.out.println("Name: " + p.getName());
            System.out.println("Description: " + p.getDescription());
            System.out.println("Price: " + p.getPrice());
            System.out.println("Stock: " + p.getStockQuantity());
            System.out.println("Category ID: " + p.getCategoryId());
            System.out.println("Image URL: " + p.getImageUrl());

            ps.setString(1, p.getName());
            ps.setString(2, p.getDescription());
            ps.setDouble(3, p.getPrice());
            ps.setInt(4, p.getStockQuantity());
            ps.setInt(5, p.getCategoryId());
            ps.setString(6, p.getImageUrl());

            int rows = ps.executeUpdate();
            System.out.println("✅ INSERT EXECUTED: Rows inserted: " + rows);

        } catch (SQLIntegrityConstraintViolationException fkError) {
            System.err.println("🚫 Foreign key constraint violated (CategoryID may not exist):");
            fkError.printStackTrace();
        } catch (SQLException e) {
            System.err.println("❌ General SQL Error:");
            e.printStackTrace();
        } catch (Exception ex) {
            System.err.println("❌ Unexpected Error:");
            ex.printStackTrace();
        }
    }

    public void updateProduct(productmodel p) throws SQLException {
        String sql = "UPDATE product SET ProductName = ?, Description = ?, Price = ?, StockQuantity = ?, CategoryID = ?, ImageURL = ? WHERE ProductID = ?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, p.getName());
            ps.setString(2, p.getDescription());
            ps.setDouble(3, p.getPrice());
            ps.setInt(4, p.getStockQuantity());
            ps.setInt(5, p.getCategoryId());
            ps.setString(6, p.getImageUrl());
            ps.setInt(7, p.getId());

            int updated = ps.executeUpdate();
            System.out.println("✅ Rows updated: " + updated);
            if (updated == 0) {
                throw new SQLException("No product found with ID: " + p.getId());
            }
        }
    }


    public void deleteProduct(int id) throws SQLException {
        String sql = "DELETE FROM product WHERE ProductID=?";  // 🛠️ Fix column name
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            int rows = ps.executeUpdate();
            System.out.println("🗑️ Deleted rows: " + rows);
            if (rows == 0) {
                throw new SQLException("No product found with ID: " + id);
            }
        }
    }


    public List<productmodel> getProductsByCategory(int categoryId) {
        List<productmodel> products = new ArrayList<>();
        String sql = "SELECT * FROM product WHERE CategoryID = ?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, categoryId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                products.add(mapResultSetToProduct(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return products;
    }

    public List<productmodel> getAllProducts() {
        List<productmodel> products = new ArrayList<>();
        String sql = "SELECT * FROM product";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                products.add(mapResultSetToProduct(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return products;
    }

    private productmodel mapResultSetToProduct(ResultSet rs) throws SQLException {
        productmodel p = new productmodel();
        p.setId(rs.getInt("ProductID"));
        p.setName(rs.getString("ProductName"));
        p.setDescription(rs.getString("Description"));
        p.setPrice(rs.getDouble("Price"));
        p.setStockQuantity(rs.getInt("StockQuantity"));
        p.setCategoryId(rs.getInt("CategoryID"));
        p.setImageUrl(rs.getString("ImageURL"));
        return p;
    }
    // manish ko changes
    public productmodel getProductById(int id) {
        String sql = "SELECT * FROM product WHERE ProductID = ?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return mapResultSetToProduct(rs);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

}
