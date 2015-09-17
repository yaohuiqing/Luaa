
module("Data",package.seeall)--新建了一个叫Data的文件
--local  level = 0 加了local 则在外面访问不到
level=0
function setLevel( a )
	level=a

end

function getLevel(  )
	return level
end