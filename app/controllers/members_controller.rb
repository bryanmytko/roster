class MembersController < ApplicationController
  include WowApi

  def index
    @members = Member.all.order(ilvl_equipped: :desc)
  end
end
