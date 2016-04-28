class PlayersController < ApplicationController

@@min = 0;
@@max = 70;
@@colorArray = [0xFF0000,0xFF6600,0xFFCC00,0x66CC00,0x6699FF,0x3333FF,0x660066]


def getplayer
  player = Player.find_by idplayer: params[:idplayer]
  if (player == nil)
    player = Player.new
    player.idplayer = params[:idplayer]
    player.name = params[:name]
    player.color = @@colorArray[Random.new.rand(0..6)];
    player.score = 0
    player.radius = 10;
    player.x = 20 #Random.new.rand(@@min..@@max)
    player.y = 20 #Random.new.rand(@@min..@@max)
    player.save
  end
  respond_to do |format|
    format.xml {render xml: player}
    format.json {render json: player}
  end
end

def getplayersdata
  players = Player.all
  respond_to do |format|
    format.xml {render xml: players}
    format.json {render json: players}
  end
end

def moveplayer
  player = Player.find_by idplayer: params[:idplayer]
  if (player != nil)
    player.x = params[:x]
    player.y = params[:y]
    player.radius = params[:radius]
    player.save
  end
  respond_to do |format|
    format.xml {render xml: player}
    format.json {render json: player}
  end
end

def removeplayer
  player = Player.find_by idplayer: params[:idplayer]
  if (player != nil)
    player.destroy
  end
  respond_to do |format|
    format.xml {render xml: player}
    format.json {render json: player}
  end
end

end
