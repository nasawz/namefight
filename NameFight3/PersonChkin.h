//
//  PersonChkin.h
//  NameFight-dp
//
//  Created by wang zhe on 11-3-13.
//  Copyright 2011 nasawz.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ABContactsHelper.h"

@interface PersonChkin : UIViewController <UITextFieldDelegate,ABPeoplePickerNavigationControllerDelegate>{
    UITextField * nameField;
}

@property (nonatomic, retain) UITextField * nameField;

@end
