//import UIKit

var ans = "dog"
var amt = 0
print("Welcome to the animal guessing game!")

while(true){
    print("Guess an animal: ")
    let guess=readLine()
    amt+=1
    if(ans != guess){
        print("Incorrect! I was not thinking of \(String(describing: guess ?? "")).")
    }
    else{
        break
    }
    
}
print("You guessed correctly!")
print("It took \(amt) guesses.")


