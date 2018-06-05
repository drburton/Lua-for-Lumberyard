utility = {}

function utility.count(table)
	local count = 0
	if (not table) then return count end
	for key, value in pairs(table) do
		count = count + 1
	end
	return count
end

return utility