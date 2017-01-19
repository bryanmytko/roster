class UpdateIlvls < ActiveJob::Base
  queue_as :default

  def perform
    WowApi::Import.update_guild_ilvl("mal'ganis")
  end
end
