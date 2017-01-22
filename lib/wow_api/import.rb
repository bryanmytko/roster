module WowApi
  DEFAULT_REGION = "en_US"

  class Import
    def self.guild_members(realm)
      Member.all.each do |member|
        response = client.character(member.name, realm, "items")
        member.update_items(response)
      end
    end

    def self.single_member(name, realm)
      member = Member.find_by(name: name)

      response = client.character(name, realm, "items")
      member.update_items(response)
    end

    def self.initialize_guild(guild_name, realm)
      guild = client.guild(guild_name, realm, "members")

      guild["members"].each do |member|
        Member.find_or_create_by(
          name: member["character"]["name"],
          realm: member["character"]["realm"],
          thumbnail: member["character"]["thumbnail"]
        )
      end
    end

    private

    def self.client
      @client ||= Client.new
    end
  end
end
