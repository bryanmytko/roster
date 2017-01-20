class Member < ApplicationRecord
  def update_ilvl(response)
    update(
      ilvl_display: response["items"]["averageItemLevel"],
      ilvl_equipped: response["items"]["averageItemLevelEquipped"]
    )
  end
end
