//: Playground - noun: a place where people can play

import UIKit



// ######## HELLO WORLD ########

//define string for output

var str_text: String


//set output

str_text = "Hello World"


//print output

print("The first words in swift 2: \(str_text)")



// ######## TUPLE ########

//define tuple

let statusMessage = (statusCode: 403, statusText: "error - not found")


//print tuple items

print("status message: \(statusMessage.statusText) - Code \(statusMessage.statusCode)")



// ######## DOOR ACCESS ########

//define door

var doorState = false
var doorAttempts = UInt8()
doorAttempts = 0


//defince code

let accessCode = 5806
var receivedCode:Int


//define emergency

let emergencyCall = (emergencyMessage: "access denied. security alarmed", emergencyNumber: 6667)
var emergencyTrigger = false
var cameraState = false


//enter code

receivedCode = 5807 //<<<<<< RECEIVE USER INPUT


//compare code and open door if equal


if accessCode == receivedCode {
    
    doorState = true
    print("door open")
    
} else {
    
    doorAttempts = doorAttempts + 1
    
    if doorAttempts >= 3 {
        
        emergencyTrigger = true
        cameraState = true
        print("alert: \(emergencyCall.emergencyMessage) - call \(String(emergencyCall.emergencyNumber))") //<<<<<< OUTPUT
        
    }
    
}
