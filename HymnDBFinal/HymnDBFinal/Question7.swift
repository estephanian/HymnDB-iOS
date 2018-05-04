//
//  Question4.swift
//  HymnDBFinal
//
//  Created by Adrien Ibarra on 3/22/18.
//  Copyright © 2018 Adrien Ibarra. All rights reserved.
//

import Foundation
var quizs7 = [Quiz]()
class mySize
{
    public init()
    {
        if(quizs7.count == 0)
        {
            
            quizs7.append(Quiz(title: "Under 100"))
            quizs7.append(Quiz(title: "Between 100 and 250"))
            quizs7.append(Quiz(title: "Between 250 and 500"))
            quizs7.append(Quiz(title: "Between 500 and 1000"))
            quizs7.append(Quiz(title: "Over 1000"))
        }
    }
    public func getMockData() -> [Quiz]
    {
        return quizs7
    }
    public func getCheckedData() -> [Quiz]
    {
        var myChecks = [Quiz]()
        for e in quizs7{
            if (e.done){
                myChecks.append(e)
            }
        }
        return myChecks
    }
}

