class Supplier < ActiveRecord::Base
    scope :starting_with, lambda { |i| where('name like (?)', i+'%')}
end
