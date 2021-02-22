function custom_prompt()
  cwd = clink.get_cwd()
  prompt = "\x1b[1;32;40m{cwd} {git}{hg} \n\x1b[1;30;40m{time}\n{lamb} \x1b[0m"
  new_value = string.gsub(prompt, "{cwd}", cwd)
  add_time = string.gsub(new_value, "{time}", os.date("%x - %X"))
  clink.prompt.value = string.gsub(add_time, "{lamb}", "λ")
end

clink.prompt.register_filter(custom_prompt, 1)