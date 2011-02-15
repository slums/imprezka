class Party < ActiveRecord::Base

  has_attached_file :avatar, :styles => { :medium => "300x300>", :domenu => "190x190", :thumb => "100x100>" }

  validates :name, :presence => true, :length => { :minimum => 2 }
  validates :description, :presence => true, :length => { :minimum => 2 }
  validates :place, :presence => true, :length => { :minimum => 2 }

  belongs_to :user
  has_many :comments, :dependent => :destroy

end
