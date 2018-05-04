//
//  Question2.swift
//  HymnDBFinal
//
//  Created by Adrien Ibarra on 3/27/18.
//  Copyright © 2018 Adrien Ibarra. All rights reserved.
//

import Foundation
//
//  Question2.swift
//  HymnDBFinal
//
//  Created by Adrien Ibarra on 3/22/18.
//  Copyright © 2018 Adrien Ibarra. All rights reserved.
//
var quizs2 = [Quiz]()

/*class Quiz
 {
 var title: String
 var done: Bool
 
 public init(title: String)
 {
 self.title = title
 self.done = false
 }
 public func status_switch(){
 self.done = !self.done
 }
 }
 */
class myInstruments
{
    public init()
    {
        if(quizs2.count == 0)
        {
            
            quizs2.append(Quiz(title: "Acapella"))
            quizs2.append(Quiz(title: "Organ"))
            quizs2.append(Quiz(title: "Piano"))
            quizs2.append(Quiz(title: "Guitar (not full band)"))
            quizs2.append(Quiz(title: "Band (guitar, bass, drums, etc..."))
            quizs2.append(Quiz(title: "Orchestra/Wind Ensemble"))
            quizs2.append(Quiz(title: "Handbells"))
            quizs2.append(Quiz(title: "Obligato Instrumentals (flute, clarinet, trumpet, etc..."))
        }
    }
    public func getMockData() -> [Quiz]
    {
        return quizs2
    }
    public func getCheckedData() -> [Quiz]
    {
        var myChecks = [Quiz]()
        for e in quizs2{
            if (e.done){
                myChecks.append(e)
            }
        }
        return myChecks
    }
}
