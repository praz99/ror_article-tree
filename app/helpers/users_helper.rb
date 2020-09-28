module UsersHelper
  def article_check
    if @user.authored_articles.any?
      render 'users/partials/has_article'
    elsif @user == current_user
      render 'users/partials/write_new_article'
    else
      content_tag(:p, 'No Articles')
    end
  end

  def show_user_options(article)
    return unless @user == current_user

    edit_link = link_to 'edit', edit_article_path(article)
    delete_link = link_to 'delete', article_path(article), method: :delete, data: { confirm: 'Delete this article?' }

    edit_link + delete_link
  end
end
