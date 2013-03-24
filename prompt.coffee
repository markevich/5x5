stdin = process.openStdin()
stdin.setEncoding 'utf8'
inputCallback = null

GRID_SIZE = 5
inRange = (x, y) ->
  0 <= x < GRID_SIZE and 0 <= y < GRID_SIZE
isInteger = (num) ->
  num is Math.round(num)
strToCoordinate = (input) ->
  halves = input.split(',')
  if halves.length is 2
    x = parseFloat halves[0]
    y = parseFloat halves[1]
    if !isInteger(x) or !isInteger(y)
      console.log "Координаты должны быть целочисленными."
    else if not inRange x - 1, y - 1
      console.log "Координаты должны быть в диапозоне от 1 до #{GRID_SIZE}"
    else
      {x, y}
  else
    console.log 'Введенные значения должны быть в формате `x, y`.'

promptForTile1 = ->
  console.log "Введите координаты первого тайла."
  inputCallback = (input) ->
    promptForTile2() if strToCoordinate input

promptForTile2 = ->
  console.log "Введите координаты второго тайла."
  inputCallback = (input) ->
    if strToCoordinate input
      console.log "Меняем местами тайлы... готово!"
      console.log "........."
      promptForTile1()

console.log "Добро пожаловать в 5х5!"
promptForTile1()

stdin.on 'data', (input) -> inputCallback input
