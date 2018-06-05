utility = {}

function utility.count(table)
	local count = 0
	if (not table) then return count end
	for key, value in pairs(table) do
		count = count + 1
	end
	return count

end

function utility.showTable(table)
	Debug.Log("Show Table:")
	if (table) then
		for k, v in pairs(table) do
			local key = tostring(k)
			local value = tostring(v)
			Debug.Log(key .. " == " .. value)
		end
	else
		Debug.Log("Table is empty")
	end
end



return utility