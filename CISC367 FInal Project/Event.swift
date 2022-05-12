//
//  Event.swift
//  CISC367 FInal Project
//
//  Created by Abigail Walters on 5/9/22.
//

import Foundation

var eventsList = [Event]()

class Event{
    var id: Int!
    var name: String!
    var start: Date!
    var end: Date!
    //var date: Date!
    var descr: String!
    
    func eventsForDate(date: Date) -> [Event]
    {
        var daysEvents = [Event]()
        for event in eventsList
        {
            if(Calendar.current.isDate(event.start, inSameDayAs:date))
            {
                daysEvents.append(event)
            }
        }
        return daysEvents
    }
}
