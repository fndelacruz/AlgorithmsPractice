// Given two arrays, write a function to compute their intersection.
//
// Example:
// Given nums1 = [1, 2, 2, 1], nums2 = [2, 2], return [2].
//
// Note:
// Each element in the result must be unique.
// The result can be in any order.
/**
 * @param {number[]} nums1
 * @param {number[]} nums2
 * @return {number[]}
 */

var intersection = function(nums1, nums2) {
  var intersection = {};
  nums1.forEach(function(num) {
    if (nums2.indexOf(num) !== -1 && !intersection[num]) {
      intersection[num] = true;
    }
  });

  return Object.keys(intersection).map(function(num) {
    return parseInt(num);
  });
};
