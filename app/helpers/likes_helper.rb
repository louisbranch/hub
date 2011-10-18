module LikesHelper
  
  def like_finder
    if current_user.has_voted?(@build)
      @like = current_user.likes.find_or_create_by_build_id(@build)
    else
      @like = current_user.likes.build(params[:like])
    end
  end
  
end
