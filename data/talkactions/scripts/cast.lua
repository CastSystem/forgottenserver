function onSay(cid, words, param)
	local player = Player(cid)
	local tmp = param:split(" ")
		if isInArray({"on","start"}, tmp[1]) then
	if player:isInCast() then
		player:sendCancelMessage("You are currently casting.")
			else
				player:setInCast(true)
				player:sendTextMessage(MESSAGE_INFO_DESCR, "You have started casting.")
	end
		elseif isInArray({"off","stop"}, tmp[1]) then
				if not player:isInCast() then
					player:sendCancelMessage("You Aren't Casting.")
				else
					player:setInCast(false)
					player:sendTextMessage(MESSAGE_INFO_DESCR, "You Stopped Casting.")
				end
		elseif isInArray({"restart","reset", "fix"}, tmp[1]) then
				player:setInCast(false)
	player:setInCast(true)
				player:sendTextMessage(MESSAGE_INFO_DESCR, "You Restarted Your Cast.")
		elseif isInArray({"kick","bye","remove"}, tmp[1])then
				player:sendTextMessage(MESSAGE_INFO_DESCR, "You Kicked The Viewers")
				player:kickViewers()
		elseif isInArray({"password","pass"}, tmp[1]) then
			if player:isInCast() then
				if not isInArray({"off","no","disable"},tmp[2]) then
				player:setPassword(tmp[2])
				player:sendTextMessage(MESSAGE_INFO_DESCR, "Your New Password is "..tmp[2].."")
				elseif isInArray({"off","no","disable"},tmp[2]) then
				player:setPassword("")
				player:sendTextMessage(MESSAGE_INFO_DESCR, "Your Have Cancelled The Password for your casting")
				end
			else
			player:sendTextMessage(MESSAGE_INFO_DESCR, "You Aren't Even Casting.")
			end
		end
	return true
end
