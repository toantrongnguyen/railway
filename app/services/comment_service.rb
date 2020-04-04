class CommentService
  class << self
    def new
      Comment.new
    end

    def findByMovieId(movie_id)
      Comment.where({ movie_id: movie_id, comment_id: nil })
    end

    def create(params, user_id)
      valid_params = comment_params(params)
      movie = MovieService.find(params[:movie_id])
      unless valid_params[:comment_id].empty?
        comment = find(valid_params[:comment_id])
        if !comment
          return false
        end
      end
      valid_params[:user_id] = user_id

      if movie
        movie.comments.create!(valid_params)
        return true
      else
        return false
      end
    end

    def find(params)
      Comment.find(params)
    end

    def comment_params(params)
      params.require(:comment).permit(:content, :comment_id)
    end
  end
end
