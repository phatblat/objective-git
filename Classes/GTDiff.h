//
//  GTDiff.h
//  ObjectiveGitFramework
//
//  Created by Danny Greg on 29/11/2012.
//  Copyright (c) 2012 GitHub, Inc. All rights reserved.
//

#import "git2.h"

#import "GTDiffDelta.h"

@class GTDiffDelta;
@class GTRepository;
@class GTTree;

extern NSString *const GTDiffOptionsFlagsKey;
extern NSString *const GTDiffOptionsContextLinesKey;
extern NSString *const GTDiffOptionsInterHunkLinesKey;
extern NSString *const GTDiffOptionsOldPrefixKey;
extern NSString *const GTDiffOptionsNewPrefixKey;
extern NSString *const GTDiffOptionsMaxSizeKey;

typedef BOOL(^GTDiffDeltaProcessingBlock)(GTDiffDelta *delta);

@interface GTDiff : NSObject

@property (nonatomic, readonly) git_diff_list *git_diff_list;
@property (nonatomic, readonly) NSUInteger deltaCount;

//TODO: Need to settle on a method for sending in the options struct

+ (GTDiff *)diffOldTree:(GTTree *)oldTree withNewTree:(GTTree *)newTree forRepository:(GTRepository *)repository withOptions:(NSDictionary *)options;
+ (GTDiff *)diffIndexToOldTree:(GTTree *)oldTree forRepository:(GTRepository *)repository withOptions:(NSDictionary *)options;
+ (GTDiff *)diffWorkingDirectoryToIndexForRepository:(GTRepository *)repository withOptions:(NSDictionary *)options;
+ (GTDiff *)diffWorkingDirectoryToTree:(GTTree *)tree forRepository:(GTRepository *)repository withOptions:(NSDictionary *)options;

- (instancetype)initWithGitDiffList:(git_diff_list *)diffList;
- (NSUInteger)numberOfDeltasWithType:(GTDiffDeltaType)deltaType;
- (void)enumerateDeltasWithBlock:(GTDiffDeltaProcessingBlock)block;

@end
