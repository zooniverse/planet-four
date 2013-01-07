defaults =
  decimalPlaces: 2
  separator: '.'

module.exports = (number, {decimalPlaces, separator} = defaults) ->
  result = []

  [numbers, decimals] = "#{number}".split '.'

  for n, i in numbers.split('').reverse()
    result.push n
    result.push ',' if (i + 1) % 3 is 0

  result = result.reverse()

  if decimals?
    decimals = separator + decimals + ('0' for i in [0..decimalPlaces]).join ''
    decimals = decimals[0..decimalPlaces]
    result.push decimals

  result.join ''
