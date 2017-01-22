class Member < ApplicationRecord
  def update_items(response)
    return unless response["items"]

    update(
      ilvl_display: response["items"]["averageItemLevel"],
      ilvl_equipped: response["items"]["averageItemLevelEquipped"]
    )
  end
end
