fetch('http://localhost:5000/movie_data').then((response) =>{
        return response.json();
    }).then((myJson) => {
        current_films = myJson["current"]
        upcoming_films = myJson["upcoming"]
        for (i in current_films){
            const fig = document.createElement("figure")
            const films = document.createElement("img")
            films.style.height = '300px'
            const link  = document.createElement("a")
            let poster =  current_films[i].at(-1)
            let div  = document.createElement('div')
            div.setAttribute('id','film-data') 
            films.setAttribute("src",poster)
            link.href = `films/${current_films[i].at(0)}`
            link.appendChild(films)
            fig.appendChild(link)
            for (j in current_films[i][5]){
                const linkTime = document.createElement("a")
                const Time = document.createElement("figcaption")
                linkTime.href = `films/${current_films[i].at(0)}/${current_films[i][4][j]}`
                let time = (current_films[i][5][j]).split(' ').at(0) + " " + (current_films[i][5][j]).split(' ').at(-2)
                linkTime.innerHTML = time
                Time.appendChild(linkTime)
                fig.appendChild(Time)
            }

            let x = (document.getElementById(`current-films-container`))
            x.append(fig)
        }
        for (i in upcoming_films){
            const films = document.createElement("img")
            films.style.height = '300px'
            //const link  = document.createElement("a")
            let poster =  upcoming_films[i].at(-1)
            films.setAttribute("src",poster)
            //link.href = `films/${upcoming_films[i].at(0)}`
            //link.appendChild(films)
            let x = (document.getElementById(`upcoming-films-container`))
            x.appendChild(films)
        }
    })