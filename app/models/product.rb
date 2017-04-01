class Product < ActiveRecord::Base
  has_many :reviews

  def self.update_or_create(attributes)
    obj = assign_or_new(attributes)
    if obj.save
      obj
    else
      false
    end
  end

  def self.assign_or_new(attributes)
    obj = first || new
    obj.assign_attributes(attributes)
    obj
  end
end
