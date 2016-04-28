Player.delete_all

@@colorArray = [0xFF0000,0xFF6600,0xFFCC00,0x66CC00,0x6699FF,0x3333FF,0x660066]

Player.create!([
  {idplayer: 1111111, name: "test1", color: @@colorArray[0], x: 30, y: 50, radius: 5},
  {idplayer: 2222222, name: "test2", color: @@colorArray[3], x: 70, y: 80, radius: 5},
  {idplayer: 3333333, name: "test3", color: @@colorArray[5], x: 100, y: 120, radius: 5}
  ])
