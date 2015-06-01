//
//  MenuView.m
//  MovieCMS
//
//  Created by Paperclipz on 6/1/15.
//  Copyright (c) 2015 AppDesignStudio. All rights reserved.
//

#import "MenuView.h"
#import "MenuTableViewCell.h"
@implementation MenuView


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
+ (id)initializeCustomView
{
    NSString* viewName;
    
    viewName = NSStringFromClass([self class]);

    NSArray *objects = [[NSBundle mainBundle] loadNibNamed:viewName owner:nil options:nil];
    
    for (id currentObject in objects ){
        if ([currentObject isKindOfClass:[self class]])
            NSLog(@"Nib View Added To [%@]", NSStringFromClass([self class]));
        
        [currentObject initSelfView];
        return currentObject;
    }
    NSLog(@"Nib View NOT Added To [%@]", NSStringFromClass([self class]));
    
    return nil;
}

-(void)initSelfView
{
    NSLog(@"MenuView.h initSelfView");
}

-(void)initTableViewDelegate :(id)delegate
{
    self.ibTableView.delegate = delegate;
    self.ibTableView.dataSource = delegate;
    [self.ibTableView registerClass:[MenuTableViewCell class] forCellReuseIdentifier:@"MenuTableViewCell"];
    [self.ibTableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    self.ibTableView.backgroundColor = [UIColor clearColor];


}
@end
