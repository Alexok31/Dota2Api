//
//  ProfileStorage.swift
//  Dota2Api
//
//  Created by EVA RUSH on 10/31/19.
//

import Realm
import RealmSwift

class ProfileModel: Object, Decodable {
    
    @objc dynamic var accountID: Int = 0
    @objc dynamic var personaname: String? = nil
    @objc dynamic var plus: Bool = false
    @objc dynamic var cheese: Int = 0
    @objc dynamic var steamid: String? = nil
    @objc dynamic var avatarfull: String? = nil
    @objc dynamic var profileurl: String? = nil
    @objc dynamic var loccountrycode: String? = nil
    @objc dynamic var isContributor: Bool = false

    enum CodingKeys: String, CodingKey {
        case accountID = "account_id"
        case personaname = "personaname"
        case plus = "plus"
        case cheese = "cheese"
        case steamid = "steamid"
        case avatarfull = "avatarfull"
        case profileurl = "profileurl"
        case loccountrycode = "loccountrycode"
        case isContributor = "is_contributor"
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        personaname = try? container.decode(String.self, forKey: .personaname)
        steamid = try? container.decode(String.self, forKey: .steamid)
        avatarfull = try? container.decode(String.self, forKey: .avatarfull)
        profileurl = try? container.decode(String.self, forKey: .profileurl)
        loccountrycode = try? container.decode(String.self, forKey: .loccountrycode)
        do {
            accountID = try container.decode(Int.self, forKey: .accountID)
        } catch {
            accountID = 0
        }
        do {
            plus = try container.decode(Bool.self, forKey: .plus)
        } catch {
            plus = false
        }
        do {
            cheese = try container.decode(Int.self, forKey: .cheese)
        } catch {
            cheese = 0
        }
        do {
            isContributor = try container.decode(Bool.self, forKey: .cheese)
        } catch {
            isContributor = false
        }
        super.init()
    }
    
    override static func primaryKey() -> String? {
        return "accountID"
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
