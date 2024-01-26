-- Helper function to split a string into parts based on a delimiter
local function split(str, delimiter)
  local parts = {}
  for part in str:gmatch("[^" .. delimiter .. "]+") do
    table.insert(parts, part)
  end
  return parts
end

local Parts = {
  parts = {},
}

function Parts:new(parts)
  local o = { parts = parts }
  setmetatable(table, self)
  self.__index = self
  return o
end

-- Implementation of from and to methods
function Parts:from(type, input)
  if input == nil then
    Parts:new({})
  end

  if type == "snake" then
    return Parts.fromSnake(input)
  elseif type == "kebab" then
    return Parts.fromKebab(input)
  elseif type == "camel" then
    return Parts.fromCamel(input)
  elseif type == "pascal" then
    return Parts.fromPascal(input)
  end
end

function Parts.to(self, type)
  if type == "snake" then
    return self:toSnake()
  elseif type == "kebab" then
    return self:toKebab()
  elseif type == "camel" then
    return self:toCamel()
  elseif type == "pascal" then
    return self:toPascal()
  end
end

-- Implementation of specific conversion methods
function Parts.fromSnake(input)
  local parts = split(input, "_")
  return Parts:new(parts)
end

function Parts.toSnake(self)
  return table.concat(self.parts, "_")
end

function Parts.fromKebab(input)
  local parts = split(input, "-")
  return Parts:new(parts)
end

function Parts.toKebab(self)
  return table.concat(self.parts, "-")
end

function Parts.fromCamel(input)
  local parts = split(input, "(%u)")
  vim.print(parts)
  if parts == nil then
    return ""
  end
  parts[1] = parts[1]:lower()
  return Parts:new(parts)
end

function Parts.toCamel(self)
  local parts = self.parts
  if #parts == 0 then
    return ""
  end
  local result = parts[1]
  for i = 2, #parts do
    result = result .. parts[i]:sub(1, 1):upper() .. parts[i]:sub(2)
  end
  return result
end

function Parts.fromPascal(input)
  local parts = split(input, "(%u)")
  vim.print(parts)
  return Parts:new(parts)
end

function Parts.toPascal(self)
  local parts = self.parts
  local result = ""
  for part in parts do
    result = result .. part:sub(1, 1):upper() .. part:sub(2)
  end
  -- for i = 1, #parts do
  --   result = result .. parts[i]:sub(1, 1):upper() .. parts[i]:sub(2)
  -- end
  return result
end

local M = {}

function M.convert_case(from, to, input)
  local parts = Parts.from(from, input)
  return parts.to(to)
end

function M.case_converter(from, to)
  return function(input)
    return M.convert_case(from, to, input)
  end
end

function M.pascal_to_camel(input)
  return M.convert_case("pascal", "camel", input)
end

function M.snake_to_camel(input)
  return M.convert_case("snake", "camel", input)
end

function M.snake_to_pascal(input)
  return M.convert_case("snake", "pascal", input)
end

return M
