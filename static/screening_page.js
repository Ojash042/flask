seats = window.location.href.split("/").at(-1)
console.log(seats)
url = "http://localhost:5000/api/seats/"+seats
fetch(url).then((response) =>{
        return response.json();
    }).then((myJson)=>{
    console.log(myJson)
    let date =(myJson[1]).split(' ')
    date = date[0]+(date[4])
    forms  = document.getElementById('seats')
    const screening = document.createElement('input')
    screening.setAttribute("type","hidden")
    screening.value = seats.toString()
    screening.name = "screening_id"
    const theatre_id = document.createElement("input")
    theatre_id.setAttribute("type","hidden")
    theatre_id.value = (myJson[2]).toString()
    theatre_id.name = "theatre_id"
    forms.appendChild(theatre_id)
    forms.appendChild(screening)
    let cnt= 0
    for (i in myJson[3]){
        label = document.createElement('label')
        const div = document.createElement('div')
        label.innerHTML = i
        div.appendChild(label)
        for (j=0;j<(myJson[3][i]);j++){
            cnt++;
            let checkbox = document.createElement("input")
            checkbox.setAttribute("type","checkbox")
            checkbox.setAttribute("id",`"seat-id-${myJson[2]*100+cnt}"`)
            checkbox.name = "seats"
            checkbox.value = i+(j+1)
            const label_seat = document.createElement('label');
            const span = document.createElement('span')
            span.innerHTML = j+1
            label_seat.appendChild(checkbox)
            label_seat.appendChild(span)
            div.appendChild(label_seat) 
            
        }
        forms.appendChild(div)
    }
})