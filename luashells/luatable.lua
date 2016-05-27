local crop = {
	web = "www.google.com",
	telephone = "12345678",
	staff = {"Jack","Scott","Gary"},
	100876,
	100191,
	[10]=360,
	["city"]="Beijing"
}
--print(crop.web)
--print(crop["telephone"])
--print(crop[2])

--print(crop["city"])
--print(crop["staff"][1])
--print(crop[10])

for i in pairs(crop) do 
	print(i)
	print(crop[i])
end
