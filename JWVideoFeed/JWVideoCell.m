//
//  JWVideoCell.m
//  JWVideoFeed
//
//  Created by Karim Mourra on 11/24/15.
//  Copyright © 2015 Karim Mourra. All rights reserved.
//

#import "JWVideoCell.h"

#define Bip_Bop @"http://playertest.longtailvideo.com/adaptive/bipbop/gear4/prog_index.m3u8"

@implementation JWVideoCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView.layer setBorderColor:[UIColor blackColor].CGColor];
        [self.contentView.layer setBorderWidth:1.0f];
        self.videoNumber = [[UILabel alloc]initWithFrame:CGRectMake(2, 0, self.contentView.frame.size.width, 30)];
        [self.contentView addSubview:self.videoNumber];
        self.player = [self createPlayer];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (JWPlayerController *)createPlayer
{
    JWConfig* config = [[JWConfig alloc]initWithContentUrl:Bip_Bop];
    config.size = CGSizeMake(self.contentView.frame.size.width - 30, self.contentView.frame.size.width - 30);
    
    JWPlayerController *player = [[JWPlayerController alloc]initWithConfig:config];
    player.forceLandscapeOnFullScreen = NO;
    player.forceFullScreenOnLandscape = NO;
    return player;
}

@end
