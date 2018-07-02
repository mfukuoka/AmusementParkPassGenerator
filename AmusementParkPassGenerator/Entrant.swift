//
//  Entrant.swift
//  AmusementParkPassGenerator
//
//  Created by thechemist on 6/9/18.
//  Copyright © 2018 mfukuoka. All rights reserved.
//

struct Entrant {
    var type: EntrantType
    var subType: EntrantSubType
    var pass: Pass
    init(type: EntrantType, subType: EntrantSubType, pass: Pass){
        self.type = type
        self.subType = subType
        self.pass = pass
    }
}

enum EntrantType {
    case guest
    case employee
    case vendor
}
enum EntrantSubType {
    case classic
    case vip
    case child
    case foodService
    case rideService
    case maintenance
    case manager
}

enum RequiredInformation {
    case dob
    case firstName
    case lastName
    case streetAddress
    case city
    case state
    case zipCode
    case ssn
    case managementTier
}
enum RegistrationError: Error {
    case dob
    case dobUnderFiveYears
    case firstName
    case lastName
    case streetAddress
    case city
    case state
    case zipCode
    case ssn
    case managementTier
    case subTypeNotFound
}
