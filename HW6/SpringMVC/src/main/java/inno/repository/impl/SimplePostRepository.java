package inno.repository.impl;

import inno.model.Post;
import inno.model.PostMapper;
import inno.repository.AbstractDao;
import inno.repository.PostRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class SimplePostRepository extends AbstractDao<Post> implements PostRepository {


    public SimplePostRepository() {
        super( "post", "post_id_seq", ((resultSet, i) -> {
            Post post = new Post();
            post.setId(resultSet.getLong("id"));
            post.setTitle(resultSet.getString("title"));
            post.setText(resultSet.getString("text"));
            post.setDate(resultSet.getDate("date"));
            return post;
        }));
    }

    @Override
    public boolean add(Post post) {
        return add("title, text, date", post.getTitle(), post.getText(), post.getDate());
    }
}
