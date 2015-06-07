//
//  ConnectionManager.h
//  MovieCMS
//
//  Created by Paperclipz on 6/7/15.
//  Copyright (c) 2015 AppDesignStudio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MKNetworkEngine.h"
typedef void (^IDBlock)(id object);

@interface ConnectionManager : MKNetworkEngine
- (MKNetworkOperation*)requestServerWithPost:(BOOL)isPost requestType:(ServerRequestType)serverRequestType requestJsonString:(NSString*)jsonString completionHandler:(IDBlock)completionBlock errorHandler:(MKNKErrorBlock)errorBlock;
@property(strong, nonatomic)NSString* fullURLPath;
@end
