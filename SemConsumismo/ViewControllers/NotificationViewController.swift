//
//  NotificationViewController.swift
//  SemConsumismo
//
//  Created by Luiza Fattori on 25/07/19.
//  Copyright © 2019 Luiza Fattori. All rights reserved.
//

import Foundation
import UIKit
import UserNotifications

func createNotification(){
    
    let notificationCenter = UNUserNotificationCenter.current()
    notificationCenter.requestAuthorization(options: [.alert, .sound, .badge])
    { (success, error) in
        print("erro notification")
    }
    
    let notificationTitle: String = "How you doing? 😏"
    let notificationDescriptions = ["Não se esqueça de colocar as informações de hoje", "Passando por muitas tentações? Não esqueça de registrar tudo", "Sua planta está sentindo sua falta. Dê um pouco de amor para ela"]
    let notificationDescription = notificationDescriptions.randomElement()
    
    // notification content
    let content   = UNMutableNotificationContent()
    content.title = notificationTitle
    content.body  = notificationDescription ?? "Não esqueça de colocar as informações de hoje"
    content.sound = UNNotificationSound.default
    
    // when notification will apear
    let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 70, repeats: true)
    
    // request
    let request = UNNotificationRequest(identifier: "notificationCenter", content: content, trigger: trigger)
    
    notificationCenter.add(request) { (error) in
        print("erro notificacao")
    }
    
    
}
