--lua的输出
print("HelloWorld")

--lua单行注释
--[[
	lua多行注释
]]

name = "xiaoming"--但是不推荐这么使用
print(name)
print(type(name))--type可以获得对象的类型

yes = true --false
print(type(yes))--boolean

k = nil
print(type(nil)) --nil
--在lua中如果要删除一个对象，就让 对象 = nil

print(type(print)) --function

--string的操作
print("HelloWorld" .. "HelloWorld") --HelloWorldHelloWorld
print(type(tonumber("123"))) --字符串变为number
print(type(tostring(123))) --字符串变为string

print("Hello\nWorld") --特殊的字符，与c/c++差不多  特殊字符



print("10" + 1) --11
print("10" + 10) --20
print(10 .. 10) --1010  --最好使用 tonumber tostring

--表达式

-- + - * / ^
-- -负数

number1 = 2
number2 = 3
print(number1 ^ number2)

--关系运算符
-- < > <= >= == ~=(不等于)
string1 = "10"
number1 = 10
if string1==number1 then
	print("~=")
end

m = 10
if m>10 then
print()
elseif m<10 then
print()
else
print()
end
--输出9*9口诀表

--逻辑运算符
--and or ont
b = false
if not b then
	print("not b")--相当于c++中的 ！
end

--a and b 如果a为false ，则返回a，否则返回b
--a or b 如果a为true，则返回a，否则返回b
-- false nil为假 其他都为真。包括0

print(4 and 5) --5
print(4 or 5) --4
print(0 or 5) --0
print(nil and 5) --nil

--and 的优先级比 or高。c语言中的三元运算符 a?b:c在lua中可以这么实现
--(a and b) or c
a = false
b = 1
c = 2
print(((a and b) or c))

--赋值
print("-------------赋值------------")
a = 1
b = 2
a,b = b,a
print(a)
print(b)
a,b,c,d,e = 1,2,3,4
print(a);
print(b);
print(c);
print(d);
print(e); --nil 这个规则在函数的返回值同样适用

print("------------------for语句------------------")
for i =10,1,-1 do
	print(i)
end

for i=1,10,2 do
	print(i)
end


print("---------------------------");
for i=1,9 do
	local str = "";
	for j=1,i do
		str = str .. " " .. i .. "*" .. j .. "=" .. i*j
	end
	print(str)
end

--函数
function myfunc()
	print("HelloWorld");
end
myfunc();

local myfunc1 = function(a)
    print(a)
end

myfunc1(12);

a = print;
a("HelloWorld");

b = myfunc1;
b(12);--函数也是第一类值，与普通的数据类型一样 可以直接赋值

local myfunc2 = function ( ... )
	local arg = {...}
	for i,v in ipairs(arg) do --遍历 table
		print(i,v)
	end
	-- body
end

myfunc2(1,2,3,4,5);

myfunc2(1); --如果参数个数比接受参数的个数少， nil


local myfunc3 = function()
	return 1,2,3
end

a,b,c = myfunc3();
print(a);
print(b);
print(c);


days = {"s","m","tu","w","th","f","s"};
print(days[1]);--下标是从1开始
days[-5] = "mm";
print(days[-5]);  --可以这样使用，但是不建议这么用

hero = {level = 10,age = 30,name = "xiaoming"}; --字典
hero.level = 20;
print(hero.level);

hero1 = {1,2,level = 10,age = 30,4,5};
print(hero1[1]);
print(hero1[3]);--4
print(hero1.level);--10

print("-------------------------")
hero1.myfunc = function(a,b)
	print(a.level);
end

hero1:myfunc() --语法糖

print("----------------------------");
for i,v in ipairs(hero1) do   ---数组的类型
	print(i,v)
end
print("----------------------------");
for i,v in ipairs(hero1) do   ---全部内容 包括函数
	print(k,v);
end

print("----------------------------");

hero3 = {1,2,3,age = 10,k = {10,20,30,age = 100}};; --表里面嵌套表

print(hero3[1]);
print(hero3.age);
print(hero3.k[1]);
print(hero3.k.age);

print("-------------------------");
dofile("./data.txt");
print(hero.basic.name);

function SaveTableContent(file,obj,d) --file文件句柄 obj现在要写入的数据  d 表示等号左边或者右边的
	local szType = type(obj);
	if szType == "number" then
		if d == "right" then
			file:write(obj);
		end
		elseif szType == "string" then
			if d == "left" then
				file:write(obj);
			elseif d == "right" then
 			file:write(string.format("%q",obj));
		end
		elseif szType == "table" then
			file:write("{\n");
			for i,v in pairs(obj) do
				file:write("");
				SaveTableContent(file,i,"left");
				file:write("=");
				SaveTableContent(file,v,"right");
				file:write(", \n");
			end
			file:write("}\n");
		else
			error("can't serialize a" .. szType);
		end
	end
function SaveTable()
	hero.basic.name = "HelloWorld"
	local file = io.open("data.txt","w")
	file:write("hero = \n")
	SaveTableContent(file,hero)
	file.close();
end


function func6()
	local i = 0
end

function  count()
	local i = 0;
	return function()
	i = i + 1;
	return i;
end
end

local func = count();

print(func()); ---1
print(func()); ---2
print(func()); ---3


function count()
	local i = 0;
	return function()
	local j = 0;
	j = j+1;
	i = i+1;
	return i,j
end
end

local func = count();
a,b = func();
print(a..b);
a,b = func();
print(a..b);
a,b = func();
print(a..b);

local function drink()
	print("drink")
end
local function eat()
	print("eat")
	return drink()
end

eat();

local eat1;
local drink1;
eat1 = function ();
	print("eat1")
	return drink1()
end
drink1 = function()
	print("drink1")
end
eat1();

print("-----------------------------------")
--一个函数的调用是另一个函数的最后一个动作时，这个调用称之为尾调用
myfunc = function(n,m)
if n == 1 then
	return m;
	else
		return myfunc(n-1,m*n);
	end
end
print(myfunc(10000,1));


--迭代器
function dieDaiQi(t)
	local  i = 0;
	return function ()
	i = i+1;
	return t[i];
	end
end

local t = {1,2,3,4,5};
local func = dieDaiQi(t);
print(func());
print(func());
print(func());
print(func());
print(func());
print(func());


print("4.lua");
function add(a,b)
	return a+b;
end

---协程
local co = coroutine.create(functiong())
for i=1,10 do
	print(i)
	coroutine.yield();
end
end--状态是挂起的状态
print("-----------")

for i=1,

coroutine.resume(co);





