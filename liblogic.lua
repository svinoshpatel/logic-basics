local liblogic = {}

function liblogic.lnot(a)
	if a == true then
  	return false
  else
  	return true
  end
end

function liblogic.land(a, b)
	if a == true and b == true then
		return true
	else
		return false
	end
end

function liblogic.lor(a, b)
	if a == false and b == false then
  	return false
  else
  	return true
  end
end

function liblogic.limp(a, b)
	if a == true then
		if b == false then
			return false
		else
			return true
		end
	else
		return true
	end
end

function liblogic.lequ(a, b)
	if a == true and b == true or a == false and b == false then
		return true
	else
		return false
	end
end

function liblogic.lxor(a, b)
	if a == true and b == true or a == false and b == false then
  	return false
  else
  	return true
  end
end

function liblogic.f19(a, b, c)
	local func = liblogic.limp(liblogic.land(a, liblogic.lor(b, c)), liblogic.lxor(liblogic.land(a, b), liblogic.land(b, c)))
	return func
end

return liblogic
