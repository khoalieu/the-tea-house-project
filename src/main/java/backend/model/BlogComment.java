package backend.model;

import java.time.LocalDateTime;

public class BlogComment {
    private Integer id;
    private Integer postId;
    private Integer userId;
    private String commentText;
    private LocalDateTime createdAt;

    public BlogComment() {}

    public BlogComment(Integer id, Integer postId, Integer userId, String commentText, LocalDateTime createdAt) {
        this.id = id;
        this.postId = postId;
        this.userId = userId;
        this.commentText = commentText;
        this.createdAt = createdAt;
    }

    public Integer getId() { return id; }
    public void setId(Integer id) { this.id = id; }

    public Integer getPostId() { return postId; }
    public void setPostId(Integer postId) { this.postId = postId; }

    public Integer getUserId() { return userId; }
    public void setUserId(Integer userId) { this.userId = userId; }

    public String getCommentText() { return commentText; }
    public void setCommentText(String commentText) { this.commentText = commentText; }

    public LocalDateTime getCreatedAt() { return createdAt; }
    public void setCreatedAt(LocalDateTime createdAt) { this.createdAt = createdAt; }
}
