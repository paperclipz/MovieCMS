//
//  LangManager.swift
//  MovieCMS
//
//  Created by Paperclipz on 6/3/15.
//  Copyright (c) 2015 AppDesignStudio. All rights reserved.
//

import UIKit
class LangManager: NSObject {
   
    var languageSelected:Int = 0;
    
   internal func languageSelectedStringForKey(key:String)->String
    {
        
        var path:String?
        switch languageSelected
        {
            case 3:
                path = NSBundle.mainBundle().pathForResource("zh", ofType:"lproj");
            case 2:
                path = NSBundle.mainBundle().pathForResource("ms", ofType:"lproj");
            case 1://ENGLISH
                fallthrough
            default:
                path = NSBundle.mainBundle().pathForResource("en-US", ofType:"lproj");
        }
        
//        NSBundle* languageBundle = [NSBundle bundleWithPath:path];
//        NSString* str=[languageBundle localizedStringForKey:key value:@"" table:nil];
    
//        let dict = NSDictionary(contentsOfFile: path!)
//        let str:String = dict!.objectForKey("key")! as! String
        
        var myDict: NSDictionary?
        if let path = NSBundle.mainBundle().pathForResource("zh", ofType: "lproj") {
            println(path);
            myDict = NSDictionary(contentsOfFile: path)
        }
        if let dict = myDict {
            dict.objectForKey(key)
            // Use your dict here
        }
        return ""
    }
    
//    -(NSString*) languageSelectedStringForKey:(NSString*) key
//    {
//    
//    NSString *path;
//    switch (_lang) {
//    case ENGLISH:
//    path = [[NSBundle mainBundle] pathForResource:@"en-US" ofType:@"lproj"];
//    
//    break;
//    
//    case MALAY:
//    path = [[NSBundle mainBundle] pathForResource:@"ms" ofType:@"lproj"];
//    
//    break;
//    case CHINESE:
//    path = [[NSBundle mainBundle] pathForResource:@"zh" ofType:@"lproj"];
//    
//    break;
//    
//    
//    
//    default:
//    break;
//    }
//    NSBundle* languageBundle = [NSBundle bundleWithPath:path];
//    NSString* str=[languageBundle localizedStringForKey:key value:@"" table:nil];
//    
//    return str;
//    }

}
