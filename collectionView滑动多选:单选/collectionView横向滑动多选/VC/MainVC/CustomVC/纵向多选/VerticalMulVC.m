//
//  VerticalMulVC.m
//  collectionView横向滑动多选
//
//  Created by 闫继祥 on 2019/8/13.
//  Copyright © 2019 闫继祥. All rights reserved.
//

#import "VerticalMulVC.h"
#import "CustomVerticalMulView.h"
#import "ImgModel.h"
@interface VerticalMulVC ()<CustomVerticalMulViewDelegate>

@end

@implementation VerticalMulVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"collectionview纵向高度自适应多选";
    
    UIScrollView *scrollow = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    scrollow.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:scrollow];
    
    
    //数据
    NSMutableArray *array = [NSMutableArray array];
    for (int i = 0; i < 10; i ++) {
        ImgModel *model = [[ImgModel alloc] init];
        model.imgId = [NSString stringWithFormat:@"%d",i];
        model.imgUrl = @"https://img13.360buyimg.com/n1/s350x449_jfs/t21085/241/552417402/131946/425aaf9e/5b122c03N780b5219.jpg!cc_350x449.jpg";
        [array addObject:model];
    }
        //纵向多选
        CustomVerticalMulView *custom4 = [[CustomVerticalMulView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 0)];
        custom4.imageArr = [array mutableCopy];
        custom4.backgroundColor = [UIColor redColor];
        //默认选中index
        custom4.selectIndex = 0;
        custom4.numRow = 4;
        custom4.Delegate = self;
        [scrollow addSubview:custom4];
    scrollow.contentSize = CGSizeMake(self.view.frame.size.width, custom4.frame.size.height+custom4.frame.origin.y);

}
//纵向多选
- (void)clickBtnMul:(NSInteger)index selectArray:(NSArray *)selectImgIDArray {
    NSLog(@"4当前点击图片index-----%ld ------ 选中图片id数组%@",index,selectImgIDArray);
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
