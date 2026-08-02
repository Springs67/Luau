local repo = 'https://raw.githubusercontent.com/Springs67/Luau/refs/heads/Main'

local import = function(path: string)
	path = (path:gsub('->', '/')):gsub(' ', '')

    local suc, ret = pcall(function()
        local Content = game:HttpGet(repo .. '/' .. (path:gsub('->', '/')):gsub(' ', ''))

        if Content == '404: Not Found' then
        	return error('Failed to get contents of ' .. path)
        end

        return Content
    end)

    if suc then
        return loadstring(ret)()
    else
        warn(ret)
    end
end

getgenv().import = import
