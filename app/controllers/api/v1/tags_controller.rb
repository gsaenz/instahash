class Api::V1::TagsController < Api::V1::BaseController
  def create
  	if params[:tag][:photo_id]
  		tag = Tag.new(tag_params)
  		respond_to do |format|
  			if tag.save
  				format.json {render :json => tag, status: 201}
  			else
  				format.jsont {render :json => "An error ocurred"}
  			end
  		end
  	end
  end

  def destroy
  	if params[:tag][:photo_id]
  		
  	end
  end

  private
	def tag_params
		# {task: {description: ..., due_date: ..., complete:...} }
		params.require(:tag).permit(:photo_id,:tag)
	end

end
