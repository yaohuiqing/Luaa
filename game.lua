local game = {}
game.play=function()--game里面的一个键play对应的是一个函数
print("play")
end

game.stop=function()--game里面的一个键stop对应的也是一个函数
print("stop")
end

function game.pause(  ) --其实这种方式也是一样的，跟以上的方式
	print("pause")
end
--dsfhdjfkhf
return game