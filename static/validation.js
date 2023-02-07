var set_invalid = Array(5).fill(true)

document.forms[0].addEventListener("input", e =>{
        console.log (set_invalid)
    let regex = [/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,5})+$/,
        /^9([0-9]{9})$/gi,
        /^(((?=.*[a-z])(?=.*[A-Z]))|((?=.*[a-z])(?=.*[0-9]))|((?=.*[A-Z])(?=.*[0-9])))(?=.{6,})/
    ]
    let elementIndex = ["email",'contact','password','confirmPassword']
    elementID = e.target.id
    if(elementIndex.includes(elementID)){
        element = document.getElementById(elementID)
        if (!regex[Math.min(elementIndex.indexOf(elementID),regex.length-1)].test(e.target.value)){
            element.classList.add("error")
            set_invalid[elementIndex.indexOf(elementID)] = true
        }
        else{
            element.classList.remove("error")
            set_invalid[elementIndex.indexOf(elementID)] = false
        }
    }

    if (document.getElementById("password").value === document.getElementById("confirmPassword").value){
            set_invalid[set_invalid.length-1] = false
    }
    else{
        set_invalid[set_invalid.length-1] = true
    }
    console.log(set_invalid.every(val=>val===false))
})

function validate(){

    return (set_invalid.every(val=>val===false))
}

eye.addEventListener("click", (e)=>{
    const type = document.getElementById("password").getAttribute("type") === "password"? "text":"password"
    document.getElementById("password").setAttribute("type",type)
    document.getElementById("confirmPassword").setAttribute("type",type)
})