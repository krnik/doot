return {
	ensure_dir_exists_or_else = function (path, callback, prompt)
		if path and vim.fn.isdirectory(path) == 0 then
			if (prompt and prompt()) or not prompt then
				callback()
			end
		end
	end,
}
