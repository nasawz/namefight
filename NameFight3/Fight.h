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
    
    int blood1;
    int blood2;
    int dex1;
    int dex2;
    int agi1;
    int agi2;
    int act1;
    int act2;
}

@property (nonatomic, retain) Person * player1;
@property (nonatomic, retain) Person * player2;
@end
