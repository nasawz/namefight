//
//  Doufa.m
//  NameFight3
//
//  Created by nasa on 11-3-18.
//  Copyright (c) 2011年 nasawz.com. All rights reserved.
//

#import "Doufa.h"
#import "Person.h"


@implementation Doufa
@dynamic toplevel;
@dynamic name;
@dynamic sublevel;
@dynamic members;

- (void)addMembersObject:(Person *)value {    
    NSSet *changedObjects = [[NSSet alloc] initWithObjects:&value count:1];
    [self willChangeValueForKey:@"members" withSetMutation:NSKeyValueUnionSetMutation usingObjects:changedObjects];
    [[self primitiveValueForKey:@"members"] addObject:value];
    [self didChangeValueForKey:@"members" withSetMutation:NSKeyValueUnionSetMutation usingObjects:changedObjects];
    [changedObjects release];
}

- (void)removeMembersObject:(Person *)value {
    NSSet *changedObjects = [[NSSet alloc] initWithObjects:&value count:1];
    [self willChangeValueForKey:@"members" withSetMutation:NSKeyValueMinusSetMutation usingObjects:changedObjects];
    [[self primitiveValueForKey:@"members"] removeObject:value];
    [self didChangeValueForKey:@"members" withSetMutation:NSKeyValueMinusSetMutation usingObjects:changedObjects];
    [changedObjects release];
}

- (void)addMembers:(NSSet *)value {    
    [self willChangeValueForKey:@"members" withSetMutation:NSKeyValueUnionSetMutation usingObjects:value];
    [[self primitiveValueForKey:@"members"] unionSet:value];
    [self didChangeValueForKey:@"members" withSetMutation:NSKeyValueUnionSetMutation usingObjects:value];
}

- (void)removeMembers:(NSSet *)value {
    [self willChangeValueForKey:@"members" withSetMutation:NSKeyValueMinusSetMutation usingObjects:value];
    [[self primitiveValueForKey:@"members"] minusSet:value];
    [self didChangeValueForKey:@"members" withSetMutation:NSKeyValueMinusSetMutation usingObjects:value];
}


@end
