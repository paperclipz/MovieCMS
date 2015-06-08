//
//  MenuViewController.m
//  MovieCMS
//
//  Created by Paperclipz on 6/1/15.
//  Copyright (c) 2015 AppDesignStudio. All rights reserved.
//

#import "MenuViewController.h"
#import "MenuTableViewCell.h"

@interface CellObject : NSObject
@property (nonatomic, strong)UIImage* selectedImage;
@property (nonatomic, strong)UIImage* unSelectedImage;
@property (nonatomic, strong)NSString* title;

@end


@implementation CellObject : NSObject


@end

@interface MenuViewController ()

@property(nonatomic,strong)NSMutableArray* arrMenuList;
@end

@implementation MenuViewController
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        [self initSelfView];
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self initSelfView];
}

-(void)initSelfView
{
    
    self.view = [MenuView initializeCustomView];
    self.menuView = (MenuView*)self.view;
    [self.menuView initTableViewDelegate:self];
    [[LanguageManager sharedManager]AddLanguage:self];
    
    __weak typeof (self)weakSelf =self;
    self.languageBlock = ^{
        [weakSelf triggerLanguageChanged];
    };

}
-(void)triggerLanguageChanged
{
    [self.menuView.ibTableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableView Source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.arrMenuList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MenuTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"MenuTableViewCell"]
    ;
    
    UIView *selectionColor = [[UIView alloc] init];
    selectionColor.backgroundColor = [UIColor colorWithRed:(48/255.0) green:(48/255.0) blue:(48/255.0) alpha:1];
    cell.selectedBackgroundView = selectionColor;
    CellObject* cellObj = self.arrMenuList[indexPath.row];
    [cell SelectedView:cellObj.selectedImage UnselectedView:cellObj.unSelectedImage Title:cellObj.title];
    return cell;
}

#pragma mark - UITableView Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
        if(_didSelectMenuAtIndexBlock)
        {
            self.didSelectMenuAtIndexBlock((int)indexPath.row);
        }
    
}

#pragma mark - Declaration
-(NSMutableArray*)arrMenuList
{
    if(!_arrMenuList)
    {
        
        _arrMenuList = [NSMutableArray new];
        CellObject* obj = [CellObject new];
        obj.selectedImage = [UIImage new];
        obj.unSelectedImage = [UIImage new];
        obj.selectedImage = [UIImage imageNamed:@"003_plus_profile_selcted"];
        obj.unSelectedImage = [UIImage imageNamed:@"003_plus_profile_nonselcted.png"];
        obj.title = [Utils isLogin]?@"PROFILE":@"LOGIN";
        
        [_arrMenuList addObject:obj];
        
        CellObject* obj2 = [CellObject new];
        obj2.selectedImage = [UIImage new];
        obj2.unSelectedImage = [UIImage new];
        obj2.selectedImage = [UIImage imageNamed:@"003_plus_qr_selected.png"];
        obj2.unSelectedImage = [UIImage imageNamed:@"003_plus_qr_nonselected.png"];
        obj2.title = @"QR SCANNER";
        
        [_arrMenuList addObject:obj2];
        
        
        CellObject* obj3 = [CellObject new];
        obj3.selectedImage = [UIImage new];
        obj3.unSelectedImage = [UIImage new];
        obj3.selectedImage = [UIImage imageNamed:@"003_plus_setting_selected.png"];
        obj3.unSelectedImage = [UIImage imageNamed:@"003_plus_setting_nonselected.png"];
        obj3.title = @"SETTING";
        
        [_arrMenuList addObject:obj3];
        
    }
    
    
    return _arrMenuList;
}

-(void)menuListDidChangeFromLogin
{
    CellObject* temp = self.arrMenuList[0];
    temp.title = @"PROFILE";
    //[self.arrMenuList replaceObjectAtIndex:0 withObject:temp];
    [self.menuView.ibTableView reloadData];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
