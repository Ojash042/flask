let id = (window.location.href).split('/').at(-1)
let container = document.getElementById("film-container")
let label_container = document.getElementById('label-container')
let url = "http://localhost:5000/this_movie_data/"+id
console.log(url)
fetch(url).then((response)=>{
    return response.json();
}).then((myjson)=>{
    const img = document.createElement("img")
    img.setAttribute("src",myjson["Poster"])
    img.style.height = "400px"
    container.appendChild(img)
    delete myjson["Poster"]
    for(i in myjson){
        const label = document.createElement("label")
        const textNode = document.createTextNode(`${i}: ${myjson[i]}`)
        label.appendChild(textNode)
        label_container.appendChild(label)
        container.appendChild(label_container)
    }
})