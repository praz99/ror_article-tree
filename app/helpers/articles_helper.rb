module ArticlesHelper
  def form_image_check(form)
    if @article.image.attached?
      render 'articles/partials/has_image', f: form
    else
      render 'articles/partials/has_no_image', f: form
    end
  end

  def show_image_check
    render 'articles/partials/show_image' if @article.image.attached?
  end

  def show_vote(var)
    vote = Vote.find_by(article: var, user: current_user)
    if vote
      render 'articles/partials/votedown', var: var, vote: vote
    else
      render 'articles/partials/voteup', var: var
    end
  end
end
