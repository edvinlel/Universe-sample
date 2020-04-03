//
//  NetworkManager.swift
//  UniverseSampleProject
//
//  Created by Edvin Lellhame on 3/10/20.
//  Copyright © 2020 Edvin Lellhame. All rights reserved.
//

import Foundation

// MARK: - Error Enum


enum UError: String, Error {
    case invalidURL = "Network: This is an invalid URL."
    case unableToComplete = "Unable to complete your request. Please check your internet connection."
    case invalidResponse = "Invalid respnose from the server. Please try agian."
    case invalidData = "The data received from the server is invalid. Please try agian."
}

class NetworkManager {
    
    
    // MARK: - Singleton
    
    static let shared = NetworkManager()
    
    
    // MARK: - Initialize
    
    private init() { }
    
    
    // MARK: Helper Methods
    
    /// Returns the numeric value of the given digit represented as a Unicode scalar.
    ///
    /// - Parameters:
    ///   - postId: The id for the designated post to retrieve comments.
    ///   - completed: Closure that sends back the results from the network call. Returns array of Comment or UError.
    func getComments(with postId: Int, completed: @escaping (Result<[Comment], UError>) -> Void) {
        let commentsURL = "https://jsonplaceholder.typicode.com/posts/\(postId)/comments"
        
        guard let url = URL(string: commentsURL) else {
            completed(.failure(.invalidURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let _ = error {
                completed(.failure(.unableToComplete))
            }
            
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let comments = try decoder.decode([Comment].self, from: data)
                
                completed(.success(comments))
            } catch {
                completed(.failure(.invalidData))
            }
        }
        
        task.resume()
    }
    
    /// Returns the numeric value of the given digit represented as a Unicode scalar.
    ///
    /// - Parameters:
    ///   - completed: Closure that sends back the results from the network call. Returns array of Post or UError.
    func getPosts(completed: @escaping (Result<[Post], UError>) -> Void) {
        let postsURL = "https://jsonplaceholder.typicode.com/posts"
        
        guard let url = URL(string: postsURL) else {
            completed(.failure(.invalidURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let _ = error {
                completed(.failure(.unableToComplete))
            }
            
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let posts = try decoder.decode([Post].self, from: data)
                
                completed(.success(posts))
            } catch {
                completed(.failure(.invalidData))
            }
        }
        
        task.resume()
    }
}
