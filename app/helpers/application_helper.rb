module ApplicationHelper
	def current(path)
	  "current" if current_page?(path)
	end
end
