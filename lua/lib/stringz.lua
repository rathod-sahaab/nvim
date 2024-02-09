local M = {}

function M.split(str, delimiter)
  local parts = {}
  for part in str:gmatch("[^" .. delimiter .. "]+") do
    table.insert(parts, part)
  end
  return parts
end

function M.pascal_to_camel(input)
  if input == nil then
    return input
  end
  local first_letter = input:sub(1, 1):lower()
  return first_letter .. input:sub(2)
end

function M.snake_to_camel(input)
  if input == nil then
    return input
  end
  return input:lower():gsub("_%w", function(match)
    return match:sub(2):upper()
  end)
end

function M.snake_to_pascal(input)
  if input == nil then
    return input
  end
  local first_letter = input:sub(1, 1):upper()
  return first_letter .. M.snake_to_camel(input:sub(2))
end

return M
