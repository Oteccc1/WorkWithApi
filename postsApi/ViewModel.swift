//
//  ViewModel.swift
//  postsApi
//
//  Created by MacOS on 22.10.2022.
//

import Foundation
import SwiftUI

class viewModel: ObservableObject{
    @Published var MainPost: [Post] = [] //инициализация и создание объекта структуры
    func getData() -> Void{
        let urlString = "https://jsonplaceholder.typicode.com/posts" //создание переменной с ссылкой на api
        guard let url = URL(string: urlString) else { return } //проверка на работоспособность ссылки
        
        URLSession.shared.dataTask(with: url){ [self] data, response, error in //извлечение данных
            if let error = error {
                print(error)
                return
            }          //проверка на ошибку
            guard let data = data else {
                return
            }
            //            let jsonString = String(data: data, encoding: .utf8)
            //            print(jsonString)
            do{
                DispatchQueue.global(qos: .userInitiated).async { //вынос декодирования информации3 и заполнение массива MainPost в другое ядро
                    let Posts = try? JSONDecoder().decode([Post].self, from: data)
                    self.MainPost = Posts!
                    return
                }
            } catch{
                print(error)
            }
            
            
        }.resume()
    }
}
