//
//  SEBotConfigView.m
//  ipcVM
//
//  Created by Sean on 2018/2/22.
//  Copyright © 2018年 Sean. All rights reserved.
//

#import "SEBotConfigView.h"
#import "BotConfigItem.h"
@interface SEBotConfigView()<UIGestureRecognizerDelegate,UITextFieldDelegate>

@property(nonatomic,strong)BotConfigItem *item;

@property(nonatomic,strong)NSMutableArray *configArrayText;

@property(nonatomic,strong)NSMutableArray *configArrayConfig;

@property(nonatomic,strong)NSMutableArray *configArrayLabel;

@property(nonatomic,strong)NSMutableArray *configArrayFiled;
@end

@implementation SEBotConfigView

-(instancetype)initWithBot:(BotConfigItem *)item
{
    if(self = [super initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SEBOTCONFIGVIEWHIGHT)])
    {
//        self.backgroundColor = [UIColor redColor];
        _item = item;
        _configArrayText = [NSMutableArray new];
        _configArrayLabel = [NSMutableArray new];
        _configArrayFiled = [NSMutableArray new];
        _configArrayConfig = [NSMutableArray new];
        int i;
        int propertyCount = 0;
        objc_property_t *properties = class_copyPropertyList([BotConfigItem class], &propertyCount);
        
        for ( i=0; i < propertyCount; i++ ) {
            objc_property_t property = properties[i];
            
            const char* char_f =property_getName(property);
            
            NSString *propertyName = [NSString stringWithUTF8String:char_f];
            if(propertyName.length)
            {
                [_configArrayText addObject:propertyName];
            }
            
            
            id propertyValue = [_item valueForKey:(NSString *)propertyName];
            
            if (propertyValue) {
              [_configArrayConfig addObject:propertyValue];
            }else
            {
              [_configArrayConfig addObject:@"0"];
            }
        }
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGesturedAction:)];
        [self addGestureRecognizer:tap];
        tap.delegate = self;
        [self buildUI];

    }
    return self;
}

-(void)buildUI
{
    for(int i = 0;i < _configArrayText.count;i ++)
    {
        UILabel *label = [[UILabel alloc] init];
        label.text = _configArrayText[i];
        label.font = [UIFont systemFontOfSize:15.f];
        label.textColor = [UIColor blackColor];
        [label sizeToFit];
        label.x = 5.f;
        label.y = 30.f * i;
        [self addSubview:label];
        UITextField *field = [[UITextField alloc] init];
        field.height = label.height;
        field.width = 64.f;
        field.x = SCREEN_WIDTH - field.width - 15.f;
        field.y = label.y;
        field.backgroundColor = MAColorWithStr(@"#EEEEE0");
        field.placeholder = _configArrayConfig[i];
        
    
//        field.layer.borderColor = MAColorWithStr(@"#B5B5B5").CGColor;
//        field.layer.borderWidth = 1.f;

//        field.text = @"";
        field.font = [UIFont systemFontOfSize:15.f];
        field.textColor = [UIColor blackColor];
        field.keyboardType = UIKeyboardTypeURL;
        field.layer.cornerRadius = 1.5f;
        field.delegate = self;
        [self addSubview:field];
        [_configArrayLabel addObject:label];
        [_configArrayFiled addObject:field];
        
    }
}
//响应协议
-(void)tapGesturedAction:(UIGestureRecognizer *)gesture{
    
    for(UITextField * text in _configArrayFiled)
    {
        [text resignFirstResponder];
        [text endEditing:YES];
    }

    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    [textField resignFirstResponder];
    return YES;
}
@end
