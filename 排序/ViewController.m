//
//  ViewController.m
//  排序
//
//  Created by 冯晓林 iMac on 2016/12/14.
//  Copyright © 2016年 冯晓林. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property(nonatomic,copy)NSString *uro;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSMutableArray *arr = [NSMutableArray arrayWithObjects:@2,@5,@4,@6,@87,@34,@1,@13, nil];
    
    
//    [self maopao:arr];
    
    [self quickSortWithArray:arr withLeft:0 andRight:arr.count-1];
    NSLog(@"%@",arr);
    
    //使用二分查找的数组必须是有序的
//    NSLog(@"%ld",[self binarySearchNoRecursion:arr withDes:@10]);
//    NSLog(@"%ld",[self binarySearchWithRecursion:arr withDes:@13 start:0 end:arr.count-1]);
    
    
    
}

#pragma mark  冒泡
-(void)maopao:(NSMutableArray *)arr{
    
    for (int i = 0; i < arr.count; i++){
        
        for (int j = 0; j < arr.count - 1 - i; j++) {
            
            if (arr[j] > arr[j+1]) {
                
                [arr exchangeObjectAtIndex:j withObjectAtIndex:j+1];
            } 
        }
        
    }
}

#pragma mark  快速排序
-(void)quickSortWithArray:(NSMutableArray *)array withLeft:(NSInteger)left andRight:(NSInteger)right{
    if (left >= right) return;
    
    NSInteger i = left;
    NSInteger j = right;
    NSInteger key = [array[left] integerValue];
    
    while (i < j) {
        while (i < j && key <= [array[j] integerValue]) {
            j--;
        }
        array[i] = array[j];
        while (i < j && key >= [array[i] integerValue]) {
            i++;
        }
        array[j] = array[i];
    }
    array[i] = [NSNumber numberWithInteger:key];
    
    [self quickSortWithArray:array withLeft:left andRight:i - 1];
    [self quickSortWithArray:array withLeft:i + 1 andRight:right];
}

#pragma mark  二分查找
//非递归写法
- (NSInteger)binarySearchNoRecursion:(NSArray *)srcArray withDes:(NSNumber *)des{
    NSInteger low = 0;
    NSInteger high = [srcArray count] - 1;
    while (low <= high) {
        NSInteger middle = low + ((high - low)>>1);//中间位置计算,low+ 最高位置减去最低位置,右移一位,相当于除2.也可以用(high+low)/2
        if ([des integerValue] == [srcArray[middle] integerValue]) return middle;
        else if([des integerValue] < [srcArray[middle] integerValue])  high = middle - 1;
        else low = middle + 1;
    }
    return -1;//没有找到
}


//递归写法
- (NSUInteger)binarySearchWithRecursion:(NSArray *)array withDes:(NSNumber *)target start:(NSUInteger)start end:(NSUInteger)end {
    if (start > end) {
        return -1;//没有找到
    }
    NSUInteger mid = start + (end - start) / 2;
    if (target > array[mid]) {
        return [self binarySearchWithRecursion:array withDes:target start:mid+1 end:end];
    }else if (target < array[mid]) {
        return [self binarySearchWithRecursion:array withDes:target start:start end:mid-1];
    }else {
        return mid;
    }
}





@end
