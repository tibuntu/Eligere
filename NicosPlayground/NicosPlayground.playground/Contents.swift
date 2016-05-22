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


// ######## START CAR ########

func startCar(keyState:Bool, carDoorState:Bool) throws {
    
    if keyState == true && carDoorState == true {
        
        print("engine starts")
        return
        
    }
    
}

do {
    
    try startCar(true, carDoorState: true)
    print("car starts")
    
}


// ######## OPTIONAL VARIABLES ########

var a:Int?

a = 1

a != nil ? a! : 3


// ######## RANGE OPERATOR ########

var begin = 4
var ende = 8

for index in begin...ende {
    
    index
    
}


// ######## STRING HANDLE ########

var text = "Hello"

print(text[text.startIndex.advancedBy(3).successor()])


for index in text.characters.indices {
    
    print(text[index], terminator: "")
    
}


text.insertContentsOf(" there".characters, at: text.endIndex)

text.removeAtIndex(text.endIndex.advancedBy(-6))

print(text)


text.removeRange(text.endIndex.advancedBy(-5)..<text.endIndex)

print(text.endIndex)

text.insertContentsOf(" in the morning".characters, at: text.endIndex)


// ######## COLLECTIONS ########


//arrays

var list = [String]()

list.append("Joe")
list.append("Lisa")
list.append("Marry")

for index in list.startIndex..<list.endIndex {
    
    print(list[index])
    
}


var list2 = [String](count: 3, repeatedValue: "Harry")

var list3 = [String](count: 3, repeatedValue: "Kim")

list2 += list3





