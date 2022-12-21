//
//  LNLiveRecommendListProvider.m
//  LNLiveModule
//
//  Created by Lenny on 2022/12/11.
//

#import "LNLiveRecommendListProvider.h"
#import "LNLiveRoomModel.h"

@implementation LNLiveRecommendListProvider

- (LNHTTPRequest *)requestWithSuccess:(LNLoadSuccessBlock)success
                              failure:(LNLoadFailureBlock)failure
{
    return [LNNetworkManager startRequestCreator:^(LNHTTPRequest * _Nonnull request) {
        request.urlPath = @"";
        [request createParameters:^(NSMutableDictionary * _Nonnull params) {
            [params setObject:@(self.pageSize) forKey:@"pageSize"];
            [params setObject:@(self.currentPage) forKey:@"pageNum"];
        }];
    } succeed:^(id  _Nonnull data) {
        LN_SAFE_BLOCK_CALL(success, data);
    } failed:^(NSError * _Nonnull error) {
        LN_SAFE_BLOCK_CALL(failure, error);
#if DEBUG
        LN_SAFE_BLOCK_CALL(success, [self localDatas]);
#endif
    }];
}

- (NSDictionary *)localDatas
{
    NSMutableArray *datas = [NSMutableArray array];
    for (NSInteger index = 0; index < 20; index ++) {
        NSMutableDictionary *video = [[NSMutableDictionary alloc] init];
        video[@"title"] = [NSString stringWithFormat:@"视频%@", @(index)];
        video[@"coverUrl"] = @"https://t7.baidu.com/it/u=1951548898,3927145&fm=193&f=GIF";
        NSMutableDictionary *creator = [[NSMutableDictionary alloc] init];
        creator[@"name"] = [NSString stringWithFormat:@"创建者%@", @(index)];
        creator[@"iconUrl"] = @"https://t7.baidu.com/it/u=1831997705,836992814&fm=193&f=GIF";
        video[@"anchor"] = [creator copy];
        [datas addObject:[video copy]];
    }
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[@"code"] = @(200);
    dict[@"message"] = @"请求成功";
    dict[@"data"] = [datas copy];
    return [dict copy];
}

- (Class)modelClass
{
    return [LNLiveRoomModel class];
}

@end
