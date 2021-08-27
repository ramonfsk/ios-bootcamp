//
//  AFile.swift
//  SwiftAccessLevels
//
//  Created by Angela Yu on 14/09/2018.
//  Copyright © 2018 London App Brewery. All rights reserved.
//

import Foundation

class AClass {
    
    //Global variables, also called class properties.
    private var aPrivateProperty = "private property"
    
    fileprivate var aFilePrivateProperty = "fileprivate property"
    
    var anInternalProperty = "internal property"
    
    func methodA () {
        
        let aLocalVariable = "local variable"
        
        //Step 1. Try to print aLocalVariable Here - Possible
        print("\(aLocalVariable) printed from methodA() in AClass")
        
        //Step 3. Try to print aPrivateProperty Here
        print("\(aPrivateProperty) printed from methodA() in AClass")
        
        //Step 6. Try to print aFilePrivateProperty Here
        print("\(aFilePrivateProperty) printed from methodA() in AClass")
        
        //Step 9. Try to print anInternalProperty Here
    }
    
    func methodB () {
        
        //Step 2. Try to print aLocalVariable Here
//        print("\(aLocalVariable) printed from methodB() in AClass")
//        Cannot find 'aPrivateProperty' in scope
        
        //Step 4. Try to print aPrivateProperty Here
        print("\(aFilePrivateProperty) printed from methodB() in AClass")
    }
    
}

class AnotherClassInTheSameFile {
    
    init() {
        
        //Step 5. Try to print aPrivateProperty Here
//        print("\(aPrivateProperty) printed from init() in AnotherClassInTheSameFile")
//        Cannot find 'aPrivateProperty' in scope
        
        //Step 7. Try to print aFilePrivateProperty Here
        print("\(AClass().aFilePrivateProperty) printed from init() in AnotherClassInTheSameFile")
        
    }
}
