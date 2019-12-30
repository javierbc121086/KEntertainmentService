//
//  KGlobalMock.swift
//  KEntertainmentServiceTests
//
//  Created by Javier Bolaños on 12/29/19.
//  Copyright © 2019 Javier Bolaños. All rights reserved.
//

/**
 Estructura encargada de proveer datos de prueba sobre permisos y session del servicor.
 */
struct KGlobalMock {
    
    /**
     Token generado para poder obtener información de los webservice https://api.themoviedb.org
     
     ## Nota##
     El token solo es valido parqa los webservice que esten migrados a la versión V4
     */
    private static let token = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJmNTc1YWY0MjQzNjkxNzUwZjE2OGM5ZmE3ZGNkZmQzYyIsInN1YiI6IjVkNzU4ZmRmNTI5NGU3MDAwZWY0NmQ2MiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.NT-V44hdmZtqg3syj3okOe3t1Vc4LX_2ddpvvshZuCo"
    
    
    /**
     Token generado para poder obtener información de los webservice https://api.themoviedb.org
     
     ## Nota##
     El token solo es valido para los webservice que esten sobre la versión V3
     */
    static let apiToken = "f575af4243691750f168c9fa7dcdfd3c"
    
    /**
     Diccionario que nos sirve de apoyo, para generar la cabecera Authorization: Bearer, sobre las apis V4
     */
    static var SessionHeader: [String: String] {
        return ["Authorization" : "Bearer \(token)"]
    }
    
    /**
     Fecha prueba para poder obtener los Tv Shows sonde su fecha es igual o mayor a la fecha definida en la contante
     */
    static let dateFilter = "2019-09-09"
}
