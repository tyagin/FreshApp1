class Movie < ActiveRecord::Base
  validates:title,presence:true
  validates:release_date,presence:true
  validate:released_1930_or_later
  validates_length_of:title,minimum:3
  validates:title,uniqueness:true
  before_validation :capitalize_title
  def capitalize_title
     self.title = self.title.strip
     self.title = self.title.split(/\s+/).map(&:downcase).map(&:capitalize).join(' ')
end
  def released_1930_or_later 
    errors.add(:release_date, 'must be 1930 or later') if
      self.release_date < Date.parse('1 Jan 1930')
end
  @@grandfathered_date = Date.parse('1 Nov 1968')
  def grandfathered? ; self.release_date >= @@grandfathered_date ; 
end
end

 
