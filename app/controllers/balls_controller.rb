# Класс рабботы с шарами
class BallsController < ApplicationController

require 'nokogiri'
@@colorArray = [0xFF0000,0xFF6600,0xFFCC00,0x66CC00,0x6699FF,0x3333FF,0x660066]


# Возвращает список шаров для отображения
def getballdata
  #if (Ball.count < 100)
    generateball
  ball = Ball.all
  respond_to do |format|
    format.xml {render xml:ball}
    format.json {render json:ball}
  end
end

def removeball
  ball = Ball.find_by id: params[:id]
  if ball != nil
    ball.destroy
  end
  respond_to do |format|
    format.xml {render xml:ball}
    format.json {render json:ball}
  end
end

# Удаление шаров из списка
def removeballs
    doc = Nokogiri::XML.parse(params[:xml])
    doc.xpath('//id').each do |id_element|
      ball = Ball.find_by id: id_element.text
      if (ball != nil)
        ball.destroy
      end
    end
end

# Генерация шаров на поле
def generateball
  balls = Ball.all
  for i in 0..70
    for j in 0..70
      ball = balls.find_by x: i, y: j

      if (ball == nil)
        rnd = Random.new.rand(0..101)

        if rnd < 50 || rnd >= 99
          ball = Ball.new()
          ball.x = i
          ball.y = j
          if rnd < 50
            ball.color = @@colorArray[Random.new.rand(0..6)];
            ball.typeball = 1 # GoodBall
          end
          if rnd >= 99
            ball.color = 0
            ball.typeball = 2 # BadBall
          end
          ball.save
        end
        puts ball
      end

    end
  end
end

end
