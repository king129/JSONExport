//
//  PropertyPresenter.swift
//  JSONExport
//
//  Created by Ahmed on 11/2/14.
//  Copyright (c) 2014 Ahmed Ali. Eng.Ahmed.Ali.Awad@gmail.com.
//
//  Redistribution and use in source and binary forms, with or without
//  modification, are permitted provided that the following conditions
//  are met:
//
//  1. Redistributions of source code must retain the above copyright
//  notice, this list of conditions and the following disclaimer.
//  2. Redistributions in binary form must reproduce the above copyright
//  notice, this list of conditions and the following disclaimer in the
//  documentation and/or other materials provided with the distribution.
//  3. The name of the contributor can not be used to endorse or promote products derived from this software
//  without specific prior written permission.
//
//  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
//  "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
//  LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
//  FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL
//  THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT,
//  INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
//  (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
//   SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
//  HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT,
//  STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
//  ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED
//  OF THE POSSIBILITY OF SUCH DAMAGE.

import Foundation

/**
Represents all the meta data needed to export a JSON property in a valid syntax for the target language
*/
class Property{
    
    /**
    The native name that is suitable to export the JSON property in the target language
    */
    var nativeName : String
    
    /**
    The JSON property name to fetch the value of this property from a JSON object
    */
    var jsonName : String
    
    /**
    The string representation for the property type
    */
    var type : String
    
    /**
    Whether the property represents a custom type
    */
    var isCustomClass : Bool
    
    /**
    Whether the property represents an array
    */
    var isArray : Bool
    
    /**
    The target language model
    */
    var lang : LangModel
    
    /**
    Returns a valid property declaration using the LangModel.instanceVarDefinition value
    */
    var toString: String{
        var string = lang.instanceVarDefinition.stringByReplacingOccurrencesOfString(varName, withString: nativeName);
        string = string.stringByReplacingOccurrencesOfString(varType, withString: type)
        
        return string
    }
    
    /** 
    The designated initializer for the class
    */
    init(jsonName: String, nativeName: String, type: String, isArray: Bool, isCustomClass: Bool, lang: LangModel)
    {
        self.jsonName = jsonName
        self.nativeName = nativeName
        self.type = type
        self.isArray = isArray
        self.isCustomClass = isCustomClass
        self.lang = lang
    }
    
    
    /**
    Convenience initializer which calls the designated initializer with isArray = false and isCustomClass = false
    */
    convenience init(jsonName: String, nativeName: String, type: String, lang: LangModel){
        self.init(jsonName: jsonName, nativeName: nativeName, type: type, isArray: false, isCustomClass: false, lang: lang)
    }
    
    
}