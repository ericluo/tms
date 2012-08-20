# -*- coding: utf-8 -*-
class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  RANKS = %w[处长 正处级 副处长 副处级 科及科以下]
  ROLES = %w[系统管理员 审核员]

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me
  attr_accessible :rank, :role, :department_id
  
  belongs_to :department
  # accepts_nested_attributes_for :department
end
