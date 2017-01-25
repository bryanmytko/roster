class UpdateIlvls < ActiveJob::Base
  queue_as :default

  def perform(realm)
    WowApi::Import.guild_members(realm)
  end
end
