//
//  DBReader.swift
//  TestSQLQuery
//
//  Created by Vinicius Mesquita on 06/10/20.
//

import SQLite

final class DBReader {
    
    private var connection: Connection?
    private let word = Word()
    private let scheme = Word.scheme
    
    // Lê e inicia uma conexão com o banco de dados.
    func start() throws {
        let dbUrl = Bundle.main.url(forResource: "papalavrasdb", withExtension: "db")!
        let dbPath = dbUrl.path
        connection = try! Connection(dbPath)
    }
    
    // Retorna uma palavra aleatória do banco de dados.
    func random(character: String, wordCount: Int = 0) -> String? {
        
        guard let connection = connection else { return nil }
        
        let offset = Int.random(in: 0..<RandomRange.max(character: character))
        
        let query = scheme
            .select(word.word)
            .filter(word.character == character)
            .filter(word.count > wordCount)
            .limit(10, offset: offset)
        
        do {
            var words: [String] = []
            
            for word in try connection.prepare(query) {
                words.append(try word.get(Expression<String>("word")))
            }
            if !words.isEmpty {
                return words[Int.random(in: 0..<words.count)]
            }
        } catch {
            print(error)
        }
        return nil
    }
    
    // Verifica se um palavra existe no banco de dados.
    func verify(wordText: String) -> Bool {
        
        guard let connection = connection else { return false }
        
        let query = scheme
            .select(word.word)
            .where(word.word == wordText)
        
        
        do {
            for word in try connection.prepare(query) {
                let stringWord = try word.get(Expression<String>("word"))
                print(stringWord)
                if stringWord == wordText {
                    return true
                }
            }
        } catch {
            print(error)
        }
        return false
        
    }
    
}
