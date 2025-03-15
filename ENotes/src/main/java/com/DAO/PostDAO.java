package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import com.User.post; // Ensure proper PascalCase for class name

public class PostDAO {
    private Connection conn;

    public PostDAO(Connection conn) {
        this.conn = conn;
    }

    // Add a new note to the database
    public boolean addNotes(String title, String content, int userId) {
        boolean success = false;
        String query = "INSERT INTO post(title, content, uid, date) VALUES (?, ?, ?, NOW())";

        try (PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setString(1, title);
            ps.setString(2, content);
            ps.setInt(3, userId);

            int rowsAffected = ps.executeUpdate();
            success = (rowsAffected == 1);
        } catch (Exception e) {
            System.err.println("Error in addNotes: " + e.getMessage());
        }
        return success;
    }

    // Retrieve notes for a specific user
    public List<post> getData(int userId) {
        List<post> list = new ArrayList<>();
        String query = "SELECT * FROM post WHERE uid=? ORDER BY id DESC";

        try (PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setInt(1, userId);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    post po = new post();
                    po.setId(rs.getInt("id"));
                    po.setTitle(rs.getString("title"));
                    po.setContent(rs.getString("content"));
                    po.setPdate(rs.getDate("date"));

                    list.add(po);
                }
            }
        } catch (Exception e) {
            System.err.println("Error in getData: " + e.getMessage());
        }
        return list;
    }

    // Retrieve a single post by ID
    public post getDataById(int noteId) {
        post p = null;
        String query = "SELECT * FROM post WHERE id=?";
        
        try (PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setInt(1, noteId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    p = new post();
                    p.setId(rs.getInt("id"));
                    p.setTitle(rs.getString("title"));
                    p.setContent(rs.getString("content"));
                    p.setPdate(rs.getDate("date"));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return p;
    }

    // Update post title and content
    public boolean postUpdate(int noteId, String title, String content) {
        boolean success = false;
        String query = "UPDATE post SET title=?, content=? WHERE id=?";

        try (PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setString(1, title);
            ps.setString(2, content);
            ps.setInt(3, noteId);

            success = (ps.executeUpdate() == 1);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return success;
    }
    
    // **Delete a post by ID**
    public boolean DeleteNotes(int nid) {
        boolean f = false;
      
        
        try {
        	  String query = "DELETE FROM post WHERE id=?";
        	  PreparedStatement ps=conn.prepareStatement(query);
        	  ps.setInt(1, nid);
        	  int x=ps.executeUpdate();
        	  if(x==1)
        	  {
        		  f=true;
        		  
        	  }
           
        } catch (Exception e) {
            System.err.println("Error in deleteNoteById: " + e.getMessage());
        }
        return f;
    }
}
