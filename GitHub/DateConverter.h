//
//  DateConverter.h
//  GitHub
//
//  Created by Михаил Луцкий on 05.09.17.
//  Copyright © 2017 Lutskiy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DateConverter : NSObject

/**
 Дата для обработки
 */
@property (copy, nonatomic) NSString *date;

/**
 Метод конвертирует дату в формат "dd.MM.yyyy в HH:mm"

 @return Сконвертированная дата в строке
 */
- (NSString*)convertToDateWithDayMonthYear;

@end
