module ApplicationHelper
	def init_attachinary
		html = ""
		html = <<HTML
		$(function() {
		  $('.attachinary-input').attachinary();
		});
HTML
	end
end
