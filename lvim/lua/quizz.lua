local quizz = {}

local cmd = "find /home/richard/workspace/practice_cpp/code/leetcode/ -name *.cpp | sort -R"
local database = "/home/richard/workspace/practice_cpp/quizz.list"

local filenames = {}
local total = 0
local current = 0

function fileExist(filepath)
  local f = io.open(filepath)
  if f ~= nil then 
    f.close()
    return true
  else 
    return false
  end
end

function writeOutDatabase(database)
  local handle, err = io.open(database, 'w')
  print(err)
  handle:write(total, "\n")
  handle:write(current, "\n")

  for i, filename in ipairs(filenames) do
    handle:write(filename, "\n")
  end
  handle.close()
end

function createDatabase(database)
  -- execute command
  local handle = io.popen(cmd, 'r')
  total = 0
  current = 0
  for line in handle:lines() do
    table.insert(filenames, line)
    total = total + 1
  end
  handle.close()

  writeOutDatabase(database)
end

function parseDatabase(database)
  local handle = io.open(database, 'r')
  local line = handle:read()
  total = tonumber(line)
  line = handle:read()
  current = tonumber(line)

  while true do
    line = handle:read()
    if line == nil then 
      break 
    end
    table.insert(filenames, line) 
  end
  handle.close()
end

function quizz.next()
  current = current + 1
  current = math.max(math.min(total, current), 1)
  writeOutDatabase(database)
  vim.cmd(":e "..filenames[current])
end

function quizz.prev()
  current = current - 1
  current = math.max(math.min(total, current), 1)
  writeOutDatabase(database)
  vim.cmd(":e "..filenames[current])
end

if not fileExist(database) then
  createDatabase(database)
else
  parseDatabase(database)
end

return quizz
