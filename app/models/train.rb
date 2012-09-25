# -*- coding: utf-8 -*-
class Train < ActiveRecord::Base

  validates :name, :score, :category_id, :trainee_id, :registrar_id, presence: true
  validates :start_date, :end_date, format: {with: /\d{4}-\d{2}-\d{2}/, message: "数据格式必须为：YYYY-MM-DD"}

  validates_each :category_id do |record, attr, value|
    record.errors.add(attr, "请选择对应的培训类别子项") unless Category.find(value).leaf?
  end

  validate do
    errors.add(:start_date, "开始日期必须在结束日期之前") unless start_date < end_date
  end

  belongs_to :category
  belongs_to :trainee, class_name: "User"
  belongs_to :registrar, class_name: "User"
  
  attr_accessible :name, :score, :comment, :organizer
  attr_accessible :start_date, :end_date, :period
  attr_accessible :trainee_id, :registrar_id, :category_id

  scope :owned_by, lambda {|user| where('trainee_id == ?', user.id)}
  scope :registed_by, lambda {|user| where('registrar_id == ?', user.id)}
  
  scope :unapproved, where(approved: nil)
  scope :approved, where(approved: true)
  scope :rejected, where(approved: false)
  # attr_accessible :certificate
  
  # def score
  #   root_category = category.root
  #   case root_category.name
  #   when "脱产培训" then offjob_score
  #   when "讲座培训" then 2
  #   when "在岗培训" then category.scoring_rule.to_i
  #   when "再培训"   then 10
  #   else  0
  #   end
  # end
  def registed_by?(user)
    registrar_id == user.id
  end

  def owned_by?(user)
    trainee_id == user.id
  end

  def self.to_csv
    CSV.generate do |csv|
      csv << column_names
      all.each do |t|
        csv << t.attributes.values_at(*column_names)
      end
    end
  end
  
  def status
    if approved.nil?
      "待审"
    elsif approved
      "加锁"
    else
      "重报"
    end
  end
  
  private

  # period must be integer,
  # TODO what if duration be float
  def offjob_score
    duration = period.nil? ? (end_date - start_date + 1).to_i : period
    scores = duration * 3
    case duration
    when 1..3 then [scores, 8].min
    when 4..7 then [scores, 15].min
    when 8..(1 / 0.0) then [scores,20].min
    else raise "duartion should be positive"
    end
  end
  
end
