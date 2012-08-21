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

  before_create :set_default_role

  POSITION = %w[处长 正处级 副处长 副处级 科及科以下]
  ROLES = %w[系统管理员 审核员 操作员]

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me
  attr_accessible :position, :role, :department_id
  

  def admin?
    role == 1
  end
  
  def position_title
    POSITION[position]
  end

  def set_default_role
    if role.nil?
      role = 2 # ROLES[2]
    end
  end
end
