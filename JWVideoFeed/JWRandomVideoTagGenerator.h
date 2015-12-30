//
//  JWRandomVideoTagGenerator.h
//  JWVideoFeed
//
//  Created by Karim Mourra on 11/25/15.
//  Copyright © 2015 Karim Mourra. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JWRandomVideoTagGenerator : NSObject

@property (nonatomic) NSArray *videoTags;

- (NSString *)randomVideoTag;

@end
