# -*- coding: utf-8 -*-
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
puts 'SETTING UP DEFAULT DEPARTMENT'
DEPS = %w[办公室 政策法规处 非现场监管一处 非现场监管二处 现场检查一处
          现场检查二处 城市商业银行监管处 非银行机构监管处 合作处 外资处
          直管处 统计处 财务处 人事处 监察室 机关党委 后勤服务中心 案件办]
DEPS.each_with_index {|d, i| Department.create!(name: d, order: i)}

puts 'SETTING UP DEFAULT USER LOGIN'
user = User.create!(:name => '罗文波', :email => 'user@example.com',
                    :password => 'please', :password_confirmation => 'please',
                    :department_id => 2, :position => 4)
puts 'New user created: ' << user.name

user.add_role "admin"

user2 = User.create!(:name => '张三', :email => 'user1@example.com',
                    :password => 'please', :password_confirmation => 'please',
                    :department_id => 5, :position => 1)
puts 'New user created: ' << user2.name

puts "SETTING UP DEFAULT TRAIN CATEGORY"
[["视频培训", 5],["现场培训", 10]].each {|n, w| TrainCategory.create!(name: n, weight: w)}
