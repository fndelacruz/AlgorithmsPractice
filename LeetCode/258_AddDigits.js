/*
Given a non-negative integer num, repeatedly add all its digits until the
result has only one digit.

For example:

Given num = 38, the process is like: 3 + 8 = 11, 1 + 1 = 2. Since 2 has only
one digit, return it.
*/

/**
 * @param {number} num
 * @return {number}
 */
var addDigits = function(num) {
  var ones;
  while (num >= 10) {
    ones = num % 10;
    num = Math.floor(num / 10) + ones;
  }
  return num;
};
