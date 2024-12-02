document.addEventListener('DOMContentLoaded', function(){
    console.log("start")

    const scoreDisplay  = document.getElementById('score')
    const width = 28
    let score = 0
    const grid = document.querySelector('.grid')
    

    const layout = [
        //0: pac-dot; 1:wall; 2:ghost; 3:power-pellet; 4:empty
        // 28 elements each row
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1,
        1, 0, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 1,
        1, 3, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 3, 1,
        1, 0, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 1,
        1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1,
        1, 0, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 1,
        1, 0, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 1,
        1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1,
        1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 0, 1, 1, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 1, 1, 0, 1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 0, 1, 1, 4, 1, 1, 1, 2, 2, 1, 1, 1, 4, 1, 1, 0, 1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 0, 1, 1, 4, 1, 2, 2, 2, 2, 2, 2, 1, 4, 1, 1, 0, 1, 1, 1, 1, 1, 1,
        4, 4, 4, 4, 4, 4, 0, 0, 0, 4, 1, 2, 2, 2, 2, 2, 2, 1, 4, 0, 0, 0, 4, 4, 4, 4, 4, 4,
        1, 1, 1, 1, 1, 1, 0, 1, 1, 4, 1, 2, 2, 2, 2, 2, 2, 1, 4, 1, 1, 0, 1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 0, 1, 1, 4, 1, 1, 1, 1, 1, 1, 1, 1, 4, 1, 1, 0, 1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 0, 1, 1, 4, 1, 1, 1, 1, 1, 1, 1, 1, 4, 1, 1, 0, 1, 1, 1, 1, 1, 1,
        1, 0, 0, 0, 0, 0, 0, 0, 0, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 0, 0, 0, 0, 0, 0, 0, 0, 1,
        1, 0, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 1,
        1, 0, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 1,
        1, 3, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 3, 1,
        1, 1, 1, 0, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 0, 1, 1, 1,
        1, 1, 1, 0, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 0, 1, 1, 1,
        1, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 1,
        1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1,
        1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1,
        1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1
    ]


    //create sqaures array
    const squares = []

    //create borad
    function createBorad() {
        for (let i = 0; i < layout.length; i ++){
            const square = document.createElement('div')
            square.id = i
            grid.appendChild(square)
            squares.push(square)

            // add layout based on the type of grid 
            if(layout[i] === 0){
                squares[i].classList.add('pac-dot')
            }
            if(layout[i] === 1){
                squares[i].classList.add('wall')
            }
            if(layout[i] === 2){
                squares[i].classList.add('ghost-lair')
            }
            if(layout[i] === 3){
                squares[i].classList.add('power-pellet')
            }
            

        }
    }
    //console.log("here finish func")
    createBorad()

    console.log(squares)

    // create character
    let pamanCurrIndex = 490
    squares[pamanCurrIndex].classList.add('pac-man')

    // move pac-man 
    function movePacman(e){
        squares[pamanCurrIndex].classList.remove('pac-man')
        switch(e.key){
            case 'ArrowLeft':
                if(pamanCurrIndex % width !== 0 && 
                    !squares[pamanCurrIndex - 1].classList.contains('wall')
                ){
                    pamanCurrIndex -= 1

                }
                if(squares[pamanCurrIndex - 1] === squares[363]){
                    pamanCurrIndex = 391
                }
                break
            case 'ArrowRight':
                if(pamanCurrIndex % width < width - 1 && 
                    !squares[pamanCurrIndex + 1].classList.contains('wall')
                ){
                    pamanCurrIndex += 1
                }
                if(squares[pamanCurrIndex + 1] === squares[392]){
                    pamanCurrIndex = 364
                }
                break
            case 'ArrowUp':
                if(pamanCurrIndex - width >= 0 &&
                    !squares[pamanCurrIndex - width].classList.contains('wall')
                ){
                    pamanCurrIndex -= width
                }
                break
            case 'ArrowDown':
                if (pamanCurrIndex + width <= width * width - 1 &&
                    !squares[pamanCurrIndex + width].classList.contains('wall') &&
                    !squares[pamanCurrIndex + width].classList.contains('ghost-lair')
                ){
                    pamanCurrIndex += width
                }
                break
        }
        squares[pamanCurrIndex].classList.add('pac-man')
        

        // check for win
    

        // check for game over

        // check for power-pellet eaten 
        eatPowerPellet()

        function eatPowerPellet(){
            if(squares[pamanCurrIndex].classList.contains('power-pellet')){
                score += 10
                scoreDisplay.innerHTML = score
                squares[pamanCurrIndex].classList.remove('power-pellet')
            }

        }

        // check for pac-dot eaten
        pacDotEaten()

        function pacDotEaten(){
            if (squares[pamanCurrIndex].classList.contains('pac-dot')){
                score += 1
                scoreDisplay.innerHTML = score
                squares[pamanCurrIndex].classList.remove('pac-dot')
            }
        }

    //Ghost
        // create ghost constructor
        class ghost {
            constructor (className, startIndex, speed){
                this.className = className
                this.startIndex = startIndex
                this.speed = speed
                this.currentIndex = startIndex
                this.isScared = false
                this.timerId = NaN

            }
        }
        // all ghost
        ghosts = [
            new ghost('blinky', 348, 250),
            new ghost('pinky', 376, 400), 
            new ghost('inky', 351, 300),
            new ghost('clyde', 379, 500),
        ]
       
        // draw ghost on the grid
        ghosts.forEach(ghost => {
            squares[ghost.currentIndex].classList.add(ghost.className)
            squares[ghost.currentIndex].classList.add('ghost')
        })

        // move ghosts
        ghosts.forEach(ghost => moveGhost(ghost))

        function moveGhost(ghost){
            console.log(ghost)
            const directions = [-1, 1, -width, width]
            let direction = directions[Math.floor(Math.random() * directions.length)]

            ghost.timerId = setInterval(function() {
                // if next sqaure your ghost is going to go to doen't have a ghost and doesn't have a wall in it
                if(
                    !squares[ghost.currentIndex + direction].classList.contains("ghost") &&
                    !squares[ghost.currentIndex + direction].classList.contains("wall")
                ){ 
                    squares[ghost.currentIndex].classList.remove(ghost.className, 'ghost')
                    ghost.currentIndex += direction
                    squares[ghost.currentIndex].classList.add(ghost.className, 'ghost')
                }else direction = directions[Math.floor(Math.random() * directions.length)]
            }, ghost.speed)



        }
        





    }
    document.addEventListener('keyup', movePacman)
})