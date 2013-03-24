clearArray = (arr) ->
  arr.splice 0, arr.length
  arr

array = [1, 2, 3, 4]
console.log("original array #{array}")
clearArray(array)
console.log("array has #{array.length} elements after clear function")
