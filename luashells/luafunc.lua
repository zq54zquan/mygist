local function foo() 
	print("in the function")
	local x = 10
	local y = 20
	return x+y
end 

local a = foo

fooo = { jj = "12" }
fooo.bar = function () 
	print("t")
end
fooo.bar()

print(a())
