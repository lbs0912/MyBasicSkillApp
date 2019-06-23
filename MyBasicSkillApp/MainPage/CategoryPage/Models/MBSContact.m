//
//  MBSContact.m
//  MyBasicSkillApp
//
//  Created by Liu Baoshuai on 2019/6/23.
//  Copyright © 2019 Liu Baoshuai. All rights reserved.
//

#import "MBSContact.h"

@implementation MBSContact


+ (MBSContact *)initWithFirstName:(NSString *)firstName
                      andLastName:(NSString *)lastName
                   andPhoneNumber:(NSString *)phoneNumber
{
    MBSContact *contact1=[[MBSContact alloc]initWithFirstName:firstName
                                                  andLastName:lastName
                                               andPhoneNumber:phoneNumber];
    return contact1;
}

- (MBSContact *) initWithFirstName:(NSString *)firstName
                       andLastName:(NSString *)lastName
                    andPhoneNumber:(NSString *)phoneNumber
{
    if(self=[super init]){
        self.firstName = firstName;
        self.lastName=lastName;
        self.phoneNumber=phoneNumber;
    }
    return self;
}


-(NSString *)getName{
    return [NSString stringWithFormat:@"%@ %@",_lastName,_firstName];
}



@end
