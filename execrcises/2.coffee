# Write a function called `run` that takes a function as its first
# argument and passes all additional arguments to the called function
run = (func, args...) ->
  func(args)


exampleFunc = (input) ->
  console.log("passed arguments: #{input}")

run(exampleFunc, 3, 5)
