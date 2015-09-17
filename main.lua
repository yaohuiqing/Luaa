loadfile("hello.lua")  --只编译，不运行从文件加载Lua代码，但是不会执行代码
dofile("hello.lua")  --会执行代码

-- for i=1,2,1 do
-- 	require("hello")
-- end

-- t={name=
-- "zhangsan",
-- 	test=function()
-- 	print("test")
-- 	end
--   }


-- t.test()
-- for k,v in pairs(t) do
-- 	print(k,v)
-- end


-- --算术类的元方法
-- local mt = {} --定义表
-- mt.__add=function(table,key)
-- 	print("两个table相加的时候会调用我")
-- end
-- local t1 = {}
-- local t2 = {}
-- setmetatable(t1,mt)
-- setmetatable(t2,mt)  --设置元素

-- local result = t1+t2
-- -- print(result)



-- --创建一个元表
-- local mt = {}
-- mt.__add=function ( s1,s2 )
-- local result = ""
-- if s1.sex=="boy"  and s2.sex=="girl"   then
-- 	result="完美的家庭"
-- 	elseif s1.sex=="girl" and s2.sex=="girl" then
-- 		result="不好"
-- 	else
-- 		result="不好"
--     end
-- return result
-- end

-- --创建两个table，想象成是两个类的对象
-- local s1 = {name="hello",sex="boy"}
-- local s2 = {name="Good",sex="boy"}
-- --给两个table设置新的元素
-- setmetatable(s1,mt)
-- setmetatable(s2,mt)
-- --进行加法操作
-- local result = s1+s2
-- print(result)

-- local t = {name="hehe"}--

-- local mt = {__index=function(table,key)
-- print("虽然你调用了我不存在的字段"..key)
-- end
-- }
-- print(t.money)
-- setmetatable(t,mt)  --mt相当于父类，如果t表内没有money，那么会去mt里面找money，如果mt里面
-- --也没有，那么就会返回一个nil
-- print(t.money)

-- local t = {name="here"}
-- local mt = {__index={
-- 	money="9000",
-- }
-- }
-- setmetatable(t,mt)
-- print(t.money)


-- local smartMan = {
-- name="name",
-- age="25",
-- money=9000,
-- sayHello=function ( )
-- 	num=20;
-- 	print("大家好，我是聪明的puff")
-- end
-- }
-- local t1 = {}
-- local t2 = {}
-- local mt = {__index=smartMan}
-- setmetatable(t1,mt)
-- setmetatable(t2,mt)--
-- print(t1.age)--当t1中没有参数age 则会调用mt里面的age 当mt里面没有时，则会通过mt在
-- --smartMan里面去找age，找到了则会输出这个age，若没有找到，则会返回一个空
-- t2.sayHello()
-- print(t2.sayHello())
-- print(t1.num)

-- local smartMan = {name="none",money=9000,sayHello=function ()	
-- 	print("dajia")

-- end
-- }
-- local t1 = {}
-- local mt = {__index=smartMan,__newindex=function ( table,key,value )
-- 	print(key.. "段是不存在的，不要试图给它赋值")

-- end
-- }
-- setmetatable(t1,mt)
-- t1.sayHello=function ()--是给t1的sayHello赋值
-- 	print("en")
-- end
-- t1.sayHello()


-- local smartMan = {name="none"}
-- local other = {name="大家好，我是很无辜的table"}
-- local t1 = {}
-- local mt = {__index=smartMan,__newindex=other}  --__index用于查询,__newindex用于更新
-- setmetatable(t1,mt)
-- print("other的名字，赋值钱:" ..other.name)
-- t1.name="小偷"
-- print("other的名字，赋值后:" ..other.name)
-- print("t1的名字:" ..t1.name)






-- local smartMan = {name="none"}
-- local t1 = {hehe=123}
-- local mt = {__index=smartMan,__newindex=function( t,k,v )	
-- 	print("别赋值")

-- end
-- }
-- setmetatable(t1,mt)
-- print(rawget(t1,"name"))  --rawget是忽略__index的功效，纯粹的查找t1中的字段若没有该字段
-- --则直接返回nil，有则输出该字段
-- print(rawget(t1,"hehe"))  --  
-- rawset(t1,"name","小偷")  --rawset是忽略__newindex的功效，纯粹的更改t1中的字段，若没有该字段
-- --则不更改，有酒更改
-- print(t1.name)

-- --如何实现一个table的深拷贝

--  function clone(t)

--  	if type(t)~="table" then
--  		return nil
--  end
-- local n = {}
--  for i,v in pairs(t) do
--  	n[i]=v
--  end
--  return n
-- end
 
--  t1 = {x=5,y="str"}
--  t2=clone(t1)
--  print(t1.y)
--  print(t2.y)
--  t2.y="yaohuiqing,hello"
--  print(t2.y)
--  print(t1.y)
--  print(t1.x)

-- --如何实现纪录table的长度
--  function clone(t)

--  	if type(t)~="table" then
--  		return nil
--  end
-- local n = {}
-- local i = 0
--  for k,v in pairs(t) do
--  	n[k]=v
--  	i=i+1
--  end
--  print(i)
--  return n
-- end
-- t={x=1,y=2,z=3,m=4,n=5,p=6}
-- ta=clone(t)

-- print(ta.x)

function clone( t )
	if type(t)~= "table" then
		return nil
    end
local A={}
local i = 0
 for k,v in pairs(t) do
 	A[k]=v
 	i=i+1
  end 
  print(i)
 return A

end

a={x="yaohuiqing",y="lulingen"}
b=clone(a)
print(a.x)
print(b.x)
b.x=a.y
print(b.x)