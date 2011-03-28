//
//  Fight.h
//  NameFight-dp
//
//  Created by wang zhe on 11-3-12.
//  Copyright 2011 nasawz.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Person.h"

@interface Fight : UIViewController {
    Person * _player1;
    Person * _player2;
    
    NSNumber * blood1;
    NSNumber * blood2;
}

@property (nonatomic, retain) Person * player1;
@property (nonatomic, retain) Person * player2;
@end
