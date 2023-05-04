//
//  CardStack View Model.swift
//  FamealPrompt
//
//  Created by Elvis Susanto on 04/05/23.
//

import Foundation
import Combine

class CardStackViewModel : ObservableObject {
    
    @Published var cards: [OneCard] = [
        OneCard(title: "Siapa anggota keluarga yang kamu harap bisa punya hubungan lebih dekat. Mengapa?"),
        OneCard(title: "Aku bangga menjadi bagian dari keluarga ini karena ___"),
        OneCard(title: "Sebutkan satu hal yang kamu banggakan dari setiap anggota keluargamu. Jelaskan."),
        OneCard(title: "Apakah kamu pernah merasa bahwa rumah bukan tempat pulangmu? Ceritakan contohnya."),
        OneCard(title: "Apa impian kamu terhadap keluarga ini yang belum pernah tercapai?"),
        OneCard(title: "Apa ekspetasi yang kamu miliki untuk tiap anggota keluarga? Jawab dengan jujur."),
        OneCard(title: "Ceritakan sebuah momen paling berkesan bersama keluargamu yang ingin kamu reka ulang."),
        OneCard(title: "Apakah kamu pernah merasa orangtuamu lebih menyayangi kakak/adikmu? Ceritakan."),
        OneCard(title: "Jika bisa terlahir kembali, apakah kamu ingin menjadi anak tunggal, sulung, tengah, atau bungsu? Mengapa?"),
        OneCard(title: "Apa tradisi keluarga favoritmu untuk menyambut bulan Ramadan/Natal? Ceritakan."),
        OneCard(title: "Pernahkah kamu merasa gengsi untuk meminta maaf pada anggota keluargamu, padahal tahu bahwa sebenarnya kamu yang salah?"),
        OneCard(title: "Apa arti keluarga untukmu?"),
        OneCard(title: "Jika ini adalah kesempatan terakhir, apa yang ingin kamu sampaikan pada anggota keluargamu?")
    ]
    @Published var unmovedCards : Int = 13
}
