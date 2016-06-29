// Related to question Excel Sheet Column Title
//
// Given a column title as appear in an Excel sheet, return its corresponding
// column number.
//
// For example:
//
//     A -> 1
//     B -> 2
//     C -> 3
//     ...
//     Z -> 26
//     AA -> 27
//     AB -> 28

/**
 * @param {string} s
 * @return {number}
 */
var titleToNumber = function(s) {
  var digits = s.split('');
  var columnNumber = 0;
  digits.forEach(function(digit, idx) {
    columnNumber +=
      Math.pow(digitVal('Z'), digits.length - 1 - idx) * digitVal(digit);
  });
  return columnNumber;
};

var digitVal = function(s) {
  return s.charCodeAt() - 'A'.charCodeAt() + 1;
};
