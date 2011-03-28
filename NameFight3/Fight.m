//
//  Fight.m
//  NameFight-dp
//
//  Created by wang zhe on 11-3-12.
//  Copyright 2011 nasawz.com. All rights reserved.
//

#import "Fight.h"
#import "AppDelegate.h"

#import "Person.h"

@interface Fight (Private)
- (Person *)getPersonWithPerson:(Person *)person;
- (int)person:(Person *)p1 
    hitPerson:(Person *)p2 
  tragerBlood:(int)blood 
        p1dex:(int)p1Dex 
        p2dex:(int)p2Dex;
@end

@implementation Fight
@synthesize player1 = _player1;
@synthesize player2 = _player2;

NSTimer *timer;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
		self.title = @"Fight";
		self.tabBarItem = [[[UITabBarItem alloc] initWithTitle:@"Fight" image:nil tag:0] autorelease];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
	[self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"bg.png"]]];
    
    self.player1 = [self getPersonWithPerson:nil];
    
    self.player2 = [self getPersonWithPerson:self.player1];
    
    NSLog(@"%@ vs %@",[self.player1 name],[self.player2 name]);
    
    NSLog(@"%@ vs %@",[self.player1 vit],[self.player2 vit]);
    
    blood1 = ([self.player1.vit intValue] * 30);
    blood2 = ([self.player2.vit intValue] * 30);
    agi1 = [self.player1.agi intValue];
    agi2 = [self.player2.agi intValue];
    dex1 = [self.player1.dex intValue];
    dex2 = [self.player2.dex intValue];
    act1 = [self.player1.act intValue];
    act2 = [self.player2.act intValue];
    
    

    
    timer = [NSTimer scheduledTimerWithTimeInterval: 0.09
                                             target: self
                                           selector:@selector(onTimer:)
                                           userInfo: nil repeats:YES];
    
    /*
    [self.player1 setValue:[NSNumber numberWithInt:100] forKey:@"win"]; 
    //[[delegate managedObjectContext] updatedObjects];
    NSError * error3;
	if (![[delegate managedObjectContext] save:&error]) {
		NSLog(@"Error %@",[error3 localizedDescription]);
	}
    */
    
}


- (Person *)getPersonWithPerson:(Person *)person {
    UIApplication *app = [UIApplication sharedApplication];
    AppDelegate * delegate = app.delegate;  
    
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Person" inManagedObjectContext:[delegate managedObjectContext]];
    NSFetchRequest *fetchRequest = [[[NSFetchRequest alloc] init] autorelease];
    [fetchRequest setEntity:entity];
    
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"name" ascending:YES selector:nil];
	NSArray *descriptors = [NSArray arrayWithObject:sortDescriptor];
	[fetchRequest setSortDescriptors:descriptors];
    [sortDescriptor release];
    
    NSError *error = nil;
    NSArray *array = [[delegate managedObjectContext] executeFetchRequest:fetchRequest error:&error];
    if (array != nil){
        int total = [array count];
        if (person==nil) {
            return [array objectAtIndex:rand()%total];
        }else{
            NSMutableArray *newarray = [[NSMutableArray alloc] init];
                for (Person * p in array) {
//                    NSLog(@"p name is %@",[p name]);
                    if (p != person) {
                        [newarray addObject:p];
                    }
                }
            Person * newP= [newarray objectAtIndex:rand()%[newarray count]];
            [newarray release];
            return newP;
        }
    }
    return nil;
}


- (void) onTimer:(NSTimer*)theTimer {
    
    if (agi1>agi2) {
        //1/3机率2出手
        if(rand()%3==0){
            blood1 = [self person:self.player2 hitPerson:self.player1 tragerBlood:blood1 p1dex:dex2 p2dex:dex1];
        }else{
            blood2 = [self person:self.player1 hitPerson:self.player2 tragerBlood:blood2 p1dex:dex1 p2dex:dex2];
        }
    }else{
        //1/3机率1出手
        if(rand()%3==0){
            blood2 = [self person:self.player1 hitPerson:self.player2 tragerBlood:blood2 p1dex:dex1 p2dex:dex2];
        }else{
            blood1 = [self person:self.player2 hitPerson:self.player1 tragerBlood:blood1 p1dex:dex2 p2dex:dex1];
        }
    }
    
    
    if (blood1<0) {
        NSLog(@"%@打败了%@",self.player2.name,self.player1.name);
        [theTimer invalidate];
    }
    
    if (blood2<0) {
        NSLog(@"%@打败了%@",self.player1.name,self.player2.name);
        [theTimer invalidate];
    }
    
    //self.player2.win = 10;
    //[self.player2 setWin:[NSNumber numberWithInt:10]];
}

