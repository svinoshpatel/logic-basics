local liblogic = require("liblogic")

local function convert(a)
	if a == true then
	  return "T"
	elseif a == false then
	  return "F"
	end
end

local function printrow(a, b)
	local row = {
	  a,
	  b,
	  liblogic.lnot(a),
	  liblogic.land(a, b),
	  liblogic.lor(a, b),
	  liblogic.limp(a, b),
	  liblogic.lequ(a, b),
	  liblogic.lxor(a, b)
	}
  for i = 1, #row do
    row[i] = convert(row[i])
  end
  print("|   " .. table.concat(row, "   |   ") .. "   |")
end

local function printrowv2(a, b, c)
	local row = { a, b, c, liblogic.f19(a, b, c) }
	for i = 1, #row do
		row[i] = convert(row[i])
	end
	print("|   " .. table.concat(row, "   |   ") .. "   |")
end

local values = { true, false }

print("+-------+-------+-------+-------+-------+-------+-------+-------+")
print("|   a   |   b   |  ¬ a  | a ∧ b | a ∨ b | a ⇒ b | a ⇔ b | a ⊻ b |")
print("+-------+-------+-------+-------+-------+-------+-------+-------+")
for _, a in ipairs(values) do
	for _, b in ipairs(values) do
		printrow(a, b)
		print("+-------+-------+-------+-------+-------+-------+-------+-------+")
	end
end

print("")

print("+-------+-------+-------+-------+")
print("|   a   |   b   |   c   |  f19  |")
print("+-------+-------+-------+-------+")
for _, a in ipairs(values) do
	for _, b  in ipairs(values) do
  	for _, c  in ipairs(values) do
    	printrowv2(a, b, c)
    	print("+-------+-------+-------+-------+")
    end
  end
end
