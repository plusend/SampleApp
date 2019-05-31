//
//  RecommendViewController.m
//  SampleApp
//
//  Created by plusend on 2019/5/13.
//  Copyright © 2019 plusend. All rights reserved.
//

#import "RecommendViewController.h"

@interface RecommendViewController ()<UIScrollViewDelegate>

@end

@implementation RecommendViewController

- (instancetype)init {
    self = [super init];
    if (self) {
        self.view.backgroundColor = [UIColor greenColor];
        self.tabBarItem.title = @"Like";
        self.tabBarItem.image = [UIImage imageNamed:@"icon.bundle/like"];
        self.tabBarItem.selectedImage = [UIImage imageNamed:@"icon.bundle/like_selected"];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.view.backgroundColor = [UIColor whiteColor];

    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    scrollView.backgroundColor = [UIColor lightGrayColor];
    scrollView.contentSize = CGSizeMake(self.view.frame.size.width * 5, self.view.bounds.size.height);

    NSArray *colorArray = @[[UIColor redColor], [UIColor blueColor], [UIColor yellowColor], [UIColor lightGrayColor], [UIColor grayColor]];

    for (int i = 0; i < 5; i++) {
        [scrollView addSubview:({
            UIView *view = [[UIView alloc]initWithFrame:CGRectMake(scrollView.bounds.size.width * i, 0, scrollView.bounds.size.width, scrollView.bounds.size.height)];

            [view addSubview:({
                UIView *yellowView = [[UIView alloc] initWithFrame:CGRectMake(100, 200, 100, 100)];
                yellowView.backgroundColor = [UIColor yellowColor];

                UIGestureRecognizer *tapGesture = [[UIGestureRecognizer alloc] initWithTarget:self action:@selector(viewClick)];
                [yellowView addGestureRecognizer:tapGesture];

                yellowView;
            })];

            view.backgroundColor = [colorArray objectAtIndex:i];
            view;
        })];
    }
    scrollView.pagingEnabled = YES;

    [self.view addSubview:scrollView];
}

- (void)viewClick {
    NSLog(@"viewClick");
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    NSLog(@"scrollvViewDidScroll - %@", @(scrollView.contentOffset.x));
}

- (void)scrollViewDidZoom:(UIScrollView *) scrollView NS_AVAILABLE_IOS(3_2) {
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
}

- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *) targetContentOffset NS_AVAILABLE_IOS(5_0) {
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
}

- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView {
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
