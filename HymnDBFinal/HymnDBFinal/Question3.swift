//
//  Question3.swift
//  HymnDBFinal
//
//  Created by Adrien Ibarra on 3/22/18.
//  Copyright © 2018 Adrien Ibarra. All rights reserved.
//

import Foundation

var quizs3 = [Quiz]()

/*class ensemble
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

class myEnsembles
{
    public init()
    {
        if(quizs3.count == 0)
        {
            
            quizs3.append(Quiz(title: "Choir"))
            quizs3.append(Quiz(title: "Cantor"))
            quizs3.append(Quiz(title: "Song-Enlivener"))
            quizs3.append(Quiz(title: "Lead Singer from Band (solo)"))
            quizs3.append(Quiz(title: "Lead Singer from Band with Other Vocalists"))
            
        }
    }
    public func getMockData() -> [Quiz]
    {
        return quizs3
    }
    public func getCheckedData() -> [Quiz]
    {
        var myChecks = [Quiz]()
        for e in quizs3{
            if (e.done){
                myChecks.append(e)
            }
        }
        return myChecks
    }
}

