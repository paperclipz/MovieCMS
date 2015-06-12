//
//  ConnectionManager.h
//  MovieCMS
//
//  Created by Paperclipz on 6/7/15.
//  Copyright (c) 2015 AppDesignStudio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFHTTPRequestOperationManager.h"

typedef void (^IDBlock)(id object);
typedef void (^IErrorBlock)(id object);

@interface ConnectionManager : NSObject

@property(nonatomic,strong)NSString* serverPath;
@property(nonatomic,strong)NSString* subPath;

+ (id)Instance;
-(void)requestServerWithPost:(bool)isPost requestType:(ServerRequestType)type param:(NSDictionary*)dict completeHandler:(IDBlock)completeBlock errorBlock:(IErrorBlock)error;



@end
