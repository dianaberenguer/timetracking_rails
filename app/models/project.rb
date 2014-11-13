class Project < ActiveRecord::Base
	# def self.iron_find (id)
	# 	where(id: id).first
		# end

	belongs_to :user
	has_many :entries

	validates :name, presence: true
	validates :name, uniqueness: true
	validates :name, length: {maximum:30}
	validates :name, format: {with: /\A[\w\s*]+\Z/}


	def self.last_created_projects (number)
		order(created_at: :desc).limit(number)
	end

	def total_hours
		hours = 0
		minutes = 0
		entries.each do |entry|
			hours += entry.hours
			minutes += entry.minutes
		end
		hours + (minutes / 60)
	end
end