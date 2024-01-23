function snake_to_camel(input)
  return input:lower():gsub("_%w", function(match)
    return match:sub(2):upper()
  end)
end

function snake_to_pascal(input)
  local first_letter = input:sub(1, 1):upper()

  return first_letter .. snake_to_camel(input:sub(2))
end
