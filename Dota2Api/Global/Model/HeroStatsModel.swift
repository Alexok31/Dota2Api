//
//  File.swift
//  Dota2Api
//
//  Created by EVA RUSH on 11/7/19.
//

import Realm
import RealmSwift

// MARK: - HeroStatsModel
class HeroStatsModel: Object, Decodable {
    @objc dynamic var id: Int = 0
    @objc dynamic var name: String? = nil
    @objc dynamic var localizedName: String? = nil
    @objc dynamic var primaryAttr: String? = nil
    @objc dynamic var attackType: String? = nil
    @objc dynamic var img: String? = nil
    @objc dynamic var icon: String? = nil
    
    
    enum CodingKeys: String, CodingKey {
        case id, name
        case localizedName = "localized_name"
        case primaryAttr = "primary_attr"
        case attackType = "attack_type"
        case roles, img, icon
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        do {
            id = try container.decode(Int.self, forKey: .id)
        } catch {
            id = 0
        }
        name = try? container.decode(String.self, forKey: .name)
        localizedName = try? container.decode(String.self, forKey: .localizedName)
        primaryAttr = try? container.decode(String.self, forKey: .primaryAttr)
        attackType = try? container.decode(String.self, forKey: .attackType)
        img = try? container.decode(String.self, forKey: .img)
        icon = try? container.decode(String.self, forKey: .icon)
        super.init()
    }
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    required init() {
        super.init()
    }
    
    required init(value: Any, schema: RLMSchema) {
        super.init(value: value, schema: schema)
    }
    
    required init(realm: RLMRealm, schema: RLMObjectSchema) {
        super.init(realm: realm, schema: schema)
    }
}

typealias HeroesStatsModel = [HeroStatsModel]
