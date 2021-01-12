# frozen_string_literal: true

class RoomPlayersController < ApplicationController
  def edit
    @room_player = RoomPlayer.find(params[:id])
  end

  def update
    @room_player = RoomPlayer.find(params[:id])
    respond_to do |format|
      if @room_player.update(room_player_params)
        format.html { redirect_to @room_player.room, notice: "Room_player was successfully updated." }
        format.json { render :show, status: :ok, location: @room_player }
      else
        format.html { render :edit }
        format.json { render json: @room_player.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def room_player_params
    params.require(:room_player).permit(:dota_id)
  end
end
