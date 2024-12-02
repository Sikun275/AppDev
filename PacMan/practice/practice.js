document.addEventListener('DOMContentLoaded', function(){
    console.log("HIHI")

    const grid = document.querySelector('.grid')

    const layout= [
        1,0,1,0,1,0,1,0,1,0,
        0,1,0,1,0,1,0,1,0,1,
        1,0,1,0,1,0,1,0,1,0,
        0,1,0,1,0,1,0,1,0,1,
        1,0,1,0,1,0,1,0,1,0,
        0,1,0,1,0,1,0,1,0,1,
        1,0,1,0,1,0,1,0,1,0,
        0,1,0,1,0,1,0,1,0,1,
        1,0,1,0,1,0,1,0,1,0,
        0,1,0,1,0,1,0,1,0,1
    ]

    const squares = []

    function createSubSqare(){
        for(let i = 0; i < layout.length; i ++){
            const subSqare = document.createElement('div')
            grid.appendChild(subSqare)
            squares.push(subSqare)
            
            if (layout[i] === 1){
                squares.classList.add('.blk')
            }
            if (layout[i] === 0){
                squares.classList.add('.red')
            }
        }
    }
    createSubSqare()





})