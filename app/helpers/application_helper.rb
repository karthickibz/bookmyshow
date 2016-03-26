module ApplicationHelper
	def previous_event(book)
		event = Event.find_by_id(book.event_id)
		event.present? ? event.name : 'nil'
	end
end
