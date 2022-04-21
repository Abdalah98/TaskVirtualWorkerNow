//
//  PersistencManger.swift
//
 //  TaskVirtualWorkerNow
//
//  Created by Abdallah on 4/19/22.
//


import Foundation

enum PersistenceAction{
    case add,remove
}

enum PersistenceManger {
    
    static private let defults  = UserDefaults.standard
    enum Keys { static let favorites = "favorites" }
    
    
    static func updateWith(favorite:Product,actionType:PersistenceAction,comleted:@escaping (ResoneError?)->Void){
        retrieveSaved { result in
            switch result{
            case .success(var favorites):
                
                switch actionType {
                case .add:
                    guard !favorites.contains(favorite) else {
                        comleted(.alreadySaved)
                        return
                    }
                    
                    favorites.append(favorite)
                    
                case .remove: break
                    //$0 all item
                   // favorites.removeAll {$0.title == favorite.title}
                }
                comleted(save(saved: favorites))
                
            case .failure(let error):
                comleted(error)
            }
        }
        
    }
    
    
    static func retrieveSaved(completed: @escaping (Result<[Product],ResoneError>)-> Void){
        guard let favoritesData = defults.object(forKey: Keys.favorites) as? Data else{
            completed(.success([]))
            return
        }
        
        do {
            let decodeable = JSONDecoder()
            let favorites = try decodeable.decode([Product].self, from: favoritesData)
            completed(.success(favorites))
        }catch{
            completed(.failure(.unableToSaved))
        }
    }
    
    
    static func save(saved:[Product])->ResoneError?{
        do{
            let encoder = JSONEncoder()
            let encoderFavorites = try encoder.encode(saved)
            defults.set(encoderFavorites, forKey: Keys.favorites)
            return nil
        }catch{
            return .unableToSaved
        }
    }
}
