//
//  Question.swift
//  HW9
//
//  Created by 張睿恩 on 2025/5/20.
//

import Foundation

struct Question: Identifiable {
    let id = UUID()
    let text: String
    let options: [String]
    let correctAnswerIndex: Int
}

extension Question {
    static let sampleQuestions = [
        Question(text: "什麼是台灣的首都?", options: ["台北", "高雄", "台中"], correctAnswerIndex: 0),
        Question(text: "地球上有幾大洲?", options: ["5", "6", "7"], correctAnswerIndex: 2),
        Question(text: "人體最大的器官是什麼?", options: ["肝臟", "皮膚", "心臟"], correctAnswerIndex: 1),
        Question(text: "誰是蘋果公司的創始人?", options: ["史蒂夫·喬布斯", "比爾·蓋茨", "馬克·祖克柏"], correctAnswerIndex: 0),
        Question(text: "哪個國家被稱為「千湖之國」?", options: ["瑞典", "芬蘭", "挪威"], correctAnswerIndex: 1),
        Question(text: "哪種顏色不是三原色之一?", options: ["紅色", "綠色", "藍色"], correctAnswerIndex: 1),
        Question(text: "水的化學式是什麼?", options: ["H2O", "CO2", "O2"], correctAnswerIndex: 0),
        Question(text: "太陽系中最大的行星是?", options: ["土星", "木星", "海王星"], correctAnswerIndex: 1),
        Question(text: "世界上最長的河流是?", options: ["尼羅河", "亞馬遜河", "長江"], correctAnswerIndex: 0),
        Question(text: "誰寫了「羅密歐與茱麗葉」?", options: ["莎士比亞", "海明威", "托爾斯泰"], correctAnswerIndex: 0),
        Question(text: "《進擊的巨人》主角艾連的全名是?", options: ["艾連·葉卡", "艾連·史密斯", "艾連·艾克曼"], correctAnswerIndex: 0),
        Question(text: "《鬼滅之刃》中，炭治郎使用的呼吸法是?", options: ["水之呼吸", "火之呼吸", "風之呼吸"], correctAnswerIndex: 0),
        Question(text: "《名偵探柯南》中，工藤新一被縮小後的名字是?", options: ["江戶川柯南", "毛利小五郎", "服部平次"], correctAnswerIndex: 0),
        Question(text: "《航海王》中，魯夫想成為什麼?", options: ["海賊王", "劍豪", "大將"], correctAnswerIndex: 0),
        Question(text: "哪部動漫有著「木葉忍者村」這個設定?", options: ["火影忍者", "刀劍神域", "妖精的尾巴"], correctAnswerIndex: 0),
        Question(text: "iOS 是哪間公司的作業系統?", options: ["Apple", "Google", "Microsoft"], correctAnswerIndex: 0),
        Question(text: "HTML 是用來做什麼的?", options: ["撰寫網頁內容", "設計電路板", "編譯程式碼"], correctAnswerIndex: 0),
        Question(text: "哪一項技術與人工智慧最密切相關?", options: ["機器學習", "雲端儲存", "區塊鏈"], correctAnswerIndex: 0),
        Question(text: "在電腦中，RAM 是什麼的縮寫?", options: ["Random Access Memory", "Read After Memory", "Remote Access Module"], correctAnswerIndex: 0),
        Question(text: "特斯拉是哪一類產品的知名品牌?", options: ["電動車", "手機", "無人機"], correctAnswerIndex: 0),
        Question(text: "Python 是一種什麼語言?", options: ["程式語言", "標記語言", "樣式表語言"], correctAnswerIndex: 0),
        Question(text: "地球上最深的海溝是?", options: ["馬里亞納海溝", "大西洋中脊", "日耳曼海溝"], correctAnswerIndex: 0),
        Question(text: "哪一種動物是哺乳類?", options: ["鯨魚", "鯊魚", "烏龜"], correctAnswerIndex: 0),
        Question(text: "哪一種水果是熱帶水果?", options: ["香蕉", "蘋果", "葡萄"], correctAnswerIndex: 0),
        Question(text: "哪一種動物是爬行類?", options: ["蛇", "青蛙", "魚"], correctAnswerIndex: 0),
        Question(text: "哪一種動物是兩棲類?", options: ["青蛙", "蛇", "鳥"], correctAnswerIndex: 0),
        Question(text: "哪一種動物是昆蟲?", options: ["蜜蜂", "青蛙", "蛇"], correctAnswerIndex: 0),
        Question(text: "哪一種動物是哺乳類?", options: ["貓", "青蛙", "魚"], correctAnswerIndex: 0),
        Question(text: "哪一種動物是魚類?", options: ["鯊魚", "青蛙", "蛇"], correctAnswerIndex: 0),
        Question(text: "哪一種動物是鳥類?", options: ["鴨子", "青蛙", "蛇"], correctAnswerIndex: 0),
        Question(text: "哪一種動物是爬行類?", options: ["蜥蜴", "青蛙", "魚"], correctAnswerIndex: 0),
        Question(text: "哪位科學家提出萬有引力定律?", options: ["牛頓", "愛因斯坦", "伽利略"], correctAnswerIndex: 0),
        Question(text: "哪一種植物是多肉植物?", options: ["仙人掌", "玫瑰", "松樹"], correctAnswerIndex: 0),
        Question(text: "哪一種植物是水生植物?", options: ["荷花", "玫瑰", "松樹"], correctAnswerIndex: 0),
        Question(text: "哪一種植物是草本植物?", options: ["小麥", "橡樹", "松樹"], correctAnswerIndex: 0),
        Question(text: "哪一種植物是木本植物?", options: ["橡樹", "小麥", "松樹"], correctAnswerIndex: 0),
        Question(text: "哪一種植物是藤本植物?", options: ["葡萄", "小麥", "松樹"], correctAnswerIndex: 0),
        Question(text: "哪一種植物是藻類?", options: ["海帶", "玫瑰", "松樹"], correctAnswerIndex: 0),
        Question(text: "彩虹最多可以有幾種顏色?", options: ["5", "6", "7"], correctAnswerIndex: 2),
        Question(text: "人體中負責輸送氧氣的是什麼細胞?", options: ["紅血球", "白血球", "血小板"], correctAnswerIndex: 0),
        Question(text: "哪位藝術家畫了《星夜》?", options: ["梵谷", "畢卡索", "達文西"], correctAnswerIndex: 0),
        Question(text: "世界上使用人口最多的語言是?", options: ["英文", "西班牙文", "中文"], correctAnswerIndex: 2),
        Question(text: "電的單位是什麼?", options: ["瓦特", "安培", "伏特"], correctAnswerIndex: 2),
        Question(text: "哪一種動物是哺乳類?", options: ["企鵝", "鯨魚", "烏龜"], correctAnswerIndex: 1),
        Question(text: "台灣最高的山是?", options: ["玉山", "雪山", "合歡山"], correctAnswerIndex: 0),
        Question(text: "哪一年登陸月球成功?", options: ["1969", "1975", "1961"], correctAnswerIndex: 0)
    ]
}
