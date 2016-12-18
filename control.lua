remote.add_interface("cmdbuffer",
{
  add = function(buffname, buffpart)
    -- create/append buffer
    if global[buffname] == nil then
      global[buffname] = buffpart
    else
      global[buffname] = global[buffname] .. buffpart
    end

    return true
	end,
  exec = function(buffname)
    -- clear the selected buffer
    global[buffname] = nil
    return true
  end,
  exec = function(buffname)
		-- execute and clear the selected buffer
    local f = loadstring(global[buffname])
    global[buffname] = nil
    return f()
	end,
  ping = function()
    return true
	end,
  getbuffer = function(buffname)
    return global[buffname]
	end,

})
