package backend.model;

import backend.model.enums.ProductStatus;

import java.math.BigDecimal;
import java.time.LocalDateTime;

public class Product {
    private Integer id;
    private String name;
    private String slug;
    private String description;
    private String shortDescription;
    private BigDecimal price;
    private BigDecimal salePrice;
    private String sku;
    private Integer stockQuantity;
    private Integer categoryId;
    private String imageUrl;
    private Boolean isBestseller;
    private ProductStatus status;
    private String ingredients;
    private String usageInstructions;
    private LocalDateTime createdAt;

    public Product() {}

    public Product(Integer id, String name, String slug, String description, String shortDescription,
                   BigDecimal price, BigDecimal salePrice, String sku, Integer stockQuantity,
                   Integer categoryId, String imageUrl, Boolean isBestseller, ProductStatus status,
                   String ingredients, String usageInstructions, LocalDateTime createdAt) {
        this.id = id;
        this.name = name;
        this.slug = slug;
        this.description = description;
        this.shortDescription = shortDescription;
        this.price = price;
        this.salePrice = salePrice;
        this.sku = sku;
        this.stockQuantity = stockQuantity;
        this.categoryId = categoryId;
        this.imageUrl = imageUrl;
        this.isBestseller = isBestseller;
        this.status = status;
        this.ingredients = ingredients;
        this.usageInstructions = usageInstructions;
        this.createdAt = createdAt;
    }

    public Integer getId() { return id; }
    public void setId(Integer id) { this.id = id; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getSlug() { return slug; }
    public void setSlug(String slug) { this.slug = slug; }

    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }

    public String getShortDescription() { return shortDescription; }
    public void setShortDescription(String shortDescription) { this.shortDescription = shortDescription; }

    public BigDecimal getPrice() { return price; }
    public void setPrice(BigDecimal price) { this.price = price; }

    public BigDecimal getSalePrice() { return salePrice; }
    public void setSalePrice(BigDecimal salePrice) { this.salePrice = salePrice; }

    public String getSku() { return sku; }
    public void setSku(String sku) { this.sku = sku; }

    public Integer getStockQuantity() { return stockQuantity; }
    public void setStockQuantity(Integer stockQuantity) { this.stockQuantity = stockQuantity; }

    public Integer getCategoryId() { return categoryId; }
    public void setCategoryId(Integer categoryId) { this.categoryId = categoryId; }

    public String getImageUrl() { return imageUrl; }
    public void setImageUrl(String imageUrl) { this.imageUrl = imageUrl; }

    public Boolean getIsBestseller() { return isBestseller; }
    public void setIsBestseller(Boolean bestseller) { isBestseller = bestseller; }

    public ProductStatus getStatus() { return status; }
    public void setStatus(ProductStatus status) { this.status = status; }

    public String getIngredients() { return ingredients; }
    public void setIngredients(String ingredients) { this.ingredients = ingredients; }

    public String getUsageInstructions() { return usageInstructions; }
    public void setUsageInstructions(String usageInstructions) { this.usageInstructions = usageInstructions; }

    public LocalDateTime getCreatedAt() { return createdAt; }
    public void setCreatedAt(LocalDateTime createdAt) { this.createdAt = createdAt; }
}
