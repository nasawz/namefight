//
//  NSString+MD5.m
//  NameFight-dp
//
//  Created by nasa on 11-3-16.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <CommonCrypto/CommonDigest.h>

@implementation NSString (md5)

- (NSString *) MD5 
{
    const char *cStr = [self UTF8String];
    unsigned char result[16];
    CC_MD5( cStr, strlen(cStr), result );
    //NSLog(@"%d",abs([[NSNumber numberWithChar:result[0]] intValue]));
    return [NSString stringWithFormat:
            @"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",
            result[0], result[1], result[2], result[3], 
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ];  
}
- (NSArray *) MD5Arr {
    const char *cStr = [self UTF8String];
    unsigned char result[16];
    CC_MD5( cStr, strlen(cStr), result );
    return [NSArray arrayWithObjects:
            [NSNumber numberWithInt:abs([[NSNumber numberWithChar:result[0]] intValue])],
            [NSNumber numberWithInt:abs([[NSNumber numberWithChar:result[1]] intValue])],
            [NSNumber numberWithInt:abs([[NSNumber numberWithChar:result[2]] intValue])],
            [NSNumber numberWithInt:abs([[NSNumber numberWithChar:result[3]] intValue])],
            [NSNumber numberWithInt:abs([[NSNumber numberWithChar:result[4]] intValue])],
            [NSNumber numberWithInt:abs([[NSNumber numberWithChar:result[5]] intValue])],
            [NSNumber numberWithInt:abs([[NSNumber numberWithChar:result[6]] intValue])],
            [NSNumber numberWithInt:abs([[NSNumber numberWithChar:result[7]] intValue])],
            [NSNumber numberWithInt:abs([[NSNumber numberWithChar:result[8]] intValue])],
            [NSNumber numberWithInt:abs([[NSNumber numberWithChar:result[9]] intValue])],
            [NSNumber numberWithInt:abs([[NSNumber numberWithChar:result[10]] intValue])],
            [NSNumber numberWithInt:abs([[NSNumber numberWithChar:result[11]] intValue])],
            [NSNumber numberWithInt:abs([[NSNumber numberWithChar:result[12]] intValue])],
            [NSNumber numberWithInt:abs([[NSNumber numberWithChar:result[13]] intValue])],
            [NSNumber numberWithInt:abs([[NSNumber numberWithChar:result[14]] intValue])],
            [NSNumber numberWithInt:abs([[NSNumber numberWithChar:result[15]] intValue])],nil];
}
@end