- (int)person:(Person *)p1 
    hitPerson:(Person *)p2 
  tragerBlood:(int)blood 
        p1dex:(int)p1Dex 
        p2dex:(int)p2Dex{
    //闪避
    BOOL isSan = NO;
    if (p1Dex>p2Dex) {
        //1/5闪避率
        if (rand()%5==0) {
            isSan = YES;
        }
    }else{
        //1/2闪避率
        if (rand()%2 == 0) {
            isSan = YES;
        }
    }
    int hit = 0;
    NSInteger r = rand()%6;
    if (r>4) {
        
        NSLog(@"释放斗技");
        NSArray * doujis = [p1.douji allObjects];
        Douji * douji = [doujis objectAtIndex:rand()%[doujis count]];
        
        if ([[douji usefor] isEqualToString:@"1"]) {
            if ([[douji property] isEqualToString:@"act"]) {
                //斗技攻击
                hit = act1 + [[douji toplevel] intValue] * 15 + [[douji sublevel] intValue] * 5;
                NSLog([douji formatstr],p1.name,p2.name);
            }
           
            //需要临时体
//            if ([[douji property] isEqualToString:@"agi"]) {
//                //降低敏捷
//                agi2 = agi2 - ([[douji toplevel] intValue] * 10 + [[douji sublevel] intValue]);
//                NSLog([douji formatstr],p1.name,p2.name);
//            }
        }else{
        }
        
    }else{
        if (r==0) {
            //重拳
            hit = [p1.act intValue]+10;
            //                NSLog(@"重拳");
            
            NSString * strSanYES = [NSString stringWithFormat:@"%@斜视了一眼，一个跨步就闪了过去。",p2.name];
            NSString * strSanNO = [NSString stringWithFormat:@"%@中招了。费了%d点血。",p2.name,hit];
            
            NSLog(@"%@看准时机狠狠的给了%@一个下抽拳,%@",p1.name,p2.name,isSan?strSanYES:strSanNO);
        }
        if (r==1) {
            //重脚
            hit = [p1.act intValue]+20;
            //                NSLog(@"重脚");
            
            NSString * strSanYES = [NSString stringWithFormat:@"%@斜视了一眼，一个跨步就闪了过去。",p2.name];
            NSString * strSanNO = [NSString stringWithFormat:@"%@中招了。费了%d点血。",p2.name,hit];
            
            NSLog(@"%@看准时机狠狠的给了%@一记重踢,%@",p1.name,p2.name,isSan?strSanYES:strSanNO);
        }
        if (r==2) {
            //轻拳
            hit = [p1.act intValue];
            //                NSLog(@"轻拳");
            
            NSString * strSanYES = [NSString stringWithFormat:@"%@斜视了一眼，一个跨步就闪了过去。",p2.name];
            NSString * strSanNO = [NSString stringWithFormat:@"%@中招了。费了%d点血。",p2.name,hit];
            
            NSLog(@"%@需晃了以下来到了%@的侧面，快速的辟出一记手刀,%@",p1.name,p2.name,isSan?strSanYES:strSanNO);
        }
        if (r==3) {
            //轻脚
            hit = [p1.act intValue]+5;
            //                NSLog(@"轻脚");
            
            NSString * strSanYES = [NSString stringWithFormat:@"%@斜视了一眼，一个跨步就闪了过去。",p2.name];
            NSString * strSanNO = [NSString stringWithFormat:@"%@中招了。费了%d点血。",p2.name,hit];
            
            NSLog(@"%@小步上前，朝着%@踢出一脚,%@",p1.name,p2.name,isSan?strSanYES:strSanNO);
        }
    }
    blood = (blood - hit);
    return blood;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewDidUnload {
    [super viewDidUnload];
}


- (void)dealloc {
    [super dealloc];
}


@end
