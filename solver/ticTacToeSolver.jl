
function getStatus(board::Matrix{Int64})
    # if the game is not over: return -1
    # if the game is a draw: return 0
    # if player one wins (x) return 1
    # if player 2 wins (O) return 2
    for i = 1:3
        k = -1
        for j = 1:3
            if k == -1
                k = board[i,j]

            elseif board[i,j] ≠ k
                k = 0
            end
            println("i is $i; j is $j")
        end
    end
    return 0
end


function solveBoard(board::Matrix{Int64},turn = UInt8(1))
    # base case
    gameStatus = getStatus(board)

    gameStatus > -1 ? gameStatus > 0 ? gameStatus > 1 ? (return 2) : (return 1) : (return 0) : ()
    # recursive case
    drawingMoveFound = false
    for i = 1:3
        for j = 1:3
            if board[i,j] == 0
                board[i,j] = turn
                winner = solveBoard(board,turn⊻0x3) # recursive function call
                board[i,j] = 0
                if winner == turn
                    return winner
                elseif winner == 0
                    drawingMoveFound = true
                end
            end
        end
    end
    drawingMoveFound ? (return 0) : (return turn⊻0x3) 

end

# function main()
#     println("hi")
# end


# if abspath(PROGRAM_FILE) == @__FILE__
#     main()
# end