//
//  User.swift
//  loginAPP
//
//  Created by Павел Цыганов on 30.10.2021.
//

struct User {
    let login: String
    let password: String
    let person: Person
    
    static func getUser() -> User {
        User (login: "User",
              password: "Password",
              person: Person(name: "Pavel",
                             sureName: "Tsyganov",
                             aboutMe: "it's me",
                             hobby: "my love",
                            meatingOfLife: "my family"))
    }
    
}



struct Person {
    let name: String
    let sureName: String
    let aboutMe: String
    let hobby: String
    let meatingOfLife: String
    var fullName: String {
        "\(name) \(sureName)"
}
}

