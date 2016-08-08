//
//  Constants.swift
//  getup
//
//  Created by Dan Harsanyi on 1/8/16.
//  Copyright © 2016 danharsanyi. All rights reserved.
//

import Foundation
import AVFoundation

let NOTIF_ALARM_ADDED = "alarmAdded"
let NOTIF_WAKEUP = "wakeUpTime"

var alarms = [Alarm]()
var readyForAlarm = true

var alarmPlayer: AVAudioPlayer!
var alarmSession: AVAudioSession!

//ALL QUOTES

var maleFitnessQuotes = [
    "Suffer the pain of discipline or suffer the pain of regret",
    "The difference between me and them is that I keep going when it becomes hard",
    "The days when the body aches and you feel tired and weak... that's when champions train",
    "Do it for that smile when she first touches your gains",
    "Do it for her face when you take off your shirt",
    "The best ab exercise is 5 sets of stop eating so much crap",
    "I don't stop when I'm tired, I stop when I'm done",
    "Am I the type of person who finds excuses to skip the gym or excuses to train?",
    "Pain makes me grow, growing is what I want. Therefore pain is pleasure",
    "Right now the voices in your head are pumping iron. You should too",
    "I start to count once I start feeling the pain",
    "Life is too short to be small",
    "Excuses never changed a damn thing. Stop whining and get moving",
    "Eat right, train hard, give your best, trust the process, stay inspired",
    "Train insane or remain the same"
]

var femaleFitnessQuotes = [
    "Stop holding myself back. If I'm not happy, make a change",
    "Every step I take is a step further than I was yesterday",
    "Eat clean, set goals, train hard, don't give up",
    "Never look at how hard it will take. Give everything you've got and you'll get results",
    "Strive for progress, not perfection",
    "Remind yourself nobody is built like you. You design yourself",
    "My body is a reflection of my lifestyle",
    "I only live once so I might as well be a baddass!",
    "Imagine yourself six months from now. Don't stop, it will be worth it",
    "Do it for the 'damn, you got hot!'",
    "Fitness is about being better than you used to be",
    "Tell yourself you can do it. Every. Damn. Day.",
    "Squats are a woman's best friend",
    "When you think about quitting, think about why you started",
    "It never gets easier, you just get stronger",
    "It hurts now but one day it will be my warmup",
    "The next time you want to give up, remember why you started"
    
]

var businessQuotes = [
    "Work so hard that one day your signature will be called an autograph",
    "Motivation is looking at the things you want and realizing what it takes to get",
    "I don't follow dreams, I hunt goals",
    "The only thing between me and my goal is the bullshit I tell myself as to why I can't achieve it",
    "Successful people aren't gifted. They just work hard then succeed on purpose",
    "You can't have a million dollar dream with a minimum wage work ethic",
    "Don't tell people your dreams, show them",
    "The future can be better than the present and you have the power to make it so",
    "If it was easy everyone would be doing it",
    "To be the best you have to be willing to do things that other people aren't willing to do",
    "Successful people make decisions based on where they want to be",
    "Create a business you don't need a holiday from",
    "Work until your bank account looks like a phone number",
    "Think like a millionaire. Hustle like you're broke",
    "Work hard in silence and let success be your noise",
    "Be all in or get all out. There is no halfway",
    "Kill them with success and bury them with a smile",
    "Set goals so big you get uncomfortable telling other people",
    "If you don't build your dreams, someone else will hire you to build theirs"
]

