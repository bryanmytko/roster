module MembersHelper
  def tr_color(member)
    case member.ilvl_equipped
    when proc { |n| n >= 875 }
      "class=success"
    when 865...875
      "class=warning"
    else
      "class=danger"
    end
  end
end
