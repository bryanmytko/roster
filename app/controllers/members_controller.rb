class MembersController < ApplicationController
  include WowApi

  def index
    @members = Member.all.order(ilvl_equipped: :desc)
  end

  def new
    @member = Member.new
  end

  def create
    member = Member.create(member_params)
    WowApi::Import.update_member_ilvl(member.name, member.realm)
    redirect_to :root
  end

  private

  def member_params
    params.require(:member).permit(:name, :realm)
  end
end
