// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ArrayManipulator {
    function sortAndRemoveDuplicates(uint[] memory arr) public pure returns (uint[] memory) {
        // Sort the array
        uint n = arr.length;
        for (uint i = 0; i < n - 1; i++) {
            for (uint j = 0; j < n - i - 1; j++) {
                if (arr[j] > arr[j + 1]) {
                    (arr[j], arr[j + 1]) = (arr[j + 1], arr[j]);
                }
            }
        }

        // Remove duplicates
        if (n <= 1) {
            return arr;
        }

        uint uniqueCount = 1;
        for (uint i = 1; i < n; i++) {
            bool isDuplicate = false;
            for (uint j = 0; j < uniqueCount; j++) {
                if (arr[i] == arr[j]) {
                    isDuplicate = true;
                    break;
                }
            }

            if (!isDuplicate) {
                arr[uniqueCount] = arr[i];
                uniqueCount++;
            }
        }

        // Resize the array to remove duplicates
        uint[] memory result = new uint[](uniqueCount);
        for (uint i = 0; i < uniqueCount; i++) {
            result[i] = arr[i];
        }

        return result;
    }
}
