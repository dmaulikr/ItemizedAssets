//
//  SettingsViewController.h
//  ItemizedAssets
//
//  Created by John Lee on 3/22/13.
//  Copyright (c) 2013 John Lee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AssetModel.h"

@interface SettingsViewController : UITableViewController <UITextFieldDelegate, UITextViewDelegate>

@property (strong, nonatomic) AssetModel *am;
@property (weak, nonatomic) IBOutlet UITextField *priceMinField;
@property (weak, nonatomic) IBOutlet UITextField *priceMaxField;
@property (weak, nonatomic) IBOutlet UITextField *sharesField;
@property (weak, nonatomic) IBOutlet UITextField *cashField;
@property (weak, nonatomic) IBOutlet UITextField *debtField;

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string;
- (BOOL)textFieldShouldReturn:(UITextField *)textField;
- (void) fillTextFields;

@end
