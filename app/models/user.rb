# -*- coding: utf-8 -*-
class User < ActiveRecord::Base
  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me
  attr_accessible :position_id, :department_id, :role_ids

  rolify
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable

  belongs_to :department
  has_many   :trains, foreign_key: "trainee_id", dependent: :destroy
  belongs_to :position

  has_and_belongs_to_many :roles, join_table: :users_roles
  accepts_nested_attributes_for :roles

  scope :colleagues, lambda {|user| where('department_id = ?', user.department.id)}
  
  def total_score
    trains.sum(&:score)
  end

  def total_period
    trains.sum(&:period)
  end
  
end
