
board = {
	{0, 7, 6, 0, 0, 0, 4, 0, 0},
	{0, 0, 8, 0, 0, 0, 0, 0, 1},
	{1, 0, 4, 0, 0, 0, 0, 0, 9},
	{6, 0, 5, 3, 0, 7, 0, 4, 0},
	{0, 0, 0, 0, 0, 6, 0, 5, 7},
	{0, 4, 2, 8, 1, 5, 3, 0, 6},
	{5, 0, 1, 0, 0, 9, 6, 0, 0},
	{0, 0, 3, 5, 0, 0, 0, 7, 4},
	{4, 0, 0, 0, 0, 0, 0, 0, 0}
}

function solve()
	local x, y = find_empty()
	if x == nil then
		return true
	end

	for n = 1, 9 do
		if is_valid(x, y, n) then
			board[y][x] = n

			if solve() then
				return true
			end

			board[y][x] = 0
		end
	end
	return false
end

function is_valid(x, y, n)
	for i = 1, 9 do
		if board[i][x] == n or board[y][i] == n then
			return false
		end
	end
	bx = 3*math.ceil(x/3)
	by = 3*math.ceil(y/3)
	for i = by-2, by do
		for j = bx-2, bx do 
			if board[i][j] == n then
				return false
			end
		end
	end
	return true
end

function find_empty()
	for y, row in ipairs(board) do
		for x, n in ipairs(row) do
			if n == 0 then
				return x, y
			end
		end
	end
end

function draw_board()
	for y, row in ipairs(board) do
		for x, n in ipairs(row) do
			io.write(n)
			if x % 3 == 0 and x ~= 9 then
				io.write("|")
			end
		end
		print()
		if y % 3 == 0 and y ~= 9 then
			print(string.rep("-", 11))
		end
	end
end

solve()
draw_board()