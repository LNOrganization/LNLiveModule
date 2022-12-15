//
//  LNLiveRecommendListController.m
//  LNLiveModule
//
//  Created by Lenny on 2022/12/9.
//

#import "LNLiveRecommendListController.h"
#import "LNLiveRecommendListProvider.h"
#import "LNLiveTableViewCell.h"
#import "LNLiveRoomModel.h"
#import "LNLiveModuleConfig.h"

@interface LNLiveRecommendListController ()

@end

@implementation LNLiveRecommendListController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.rowHeight = 260;
    
    self.provider = [LNLiveRecommendListProvider provider];
    [self.provider refreshData];
    // Do any additional setup after loading the view.
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"LNLiveTableViewCell";
    LNLiveTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[LNLiveTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    LNLiveRoomModel *room = self.dataArray[indexPath.row];
    [cell reloadWithData:room];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    LNLiveRoomModel *room = self.dataArray[indexPath.row];
    UIViewController *vc = [LNLiveModuleConfig.mediator getLiveRoomViewControllerWithRoomId:room.roomId];
    [self ln_pushViewController:vc];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
