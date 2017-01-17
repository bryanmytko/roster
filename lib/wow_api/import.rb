module WowApi
  class Import
    def self.character(name, realm, region = nil)
      region = region || "en_US"
      client.request(:get, "character/#{realm}/#{name}")
    end

    def self.update_guild_ilvl(realm, region = nil)
      region = region || "en_US"

      Member.all.each do |member|
        response = client.request(
          :get,
          "character/#{realm}/#{member.name}",
          { fields: "items" }
        )

        if response["items"]
          member.update(
            ilvl_display: response["items"]["averageItemLevel"],
            ilvl_equipped: response["items"]["averageItemLevelEquipped"]
          )
        else
          debugger
        end
      end
    end

    def self.guild_members(name, realm, region = nil)
      region = region || "en_US"

      guild = client.request(
        :get,
        "guild/#{realm}/#{name}",
        { fields: "members" }
      )

      guild["members"].each do |member|
        Member.find_or_create_by(
          name: member["character"]["name"],
          realm: member["character"]["realm"]
        )
      end
    end

    private

    def self.client
      Client.new
    end
  end
end
