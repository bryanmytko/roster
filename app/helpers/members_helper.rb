module MembersHelper
  SUCCESS = 875
  WARNING = 865

  def thumbnail_url
    "http://#{region}.battle.net/static-render/#{region}/"
  end

  def tr_color(member)
    case member.ilvl_equipped
    when proc { |n| n >= SUCCESS }
      "class=success"
    when WARNING...SUCCESS
      "class=warning"
    else
      "class=danger"
    end
  end

  private

  def region
    "us" # @TODO make this configurable
  end
end
