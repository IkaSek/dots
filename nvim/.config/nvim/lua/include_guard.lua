include_guard = {
	fname_to_guard = function(name)
		local fname = vim.fn.fnamemodify(name, ":t")
		local pos1, pos2 = fname:find("%.")
		local result = fname:sub(1, pos1):gsub("[^%w]", "_"):upper() .. "H_"
		return result
	end,

	def_guard = function(buf)
		name = include_guard.fname_to_guard(vim.api.nvim_buf_get_name(buf))
		vim.api.nvim_buf_set_lines(buf, 0, 0, true, {
			"#ifndef " .. name,
			"#define " .. name,
			"",
			"",
			"",
			"#endif",
		})

		vim.api.nvim_win_set_cursor(0, { 4, 0 })
	end,
}

vim.api.nvim_create_autocmd("BufNewFile", {
	pattern = "*.h",
	callback = function(args)
		include_guard.def_guard(args.buf)
	end,
})
