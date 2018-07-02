//
//  AmusementPark.swift
//  AmusementParkPassGenerator
//
//  Created by thechemist on 6/22/18.
//  Copyright © 2018 mfukuoka. All rights reserved.
//

import Foundation

struct AmusementPark {

    //register an entrant
    static func registerEntrant(_ type: EntrantType, _ subType: EntrantSubType, requiredInformation: [RequiredInformation : Any]) throws -> Entrant{
        var pass = Pass(areaAccess: [.amusement], rideAccess: nil, discountAccess: []) //everyabody getta ride a ride
        
        //type is a guest
        if type == .guest {
            
            //classic guest
            if subType == .classic {
                pass.rideAccess = [.allRides]
            }
            
            //vip guest
            if subType == .vip {
                
                pass.rideAccess = [.allRides, .skipLines]
                pass.discountAccess = [[.food : 10.0],[.merchandise : 25.0 ]]
            }
            
            //child guest
            if subType == .child {
                //check if a dob was given
                guard let dob = requiredInformation[.dob] as? String else {
                    throw RegistrationError.dob
                }
                //attempt to format the date
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "yyyy-MM-dd"
                if let dobDate = dateFormatter.date(from: dob) {
                    let calendar: NSCalendar! = NSCalendar(calendarIdentifier: .gregorian)
                    let now = Date()
                    let calcAge = calendar.components(.year, from: dobDate, to: now, options: [])
                    if let age = calcAge.year {
                        if age <= 5 {
                            pass.rideAccess = [.allRides]
                        }
                        else{
                            throw RegistrationError.dobUnderFiveYears
                        }
                    }
                    else {
                        throw RegistrationError.dob
                    }
                }
                else {
                    throw RegistrationError.dob
                }
            }
            else {
                throw RegistrationError.subTypeNotFound
            }
        }
        //type is an employee
        if type == .employee {
            
            guard let dob = requiredInformation[.dob] as? String else {
                throw RegistrationError.dob
            }
            guard let firstName = requiredInformation[.firstName] as? String else {
                throw RegistrationError.firstName
            }
            guard let lastName = requiredInformation[.lastName] as? String else {
                throw RegistrationError.lastName
            }
            guard let streetAddress = requiredInformation[.streetAddress] as? String else {
                throw RegistrationError.streetAddress
            }
            guard let city = requiredInformation[.city] as? String else {
                throw RegistrationError.city
            }
            guard let state = requiredInformation[.state] as? String else {
                throw RegistrationError.state
            }
            guard let zipCode = requiredInformation[.zipCode] as? String else {
                throw RegistrationError.zipCode
            }
            guard let ssn = requiredInformation[.ssn] as? String else {
                throw RegistrationError.ssn
            }

            
            if subType == .foodService {
                pass.areaAccess.append(.kitchen)
                pass.rideAccess = [.allRides]
                pass.discountAccess = [[.food : 15.0],[.merchandise : 25.0 ]]
            }
            if subType == .rideService {
                pass.areaAccess.append(.rideControl)
                pass.rideAccess = [.allRides]
                pass.discountAccess = [[.food : 15.0],[.merchandise : 25.0 ]]
            }
            if subType == .maintenance {
                pass.areaAccess.append(.kitchen)
                pass.areaAccess.append(.rideControl)
                pass.areaAccess.append(.maintenance)
                pass.rideAccess = [.allRides]
                pass.discountAccess = [[.food : 15.0],[.merchandise : 25.0 ]]
            }
            if subType == .manager {
                pass.areaAccess.append(.kitchen)
                pass.areaAccess.append(.rideControl)
                pass.areaAccess.append(.maintenance)
                pass.areaAccess.append(.office)
                pass.rideAccess = [.allRides]
                pass.discountAccess = [[.food : 25.0],[.merchandise : 25.0 ]]
                guard let managementTier = requiredInformation[.managementTier] as? String else {
                    throw RegistrationError.managementTier
                }
                
            }
        }
        
        /*if type == .vendor {
            
        }*/
        
        return Entrant(type: type, subType: subType, pass: pass)
    }
 
    static func rideRide(pass: Pass){
        if let pass = pass.rideAccess {
            if pass.count > 0 {
                //can they skip lines?
                for access in pass {
                    if access == .skipLines {
                        print("Entrant goes to front of the line")
                    }
                }
                //can they ride?
                for access in pass {
                    if access == .allRides {
                        print("Entrant rides the ride")
                    }
                }
            }
            else {
                print("Please see Entrant Access Rules")
            }
        }
        else{
            print("Please see Entrant Access Rules")
        }
        
    }
}

