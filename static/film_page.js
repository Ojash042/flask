let id = (window.location.href).split('/').at(-1)
let container = document.getElementById("film-container")
let url = "http://localhost:5000/this_movie_data/"+id
fetch(url).then((response)=>{
    return response.json();
}).then((myjson)=>{
    const img = document.createElement("img")
    img.setAttribute("src",myjson["Poster"])
    container.appendChild(img)
    console.log(myjson[0])
    delete myjson["Poster"]
    for(i in myjson){
        const label = document.createElement("label")
        const textNode = document.createTextNode(`${i}: ${myjson[i]}`)
        label.appendChild(textNode)
        container.appendChild(label)
    }
})