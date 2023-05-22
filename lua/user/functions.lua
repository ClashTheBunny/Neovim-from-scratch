function table.contains(table, element)
  for _, value in pairs(table) do
    if value == element then
      return true
    end
  end
  return false
end

function GetInput(input_prompt)
  local my_input
  vim.ui.input({prompt=input_prompt}, function(input) my_input = input end)
  return my_input
end

function Toggle_Gutter()
  -- sort of a "ternary" operator in lua
  vim.o.signcolumn = vim.o.signcolumn == "yes" and "no" or "yes"
  vim.o.number = not vim.o.number
end
