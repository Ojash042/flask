fetch('http://localhost:5000/movie_data').then((response) =>{
        return response.json();
    }).then((myJson) => {
        current_films = myJson["current"]
        upcoming_films = myJson["upcoming"]
        for (i in myJson){
            for (j in myJson[i]){
                const films = document.createElement("img")
                const link  = document.createElement("a")
                let poster =  myJson[i][j].at(-1)
                console.log(poster)
                films.setAttribute("src",poster)
                link.href = `films/${myJson[i][j].at(0)}`
                link.appendChild(films)
                let x = (document.getElementById(`${i}-films-container`))
                x.appendChild(link)
            }
        }
    })