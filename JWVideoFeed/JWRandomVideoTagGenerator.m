//
//  JWRandomVideoTagGenerator.m
//  JWVideoFeed
//
//  Created by Karim Mourra on 11/25/15.
//  Copyright © 2015 Karim Mourra. All rights reserved.
//

#import "JWRandomVideoTagGenerator.h"
#import <stdlib.h>

#define Big_Buck_Bunny @"http://content.bitsontherun.com/videos/bkaovAYt-52qL9xLP.mp4"
#define Sintel @"http://content.bitsontherun.com/videos/3XnJSIm4-injeKYZS.mp4"
#define Oceans @"http://playertest.longtailvideo.com/adaptive/oceans/oceans.m3u8"
#define Elephant_Dream @"http://wowzaec2demo.streamlock.net/vod-multitrack/_definst_/smil:ElephantsDream/ElephantsDream.smil/playlist.m3u8"

@implementation JWRandomVideoTagGenerator

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.videoTags = @[Big_Buck_Bunny, Sintel, Oceans, Elephant_Dream];
    }
    return self;
}

- (NSString *)randomVideoTag
{
    int randomIndex = arc4random_uniform((uint32_t)self.videoTags.count);
    return [self.videoTags objectAtIndex:randomIndex];
}

@end
