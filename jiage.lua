function GameScene:musicDemo()
	audio.playMusic("LuckyDay.mp3",true)
	--播放音乐 
end

function GameScene::labelDemo()
	--UILabelType 2 系统字体
	--UILabelType 1 字体文件
	--text 文本
	--size 大小
	--color 颜色
	local label = cc.ui.UILabel.new({UILabelType = 2,text = "Hellow,World",size = 64,color = cc.c4b(0,255,0,255)})
	label:align(display.CENTER,display.cx,display.cy+100) --对齐方式 位置
	self:addChild(label)


	local label1 = cc.ui.UILabel.new({UILabelType = 1,text = "Hellow,World",font = "futura-48.fnt"})
	label1:align(display.CENTER,display.cx,display.cy+100) --对齐方式 位置
	self:addChild(label1)
end


function MyApp:run()
	cc.FileUtils:getInstance():addSearchPath("res/");--添加搜索路径
	display.addSpriteFrames("minerAction.plist","minerAction.png")
	self:enterScene("1.png")
end

function GameScene:animateionDemo()
	local sp = display.newSprite("#miner_0701.png") --精灵帧来创建
	sp:setPosition(240,160)
	sekf:addChild(sp)

	local frames = {}; --表
	for i=1,10 do
		string = "miner_0" .. 700+i ..".png"; --名字
		frames[i] = cc.SpriteFrameCache::getInstance():getSpriteFrame(string);
	end
	local animation = cc.Animation:createWithSpriteFrames(frames,0.08); --时间：每帧的间隔
	local animate = cc.Animate:create(animation);
	sp:runAction(cc.RepeatForever:create(animate));

	--lua封装的 底层的代码就是上面写的
	local frames = display.newFrames("miner_0%d.png",701,10); --图片序列的起始号码  有多少张
	local animation = display.newAnimation(frames,0.08);
	sp:playAnimationForever(animation);
end


function function_name( ... )
	local pushbutton = cc.ui.UIPushButton:new();

	pushbutton:setButtonImage(cc.ui.UIPushButton.NORMAL,"Button01.png",nil); --正常的图片
	pushbutton:setButtonImage(cc.ui.UIPushButton.PRESSED,"Button01Pressed.png",nil); --点击时显示的图片
	pushbutton:setButtonImage(cc.ui.UIPushButton.DISABLED,"Button01Disabled.png",nil); --button不可触摸时显示的图片

	pushbutton:addNodeEventListener(cc.NODE_TOUCH_EVENT,function(event))  
	print(event.name)--点击的状态
	print(event.x)--点击的位置
	print(event.y)--点击的位置
	return true
end
	--pushbutton:setButtonEnabled(false); --不可以触摸
	local slider = cc.ui.UISlider.new(
		display.LEFT_TO_RIGHT, --slider方向
		{
		bar = "SliderBarFixed.png",
		button = "SliderButton.png"
	},
	{scale9 = true}
		)
	slider:onSliderValueChanged(function(event))
	print(event.value)
	end)
slider:setSliderValue(75)
slider:align(display.CENTER_TOP, display.cx + 60, display.cy - 40)
self:addChild(slider)
end
--文本框
local function onEdit(event,editbox)
	if event == "began" then
		print("began")
		elseif event == "changed" then
			print("changed")
			elseif event == "ended" then
			print("ended")
			elseif event == "return" then
				print("return")
			end
		end

local editbox = cc.ui.UIInput.new({
	image = "bar.png", --背景图片
	listener = onEdit, --指定响应函数
	size = CCSize(200,40), --大小
	})
editbox:setPosition(display.cx, display.cy - 100)
--editbox:setInputFlag(0) --0 密码
editbox:setPlaceHolder("please"); --提示文字
self:addChild(editbox)
--在 player中不显示键盘，但是在真机或者xcode中运行是会有键盘的。 








































