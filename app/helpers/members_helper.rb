module MembersHelper
  SUCCESS = 875
  WARNING = 865

  def thumbnail_url
    "#{battlenet_url}/static-render/#{region}/"
  end

  def armory_url(member)
    "#{battlenet_url}/wow/en/character/" + \
      "#{member.realm}/#{member.name}/simple"
  end

  def battlenet_url
    "http://#{region}.battle.net"
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
