//
//  Person.m
//  NameFight3
//
//  Created by nasa on 11-3-18.
//  Copyright (c) 2011年 nasawz.com. All rights reserved.
//

#import "Person.h"
#import "Doufa.h"
#import "Douji.h"


@implementation Person
@dynamic name;
@dynamic dex;
@dynamic level;
@dynamic win;
@dynamic mana;
@dynamic vit;
@dynamic lost;
@dynamic agi;
@dynamic act;
@dynamic luck;
@dynamic score;
@dynamic face;
@dynamic doufa;
@dynamic douji;


- (void)addDoujiObject:(Douji *)value {    
    NSSet *changedObjects = [[NSSet alloc] initWithObjects:&value count:1];
    [self willChangeValueForKey:@"douji" withSetMutation:NSKeyValueUnionSetMutation usingObjects:changedObjects];
    [[self primitiveValueForKey:@"douji"] addObject:value];
    [self didChangeValueForKey:@"douji" withSetMutation:NSKeyValueUnionSetMutation usingObjects:changedObjects];
    [changedObjects release];
}

- (void)removeDoujiObject:(Douji *)value {
    NSSet *changedObjects = [[NSSet alloc] initWithObjects:&value count:1];
    [self willChangeValueForKey:@"douji" withSetMutation:NSKeyValueMinusSetMutation usingObjects:changedObjects];
    [[self primitiveValueForKey:@"douji"] removeObject:value];
    [self didChangeValueForKey:@"douji" withSetMutation:NSKeyValueMinusSetMutation usingObjects:changedObjects];
    [changedObjects release];
}

- (void)addDouji:(NSSet *)value {    
    [self willChangeValueForKey:@"douji" withSetMutation:NSKeyValueUnionSetMutation usingObjects:value];
    [[self primitiveValueForKey:@"douji"] unionSet:value];
    [self didChangeValueForKey:@"douji" withSetMutation:NSKeyValueUnionSetMutation usingObjects:value];
}

- (void)removeDouji:(NSSet *)value {
    [self willChangeValueForKey:@"douji" withSetMutation:NSKeyValueMinusSetMutation usingObjects:value];
    [[self primitiveValueForKey:@"douji"] minusSet:value];
    [self didChangeValueForKey:@"douji" withSetMutation:NSKeyValueMinusSetMutation usingObjects:value];
}


@end
