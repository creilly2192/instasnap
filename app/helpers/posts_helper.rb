module PostsHelper
  def display_likes(post)
    votes = post.votes_for.up.by_type(User)
    return list_likers(votes) if votes.size <= 3
    count_likers(votes)
  end

  #if post is liked show a full heart, else show an empty heart
  def liked_links(post)
    return link_to '', unlike_post_path(post.id), remote: true, id: "like_#{post.id}", class: " like glyphicon #{liked_post post}" if current_user.voted_for? post
    link_to '', like_post_path(post.id), remote: true, id: "like_#{post.id}", class: " like glyphicon #{liked_post post}"
  end

  private

  def liked_post(post)
    return 'glyphicon-heart' if current_user.voted_for? post
    'glyphicon-heart-empty'
  end

  def list_likers(votes)
    user_names = []
    unless votes.blank?
      votes.voters.each do |voter|
        user_names.push(link_to voter.user_name,
                                profile_path(voter.user_name),
                                class: 'user-name')
      end
      user_names.to_sentence.html_safe + like_plural(votes)
    end
  end

  def count_likers(votes)
    vote_count = votes.size
    vote_count.to_s + ' likes'
  end

  def like_plural(votes)
    return ' like this' if votes.count > 1
    ' likes this'
  end
end
