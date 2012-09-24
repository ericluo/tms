# -*- coding: utf-8 -*-
module TrainsHelper
  # def status_tag(train)
  #   if train.approved.nil?
  #     haml_tag "span.label.label-info", "待审"
  #   elsif train.approved
  #     haml_tag "span.label.label-success", "加锁"
  #   else
  #     haml_tag "span.label.label-important", "打回"
  #   end
  # end
  
  def display_state(train)
    if train.approved.nil?
      ["info", "待审"]
    elsif train.approved?
      ["success", "加锁"]
    else
      ["error", "重报"]
    end
  end
end
