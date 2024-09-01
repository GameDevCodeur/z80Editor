--
-- toBinary - nombre vers une chaine encodée binaire
--

local bin = {
     [0] = "0000",  [1]  = "0001",  [2]  = "0010",  [3] = "0011",
     [4] = "0100",  [5]  = "0101",  [6]  = "0110",  [7] = "0111",
     [8] = "1000",  [9]  = "1001", [10]  = "1010", [11] = "1011",
    [12] = "1100", [13]  = "1101", [14]  = "1110", [15] = "1111",
}
--
toBinary = function (num, base)
--  base n - number  
    return bin[num]
--
end 
--