var inspriationQuotes = [
    "When everything feels like an uphill struggle, just think of the view from the top",
    "Successful people do daily what others do occasionally",
    "If I can't stop thinking about it, I shouldn't stop working on it",
    "Winners are not people who never fail, but people who never quit",
    "Strength comes from overcoming the things you once thought you couldn't do",
    "Success is small efforts repeated until it becomes a habit",
    "The fact that you aren't where you want to be should be motivaiton enough",
    "Small daily improvements over time lead to stunning results",
    "Be comfortable with uncomfortable. Every success in life is achieved in temporary pain",
    "Believe in the person you want to be and then be willing to work for it",
    "You can't be upset by the results you didn't get with the work you didn't do",
    "You get what you work for, not what you wish for",
    "Life is the result of your choices. If you don't like your life it's time to make better choices",
    "Great things never came from comfort zones",
    "Motivation is what gets you started. Habit is what keeps you going",
    "What you do today will improve all of your tomorrows",
    "The secret of the future is hidden in your daily routine",
    "The trophy is earned in the hours when noone is watching"
]

//ALL IMAGES

var maleFitnessImages = [
    "http://res.cloudinary.com/dv8vyzzqw/image/upload/v1470373515/maleFitnessFiltered5_n8esuc.png",
    "http://res.cloudinary.com/dv8vyzzqw/image/upload/v1470373510/maleFitnessFiltered4_qoeqgu.png",
    "http://res.cloudinary.com/dv8vyzzqw/image/upload/v1470373502/maleFitnessFiltered3_wgrtl1.png",
    "http://res.cloudinary.com/dv8vyzzqw/image/upload/v1470373517/maleFitnessFiltered2_rielbc.png",
    "http://res.cloudinary.com/dv8vyzzqw/image/upload/v1470373509/maleFitnessFiltered1_cqedzx.png"
]

var femaleFitnessImages = [
    "http://res.cloudinary.com/dv8vyzzqw/image/upload/v1470373490/femaleFitnessFiltered5_guuod0.png",
    "http://res.cloudinary.com/dv8vyzzqw/image/upload/v1470373504/femaleFitnessFiltered4_cenhsf.png",
    "http://res.cloudinary.com/dv8vyzzqw/image/upload/v1470373495/femaleFitnessFiltered3_os67x7.png",
    "http://res.cloudinary.com/dv8vyzzqw/image/upload/v1470373477/femaleFitnessFiltered2_xdxt2u.png",
    "http://res.cloudinary.com/dv8vyzzqw/image/upload/v1470373489/femaleFitnessFiltered1_yiocx4.png"
]

var businessImages = [
    "http://res.cloudinary.com/dv8vyzzqw/image/upload/v1470195989/businessMotivFiltered_jk2uiu.png",
    "http://res.cloudinary.com/dv8vyzzqw/image/upload/v1470214129/businessMotivFiltered4_f8ta24.png",
    "http://res.cloudinary.com/dv8vyzzqw/image/upload/v1470214131/businessMotivFiltered1_da0yap.png",
    "http://res.cloudinary.com/dv8vyzzqw/image/upload/v1470214130/businessMotivFiltered3_lqtqzg.png",
    "http://res.cloudinary.com/dv8vyzzqw/image/upload/v1470214129/businessMotivFiltered2_d5mpzv.png"
]

var inspriationImages = [
    "http://res.cloudinary.com/dv8vyzzqw/image/upload/v1470317505/inspoFiltered2_yhyyfe.png",
    "http://res.cloudinary.com/dv8vyzzqw/image/upload/v1470317502/inspoFiltered1_huqjen.png",
    "http://res.cloudinary.com/dv8vyzzqw/image/upload/v1470317501/inspoFiltered5_z6n7fp.png",
    "http://res.cloudinary.com/dv8vyzzqw/image/upload/v1470317500/inspoFiltered4_df9gi8.png",
    "http://res.cloudinary.com/dv8vyzzqw/image/upload/v1470317495/inspoFiltered3_do7zq0.png"
]

func updateAlarmsArrayInMemory() {
    let alarmData = NSKeyedArchiver.archivedDataWithRootObject(alarms)
    
    NSUserDefaults.standardUserDefaults().setObject(alarmData, forKey: "alarms")
    NSUserDefaults.standardUserDefaults().synchronize()
    
    NSNotificationCenter.defaultCenter().postNotificationName("NOTIF_ALARM_ADDED", object: Alarm.self)
}


