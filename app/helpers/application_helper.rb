module ApplicationHelper
  def check_error(model)
    render 'shared/error_messages', error_resource: model if model.errors.any?
  end

  def login_check_left
    link_to 'Write an Article', new_article_path if logged_in?
  end

  def login_check_right
    if logged_in?
      username_link = link_to current_user.name, user_path(current_user)
      logout_link = link_to 'log out', logout_path, method: :delete
      username_link + '|' + logout_link
    else
      login_link = link_to 'Log in', login_path
      register_link = link_to 'Register', signup_path
      login_link + '|' + register_link
    end
  end
end
