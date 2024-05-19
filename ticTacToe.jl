
include("solver/ticTacToeSolver.jl")


function main()

    board = [1 1 1; 0 0 0; 1 0 0]
    turn = 7
    display(board)
    println("turn is ",turn)
    solveBoard(board,turn)
    println("we might have solved it")
    display(board)
    println("turn is ",turn)
end

if abspath(PROGRAM_FILE) == @__FILE__
    main()
end