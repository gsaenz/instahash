class Api::V1::TagsController < Api::V1::BaseController



  def create
  	if params[:tag][:photo_id]
  		tag = Api::V1::Tag.new(tag_params)
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
  		tag = Api::V1::Tag.where(photo_id:params[:tag][:photo_id], tag:params[:tag][:tag]).first
  		tag.destroy
  		respond_to do |format|
			format.json { head 204 }
		end
  	end
  end

  private
	def tag_params
		# {task: {description: ..., due_date: ..., complete:...} }
		params.require(:tag).permit(:photo_id,:tag)
	end



end
