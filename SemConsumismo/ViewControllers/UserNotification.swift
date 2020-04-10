//
//  NewNotificationViewController.swift
//  SemConsumismo
//
//  Created by Luiza Fattori on 03/04/20.
//  Copyright © 2020 Luiza Fattori. All rights reserved.
//

import UIKit
import UserNotifications

func createANotification(){
    let notificationCenter = UNUserNotificationCenter.current()
    
    notificationCenter.requestAuthorization(options: [.alert, .sound, .badge]) { (success, error) in
        print("erro notification")
    }
    
    let notificationTitles = ["Como você está hoje?", "Já fez seus registros hoje", "Já estamos sentindo sua falta"]
    let notificationDescriptions = ["Você ainda não colcou suas informações hoje, é importante para manter o controle", "Sua plantinha está com saudade de você, venha dar um pouco de amor para ela", "Queremos te ajudar a manter os seus registros"]
    
    let notificationTitle = notificationTitles.randomElement()
    let notificationDescription = notificationDescriptions.randomElement()
    
    let content = UNMutableNotificationContent()
    content.title = notificationTitle ?? "Como você está hoje?"
    content.body = notificationDescription ?? "Não esqueça de colocar as informações de hoje"
    content.sound = UNNotificationSound.default
}
