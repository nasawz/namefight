//
//  Douji.h
//  NameFight3
//
//  Created by nasa on 11-3-18.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Person;

@interface Douji : NSManagedObject {
@private
}
@property (nonatomic, retain) NSString * usefor;
@property (nonatomic, retain) NSString * formatstr;
@property (nonatomic, retain) NSNumber * toplevel;
@property (nonatomic, retain) NSString * property;
@property (nonatomic, retain) NSNumber * sublevel;
@property (nonatomic, retain) NSString * caption;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSSet* members;

@end
