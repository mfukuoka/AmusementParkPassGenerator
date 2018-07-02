//
//  ViewController.swift
//  AmusementParkPassGenerator
//
//  Created by thechemist on 6/9/18.
//  Copyright © 2018 mfukuoka. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
   
        
        
        //register a entrant
        do {
            let entrant = try AmusementPark.registerEntrant(EntrantType.guest, EntrantSubType.child, requiredInformation: [RequiredInformation.dob : "2016/01/01"])
            print("entrant added")
        }
        catch RegistrationError.dob {
            print("You must provide a date of birth.")
        }
        catch RegistrationError.dobUnderFiveYears {
            print("You must be under 5 years old to be a child guest.")
        }
        catch {
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}




