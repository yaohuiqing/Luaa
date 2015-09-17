--print("hello lua")

-- local game = require("game")
-- game.play()
-- game.pause()


-- require("module")  --获取文件
-- Data.setLevel(50)
-- print(Data.getLevel())
-- print(Data.level)


-- TSprite={
-- 	x = 0,
-- 	y = 0
-- }
-- --function TSprite.setPosition( self,x,y )--这种方式和下面用冒号的方式是一个效果的。默认
-- --默认的都是self
-- function TSprite:setPosition( x,y )

-- 	self.x = x
-- 	self.y = y
-- end
-- local who = TSprite
-- TSprite = nil
-- who.setPosition(who,1,2)--这种用点的和下面这种用冒号的方式是一个效果的
-- who:setPosition(3,4)


-- Hero= { attack = 0 }
-- function Hero:new(o )
-- 	o = o or {}
-- 	setmetatable(o,self)
-- 	self.__index = self
-- 	return o
-- end
-- function Hero:skill( addAttack )
-- 	self.attack = self.attack+addAttack
-- end
-- oneHero = Hero:new({attack=100})--oneHero是Hero的一个子类
-- oneHero:skill(10)
-- print(oneHero.attack)
-- for k,v in pairs(oneHero)  do
-- 	print(k,v)
-- end

-- oneHero:skill(80)
-- function oneHero:injured( loseAttack )
-- 	if loseAttack > self.attack then
-- 		error "not enought attack"

-- end
-- self.attack =self.attack - loseAttack/2
-- end
-- oneHero:injured(30)
-- print(oneHero.attack)


function search( classes,key ) --classes是一个表，而这个表里面有可以存放多个表
	for i=1,#classes do
		local value = classes[i][key]
		if value ~= nil then
			return value
		--else
			--return nil
		end
	end
end

local t1 = {name= "hehe"}
local t2 = {game = "who"}
print(search({t1,t2},"game"))
--print(search({t1,t2},"age"))


-- function createClass( ... )
-- 	local parents = {...}
-- 	local child = {}

	--设置类的元表－－－－－－－－－－
-- 	setmetatable(child,
-- 	{
-- 		__index=search(table,key)

-- 		return search(parents,key)
-- 	end
-- 		})
-- 	--给类新增一个new函数，用于创建对象 下面这四句很重要
-- 	function child:new(  )
-- 		o={}
-- 		setmetatable(o,child)
-- 		child.__index = child
-- 		return o
-- 	end
-- 	--返回这个继承了多个类的子类－－－－
-- 	return child
-- end


t={}
setmetatable(t,{__mode="k"})
--使用一个table作为t的key值
key1={name = "key1"}
t[key1]=1
key1=nil
--又使用一个table作为t的key值
key2={name = "key2"}
t[key2]=1
key2=nil
--强制进行一次垃圾收集
collectgarbage()--弱
for key,value in pairs(t) do
	print(key.name ..":" .. value)
end

