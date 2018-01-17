//
//  SEOperationTableViewCell.h
//  ipcVM
//
//  Created by Sean on 2018/1/4.
//  Copyright © 2018年 Sean. All rights reserved.
//


#define OPERATIONMENUHIGHT  64.f
@interface SEOperationTableViewCell : UITableViewCell

@property(nonatomic,strong)NSString *menu;

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;


@end
