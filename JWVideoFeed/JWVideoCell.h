//
//  JWVideoCell.h
//  JWVideoFeed
//
//  Created by Karim Mourra on 11/24/15.
//  Copyright © 2015 Karim Mourra. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <JWPlayer-iOS-SDK/JWPlayerController.h>

@interface JWVideoCell : UITableViewCell

@property (nonatomic) JWPlayerController *player;
@property (nonatomic) UILabel *videoNumber;

@end
