package backend.dao;

import backend.db.DBConnect;
import backend.model.Product;
import backend.model.enums.ProductStatus;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductDAO {
    public ProductDAO() {

    }
    public List<Product> getAllProducts() {
        List<Product> products = new ArrayList<>();
        String sql = "SELECT * FROM products";

        try (Connection conn = DBConnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Product product = new Product();
                product.setId(rs.getInt("id"));
                product.setName(rs.getString("name"));
                product.setDescription(rs.getString("description"));
                product.setShortDescription(rs.getString("short_description"));
                product.setPrice(rs.getDouble("price"));
                product.setSalePrice(rs.getDouble("sale_price"));
                product.setSku(rs.getString("sku"));
                product.setStockQuantity(rs.getInt("stock_quantity"));
                product.setCategoryId(rs.getInt("category_id"));
                product.setImageUrl(rs.getString("image_url"));
                product.setBestseller(rs.getBoolean("is_bestseller"));
                product.setStatus(ProductStatus.valueOf(rs.getString("status")));
                product.setIngredients(rs.getString("ingredients"));
                product.setUsageInstructions(rs.getString("usage_instructions"));
                product.setCreatedAt(rs.getTimestamp("created_at").toLocalDateTime());
                products.add(product);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return products;
    }

    public List<Product> getProducts(Integer categoryId, String sort, int index, int size) throws SQLException {
        List<Product> list = new ArrayList<>();
        StringBuilder sql = new StringBuilder("SELECT * FROM products WHERE status = 'active' ");
        if(categoryId != null){
            sql.append(" AND category_id = ? ");
        }

        if(sort != null){
            switch(sort){
                case "price-asc": sql.append(" ORDER BY price ASC "); break;
                case "price-desc": sql.append(" ORDER BY price DESC "); break;
                case "newest": sql.append(" ORDER BY created_at DESC "); break;
                case "name-asc": sql.append(" ORDER BY name ASC "); break;
                default: sql.append(" ORDER BY created_at DESC ");

            }
        }
        else{
            sql.append(" ORDER BY created_at DESC ");
        }
        sql.append(" LIMIT ? OFFSET ?");

        try(Connection conn = DBConnect.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql.toString())){

            int paramIndex = 1;
            if(categoryId != null){
                ps.setInt(paramIndex++, categoryId);
            }

            ps.setInt(paramIndex++, size);
            ps.setInt(paramIndex++, (index-1)*size);

            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                Product product = new Product();
                product.setId(rs.getInt("id"));
                product.setName(rs.getString("name"));
                product.setDescription(rs.getString("description"));
                product.setShortDescription(rs.getString("short_description"));
                product.setPrice(rs.getDouble("price"));
                product.setSalePrice(rs.getDouble("sale_price"));
                product.setSku(rs.getString("sku"));
                product.setStockQuantity(rs.getInt("stock_quantity"));
                product.setCategoryId(rs.getInt("category_id"));
                product.setImageUrl(rs.getString("image_url"));
                product.setBestseller(rs.getBoolean("is_bestseller"));
                product.setStatus(ProductStatus.valueOf(rs.getString("status")));
                product.setIngredients(rs.getString("ingredients"));
                product.setUsageInstructions(rs.getString("usage_instructions"));
                product.setCreatedAt(rs.getTimestamp("created_at").toLocalDateTime());
                list.add(product);
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return list;
    }

    public int countProducts(Integer categoryId) throws SQLException {
        String sql = "SELECT COUNT(*) FROM products WHERE status = 'active' ";
        if(categoryId != null){
            sql += " AND category_id = ? ";
        }
        try(Connection conn = DBConnect.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql)) {
            if (categoryId != null) {
                ps.setInt(1, categoryId);
            }
            ResultSet rs = ps.executeQuery();
            if (rs.next()) return rs.getInt(1);
        } catch (Exception e){
                e.printStackTrace();
            }
            return 0;
    }
    public static void main(String[] args) {
        ProductDAO dao = new ProductDAO();
        List<Product> list = dao.getAllProducts();

        for (Product p : list) {
            System.out.println(p.getName() + " - " + p.getPrice());
        }
    }
}
