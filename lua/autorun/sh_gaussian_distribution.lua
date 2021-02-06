if SERVER then
	AddCSLuaFile()
end

gaussian_random = gaussian_random or {}

local plotSteps = 11
local N = 100
local depth = 8
local arraysInitialized = false
local xArray = {}
local yArray = {}
local plotArray = {}
local printDistribution = true

local Color1 = Color(50,50,50,255) -- gray for -1
local Color2 = Color(255,255,255,255) -- white for 0
local Color3 = Color(0,255,0,255) -- green for 0.33
local Color4 = Color(0,0,255,255) -- blue for 0.66
local Color5 = Color(255,0,0,255) -- red for 1

function gaussian_random.assignRandomValue()
	if not arraysInitialized or not yArray or #yArray < 1 then
		arraysInitialized = true
		gaussian_random.Initialize()
	end

	local randomInt = math.Round(math.Rand(1, #yArray))
	local myValue = yArray[randomInt]
	table.remove(yArray,randomInt)
	return myValue or 0
end

function gaussian_random.Initialize()
	local randomWeps = ents.FindByClass("ttt_random_weapon")
	N = (#randomWeps > 1) and #randomWeps or 100
	gaussian_random.xArrayInitialize()
	gaussian_random.yArrayInitialize()

	-- Print Distribution of All values
	if printDistribution then
		gaussian_random.printYArray()
	end
end

function gaussian_random.Reset()
	arraysInitialized = false
end

function gaussian_random.interpolateColor(value)
	local col1 = Color1
	local col2 = Color2
	local col = col2
	local min = -1
	local max = 0

	if value >= 0 and value < 0.33 then
		min = 0
		max = 0.33
		col1 = col2
		col2 = Color3
	elseif value >= 0.33 and value < 0.66 then
		min = 0.33
		max = 0.66
		col1 = Color3
		col2 = Color4
	elseif value >= 0.66  then
		min = 0.66
		max = 1
		col1 = Color4
		col2 = Color5
	end

	interpValue = (value - min) / (max - min)
	r = col1.r * (1-interpValue) + col2.r * interpValue
	g = col1.g * (1-interpValue) + col2.g * interpValue
	b = col1.b * (1-interpValue) + col2.b * interpValue
	col = Color(r,g,b,255)

	return col
end

function gaussian_random.xArrayInitialize()
	for i = 1,N do
		xArray[i] = -0.5 + 1 * ((i-1) / (N-1))
	end
end

function gaussian_random.yArrayInitialize()
	local min = 1
	local max = -1

	-- Try to simulate Gaussian distribution with depth-times a uniform distribution
	-- Store Min and Max Values to set a range of -1 to 1 for all values
	for i = 1,N do
		temp = xArray[i]
		for j = 1,depth do
			temp = temp + (math.Rand(0,1) - 0.5) * math.pow(0.5, j)
			if j == depth then
				temp = temp + (math.Rand(0,1) - 0.5) * math.pow(0.5, j)
			end
		end
		if temp < min then
			min = temp
		end
		if temp > max then
			max = temp
		end
		yArray[i] = temp
	end

	-- Calculate mapping of min and max to -1 and 1 aka newY = m*x + b
	b = (1 + max / min) / (1 - max / min)
	m = (-1 - b) / min

	for i = 1,N do
		yArray[i] = m * yArray[i] + b
	end
end

function gaussian_random.printYArray()
	for i = 1,plotSteps do
			plotArray[i] = 0
	end

	local index = 1
	b = (plotSteps + 1) / 2
	m = b - 1
	for i = 1,#yArray do
		index = math.Round(m * yArray[i] + b)
		plotArray[index] = plotArray[index] + 1
	end

	local max = 0
	print("\nPlotting Distribution in " .. plotSteps .. " single steps.")
	for i = 1,#plotArray do
		value = -1 + 2 * (i-1) / (#plotArray - 1)
		print("Value " .. value .. " is distributed " .. plotArray[i] .. " times.")
		if plotArray[i] > max then
			max = plotArray[i]
		end
	end
	print("\n")

	print("\n Plotting visual Distribution")
	for i = 1,#plotArray do
		number = math.ceil(plotArray[i] * 10 / max)
		stringArray = "-"
		for j = 2,number do
			stringArray = stringArray .. "-"
		end
		print(stringArray)
	end
	print("\n")
end

