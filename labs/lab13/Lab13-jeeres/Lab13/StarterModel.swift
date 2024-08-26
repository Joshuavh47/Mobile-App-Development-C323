// C323 Mobile App Development - Mitja Hmeljak Spring 2024
//
//  starter code for Homework 01
//

import Foundation

extension String {
    subscript(i: Int) -> String {
        return String(self[index(startIndex, offsetBy: i)])
    }
}



class ThreeLettersModel: Codable  {
    
    var allTimeScore: Int?
    
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.allTimeScore, forKey: .allTimeScore)
        
    }
    
    enum CodingKeys: CodingKey {
        case allTimeScore
        
    }
    init(){
        
    }
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.allTimeScore = try container.decodeIfPresent(Int.self, forKey: .allTimeScore)
        
    }
    
    
    let filePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("ThreeLettersModel.json")
    
    func saveGame() {
        let encoder = JSONEncoder()
        guard let filePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("ThreeLettersModel.json") else {
            print("Error: Cannot find the document directory.")
            return
        }
        
        if let encoded = try? encoder.encode(self) {
            do {
                try encoded.write(to: filePath)
                print("Game saved successfully.")
            } catch {
                print("Error: Could not save the game - \(error)")
            }
        }
    }


    func loadGame() -> ThreeLettersModel? {
        guard let filePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("ThreeLettersModel.json") else {
            print("Error: Cannot find the document directory.")
            return nil
        }
        
        if let data = try? Data(contentsOf: filePath) {
            do {
                let loadedGame = try JSONDecoder().decode(ThreeLettersModel.self, from: data)
                return loadedGame
            } catch {
                print("Error: Could not load the game - \(error)")
            }
        }
        return nil
    }
    
    var fastestGame:Int?
    var attemptsThisGame:Int = 0
    var lCurrentWordIndex:Int?
    var correctLastAttempt:Int = 0
    
    // provided 3-letter English words,
    //    starting with 'a' to 'm':
    let words = ["abs", "ace", "act", "add", "ads", "age", "ago", "aid", "all", "and",
                 "app", "arc", "ate", "awe", "ban", "bar", "bat", "bay", "bee", "bet",
                 "bid", "big", "bit", "boa", "bog", "boo", "bop", "bot", "bow", "box",
                 "boy", "bro", "bud", "bum", "bun", "bus", "but", "buy", "bye", "cab",
                 "can", "cap", "car", "cat", "dad", "did", "dig", "dip", "doe", "dot",
                 "dub", "dud", "dye", "ear", "eat", "eel", "egg", "ego", "emu", "end",
                 "err", "eve", "eye", "fat", "fax", "fee", "fit", "fix", "foe", "fog",
                 "fox", "fur", "gag", "gap", "gas", "gem", "gig", "gin", "git", "goo",
                 "gum", "gut", "ham", "hay", "hem", "hen", "her", "him", "his", "hot",
                 "how", "hue", "hug", "hum", "hut", "ion", "irk", "ivy", "jab", "jag",
                 "jam", "jar", "jaw", "jet", "jig", "jog", "kid", "kin", "kip", "kit",
                 "koi", "lab", "lad", "lax", "lay", "leg", "let", "lid", "lip", "lot",
                 "low", "lur", "map", "mar", "mat", "maw", "max", "may", "met", "mix",
                 "mob", "mom", "mop", "mud", "mug", "mum", "new", "net", "nap", "not",
                 "why", "zoo", "out", "old", "zap", "win", "wet", "war", "vet", "van",
                 "way", "wig", "was", "nod", "zip", "oar"]
    
    
    // TODO: add at least 20 more 3-letter English words,
    //    starting with 'n' to 'z',
    //    to make the game more complete.

    // TODO: state variables,
    //     e.g. to keep track of the number of attempts in the fastest game so far,
    //     the number of guesses in the current game,
    //     the current word to be guessed, etc.
    var gameIsOn = false
    var fastestGameSoFar = Int.max

    // TODO: implement startGame() method:
    func startGame() {
        lCurrentWordIndex = Int.random(in: 0..<self.words.count)
        attemptsThisGame = 0
        gameIsOn = true
    }

    // TODO: implement stopGame() method:
    func stopGame() {
        self.gameIsOn = false
    }

    // TODO: implement processGuess() method:
    func processGuess(pGuess: String ) -> [Bool] {
        correctLastAttempt = 0
        attemptsThisGame += 1
        var lGuessed: [Bool] = [false,false,false]

        if(pGuess[0] == words[lCurrentWordIndex!][0]){
            lGuessed[0] = true
            correctLastAttempt += 1
        }
        if(pGuess[1] == words[lCurrentWordIndex!][1]){
            lGuessed[1] = true
            correctLastAttempt += 1
        }
        if(pGuess[2] == words[lCurrentWordIndex!][2]){
            lGuessed[2] = true
            correctLastAttempt += 1
        }
        if(lGuessed[0] == true && lGuessed[1] == true && lGuessed[2] == true){
            if(attemptsThisGame < fastestGameSoFar){
                fastestGameSoFar = attemptsThisGame
            }
        }
        
        return lGuessed

    } // isTheGuess


    
} // end of class ThreeLettersModel
