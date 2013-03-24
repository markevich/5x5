stdin = process.openStdin()
stdin.setEncoding 'utf8'

promptForTile1 = ->
  console.log "Введите координаты первого тайла."
  inputCallback = (input) ->
    promptForTile2 if strToCoordinate input

promptForTile2 = ->
  console.log "Введите координаты второго тайла."
  inputCallback = (input) ->
    if strToCoordinate input
      console.log "Меняем местами тайлы... готово!"
      promptForTile1()
stdin.on 'data', (input) -> inputCallback input
