//
//  Pass.swift
//  AmusementParkPassGenerator
//
//  Created by thechemist on 7/1/18.
//  Copyright © 2018 mfukuoka. All rights reserved.
//

import Foundation

enum DiscountAccessType {
    case food
    case merchandise
}
enum RideAccessType {
    case allRides
    case skipLines
}
enum AreaAccessType {
    case amusement
    case kitchen
    case rideControl
    case maintenance
    case office
}
struct Pass {
    var areaAccess: [AreaAccessType]
    var rideAccess: [RideAccessType]?
    var discountAccess: [[DiscountAccessType : Double]]
    init(areaAccess: [AreaAccessType], rideAccess: [RideAccessType]?, discountAccess: [[DiscountAccessType : Double]]){
        self.areaAccess = areaAccess
        self.rideAccess = rideAccess
        self.discountAccess = discountAccess
    }
}
