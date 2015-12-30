//
//  ViewController.m
//  JWVideoFeed
//
//  Created by Karim Mourra on 11/24/15.
//  Copyright © 2015 Karim Mourra. All rights reserved.
//

#import "ViewController.h"
#import "JWVideoCell.h"
#import "JWRandomVideoTagGenerator.h"

#define cellIdentifier @"JWVideoFeedCell"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic) JWRandomVideoTagGenerator *randomVideoGenerator;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[JWVideoCell class] forCellReuseIdentifier:cellIdentifier];
    self.randomVideoGenerator = [JWRandomVideoTagGenerator new];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 25;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return self.view.frame.size.width;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    JWVideoCell *cell = (JWVideoCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    NSString *randomVideoTag = [self.randomVideoGenerator randomVideoTag];
    [cell.player load:randomVideoTag];
    NSString *cellTitle = [NSString stringWithFormat:@"Video #%ld", (long)indexPath.row + 1];
    [cell.videoNumber setText:cellTitle];
    return cell;
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    JWVideoCell *videoCell = (JWVideoCell *)cell;
    videoCell.player.view.center = videoCell.contentView.center;
    [videoCell.contentView addSubview:videoCell.player.view];
    [videoCell.player play];
}

-(void)tableView:(UITableView *)tableView didEndDisplayingCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    JWVideoCell *videoCell = (JWVideoCell *)cell;
    [videoCell.player pause];
}

@end
