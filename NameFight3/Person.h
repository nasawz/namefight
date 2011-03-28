//
//  Person.h
//  NameFight3
//
//  Created by nasa on 11-3-18.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Doufa, Douji;

@interface Person : NSManagedObject {
@private
}
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSNumber * dex;
@property (nonatomic, retain) NSNumber * level;
@property (nonatomic, retain) NSNumber * win;
@property (nonatomic, retain) NSNumber * mana;
@property (nonatomic, retain) NSNumber * vit;
@property (nonatomic, retain) NSNumber * lost;
@property (nonatomic, retain) NSNumber * agi;
@property (nonatomic, retain) NSNumber * act;
@property (nonatomic, retain) NSNumber * luck;
@property (nonatomic, retain) NSNumber * score;
@property (nonatomic, retain) NSData * face;
@property (nonatomic, retain) Doufa * doufa;
@property (nonatomic, retain) NSSet* douji;

@end
