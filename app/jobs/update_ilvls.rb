class UpdateIlvls < ActiveJob::Base
  queue_as :default

  def perform(realm)
    WowApi::Import.update_guild_ilvl(realm)
  end
end
