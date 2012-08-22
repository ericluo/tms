# -*- coding: utf-8 -*-
class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :department
  has_many   :trains

  POSITION = %w[处长 正处级 副处长 副处级 科及科以下]

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me
  attr_accessible :position, :department_id
  
  def position_title
    POSITION[position]
  end

end
