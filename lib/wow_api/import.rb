module WowApi
  DEFAULT_REGION = "en_US"

  class Import
    def self.character(name, realm)
      response = client.character(name, realm)
    end

    def self.update_guild_ilvl(realm)
      Member.all.each do |member|
        response = client.character(member.name, realm, "items")
        member.update_ilvl(response) if response["items"]
      end
    end

    def self.update_member_ilvl(name, realm)
      member = Member.find_by(name: name)

      response = client.character(name, realm, "items")
      member.update_ilvl(response) if response["items"]
    end

    def self.guild_members(guild_name, realm)
      guild = client.guild(guild_name, realm, "members")

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
