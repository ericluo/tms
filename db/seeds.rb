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
Department.delete_all
DEPS.each_with_index {|d, i| Department.create!(name: d, order: i)}

puts "SETTING UP DEFAULT POSITION"
Position.delete_all
%w[处长 正处级 副处长 副处级 科及科以下].each{|p| Position.create!(name: p)}

puts 'SETTING UP DEFAULT USER LOGIN'
User.delete_all
user = User.create!(:name => '罗文波', :email => 'user@example.com',
                    :password => 'please', :password_confirmation => 'please',
                    :department_id => 2, :position_id => 4)
puts 'New user created: ' << user.name

user.add_role "admin"

user2 = User.create!(:name => '张三', :email => 'user1@example.com',
                    :password => 'please', :password_confirmation => 'please',
                    :department_id => 5, :position_id => 1)
puts 'New user created: ' << user2.name

# puts "SETTING UP DEFAULT TRAIN CATEGORY"
# Category.delete_all
# [["脱产培训", "OffJobTrainRule"],["讲座培训", "LectureTrainRule"]].each do |n, r|
#   Category.create!(name: n, rule: r)
# end

# puts "setting up default InJobTrainCatalog"
[["三大模块", "初级", 2], ["三大模块", "中级", 4], ["三大模块", "高级", 6],
 ["学历教育", "本科", 6], ["学历交易", "硕士", 9], ["学历教育", "博士", 15],
 ["专业证书", "初级", 3], ["专业证书", "中级", 6], ["专业证书", "高级", 9], ["专业证书", "特级", 12]].each do |c|
  InJobTrainCatalog.create!(title: c[0], level: c[1], score: c[2])
end

