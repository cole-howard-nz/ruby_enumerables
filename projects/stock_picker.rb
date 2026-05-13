def stock_picker(prices)
    profit = [0, 0, 0]

    prices.each_with_index { |p1, buy_index|
        prices.each_with_index { |p2, sell_index|
            profit = [p2 - p1, buy_index, sell_index] if p2 - p1 > profit[0] && buy_index < sell_index
        }
    }

    [profit[1], profit[2]]
end


tests = [
    { input: [17, 3, 6, 9, 15, 8, 6, 1, 10], expected: [1, 4] },
    { input: [1, 5], expected: [0, 1] },
    { input: [10, 5, 3], expected: [0, 0] },
    { input: [5, 3, 1], expected: [0, 0] },
    { input: [1, 2, 3, 4, 5], expected: [0, 4] },
    { input: [3, 1, 4, 1, 5, 9, 2, 6], expected: [1, 5] },
    { input: [2, 1, 4], expected: [1, 2] },
    { input: [10, 1, 5, 3, 8, 2], expected: [1, 4] },
    { input: [1, 9, 2, 8, 3, 7], expected: [0, 1] },
    { input: [5, 1, 6, 2, 7, 3], expected: [1, 4] },
    { input: [4, 1, 2, 3, 8, 5], expected: [1, 4] },
    { input: [6, 1, 3, 2, 9, 4], expected: [1, 4] }
]

tests.each { |test| 
    result = stock_picker(test[:input])
    puts "#{ test[:expected].eql?(result) ? "PASS" : "FAIL" } - #{ result } = #{ test[:expected] }"
}