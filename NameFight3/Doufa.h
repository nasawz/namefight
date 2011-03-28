//
//  Doufa.h
//  NameFight3
//
//  Created by nasa on 11-3-18.
//  Copyright (c) 2011年 nasawz.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Person;

@interface Doufa : NSManagedObject {
@private
}
@property (nonatomic, retain) NSNumber * toplevel;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSNumber * sublevel;
@property (nonatomic, retain) NSSet* members;

@end
