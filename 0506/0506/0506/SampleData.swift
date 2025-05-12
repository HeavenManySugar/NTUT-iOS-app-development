//
//  SampleData.swift
//  0506
//
//  Created by 張睿恩 on 2025/5/6.
//

struct SampleData {
    static let authors = [
        Author(
            name: "克莉絲蒂",
            image: "christie",
            books: [
                Book(
                    name: "無盡的夜",
                    author: "克莉絲蒂",
                    coverImage: "cover1",
                    description: """
                        年輕貌美而又富可敵國的美國女郎在一個叫「吉普賽營地」的瀕海山崖上興建了一座豪
                        華別墅。
                        可惜的是，她在與一位來自英國的帥氣南子新婚後不久便死於非命……
                        誰是元兇，竟狠毒地將這對神仙眷侶拆散？
                        某人自幼便生活在利欲的黑暗生活中，被禁錮的心靈導引他自人生的黑夜邁向地獄的黑
                        夜?
                        """
                ),
                Book(
                    name: "尼羅河謀殺案",
                    author: "克莉絲蒂",
                    coverImage: "cover2",
                    description:
                        """
                        林內特是一個擁有著如日中天事業的女強人，然而她和丈夫在蜜月旅行途中慘遭殺害。
                        當艾及德偵探赫丘勒·白羅踏上船隻後，這個美麗的蜜月旅行變成了一場駭人的謀殺調
                        查。
                        每個人都有嫌疑，每個人都有不在場證明。白羅必須在這場充滿謎團的案件中找到真
                        相。
                        """
                ),
            ]
        ),
        Author(
            name: "伊坂幸太郎",
            image: "isakakotaro",
            books: [
                Book(
                    name: "重力小丑",
                    author: "伊坂幸太郎",
                    coverImage: "cover3",
                    description: """
                        一個美國少年與他的哥哥發現，他們周遭的世界突然變得無比怪異，
                        他們的父親遭遇不測，哥哥的生活變得混亂，弟弟開始質疑現實的本質。
                        在一系列奇怪的事件背後，似乎隱藏著一個更大的陰謀。
                        """
                ),
                Book(
                    name: "死神的精確度",
                    author: "伊坂幸太郎",
                    coverImage: "cover4",
                    description:
                        """
                        年輕的死神千葉，他的工作是評估人們的死亡。
                        他有七天時間觀察每個人，然後決定他們是否應該死亡。
                        在這七天內，他遇到了一系列令人感動的故事，開始質疑自己的任務。
                        """
                ),
            ]
        ),
    ]
    static let author = authors[0]
    static let book = authors[0].books[0]
}
