//
//  AppService.swift
//  idk
//
//  Created by 90310805 on 3/7/24.
//

import Appwrite

enum RequestStatus {
    case success
    case error (_ message: String)
}


class AppService {
    let client = Client()
        .setEndpoint("https://cloud.appwrite.io/v1")
        .setProject("65e9d69964a9d922967d")
        .setSelfSigned(true)
    
    let account: Account
    
    init() {
        account = Account(client)
    }
    func createUser(email: String, password: String) async throws -> RequestStatus {
        do {
            _ = try await account.create(userId: ID.unique(), email: email, password: password)
            return .success
        } catch {
            return .error(error.localizedDescription)
        }
        
    }
    func login(email: String, password: String) async throws -> RequestStatus {
        do {
            _ = try await account.createEmailSession(email: email, password: password)
            return .success
        } catch {
            return .error(error.localizedDescription)
        }
        
    }
    func logout() async throws -> RequestStatus {
        do {
            _ = try await account.deleteSession(sessionId: "currentSession")
            return .success
        } catch {
            return .error(error.localizedDescription)
        }
        
    }
    
}
