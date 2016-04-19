module BooksHelper
	def has_genre(book, genre)
		book.book_genres.each do |b_genre|
			return true if b_genre.genre_id == genre.id 
		end 
		false
	end
end
