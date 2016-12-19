class Idea < ActiveRecord::Base
    validates :description, :author , presense: true
end
