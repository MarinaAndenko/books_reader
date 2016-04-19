class GenresController < ApplicationController
	def new
		@genre = Genre.new
	end 
	def create
		@genre = Genre.new(genre_params)
		json = if @genre.save
       { json: { genre: render_to_string("genres/_genre", layout: false, locals:{genre: @genre}) }}
    end 
    render json
	end 
	def destroy
		@genre  = Genre.find(params[:id])
		json = if @genre.destroy
      { json: { genre: render_to_string("genres/_genre", layout: false, locals:{genre: @genre}) }}
     end
     render json
	end 

	private
		def genre_params
			params.require(:genre).permit(:name)
		end 
end
