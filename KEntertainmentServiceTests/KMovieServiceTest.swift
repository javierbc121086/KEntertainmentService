//
//  KMovieServiceTest.swift
//  KEntertainmentServiceTests
//
//  Created by Javier Bolaños on 12/29/19.
//  Copyright © 2019 Javier Bolaños. All rights reserved.
//

import XCTest
import GNNetworkServices
import KEntertainmentDomain

@testable import KEntertainmentService

/**
 Clase encargada de manejar las pruebas unitarias del flujo Movie
 */
class KMovieServiceTest: XCTestCase, KMovieServiceDelegate {
    
    private var _movieService: KMovieService?
    private var _expectation: XCTestExpectation?
    private var _isFailed = false
    
    override func setUp() {
        super.setUp()
        _isFailed = false
        _movieService = KMovieService(identifierService: KHelperTest.MockIdentifierCoreService)
        _movieService?.delegate = self
    }
    
    override func tearDown() {
        super.tearDown()
        _movieService?.removeReferenceContext()
        _movieService = nil
        _expectation = nil
    }
    
    /**
     * SUCCESS
     */
    
    /*******************************************************************
     ** Prueba que ejecuta el servicio Popularity Movies Exitosamente **
     *******************************************************************/
    func testGetPopularityMoviesSuccess() {
        _expectation = expectation(description: "::: Get Popularity Movies")
        
        _movieService?.httpGetRest(
            url: KServiceConfig.movie_popular,
            extraHeaders: KGlobalMock.SessionHeader,
            gnRequestType: KHttpRequestType.moviePopularity.rawValue)
        
        self.waitForExpectations(timeout: GNConfigService.TimeOutInterval, handler: nil)
    }
    
    /*************************************************************
     ** Prueba que ejecuta el servicio Rate Movies Exitosamente **
     *************************************************************/
    func testGetRateMoviesSuccess() {
        _expectation = expectation(description: "::: Get Rate Movies")
        
        _movieService?.httpGetRest(
            url: KServiceConfig.movie_rated,
            extraHeaders: KGlobalMock.SessionHeader,
            gnRequestType: KHttpRequestType.movieRate.rawValue)
        
        self.waitForExpectations(timeout: GNConfigService.TimeOutInterval, handler: nil)
    }
    
    /*************************************************************
     ** Prueba que ejecuta el servicio Rate Movier Exitosamente **
     *************************************************************/
    func testGetUpcomingMoviesSuccess() {
        _expectation = expectation(description: "::: Get Upcoming Movies")
        
        let tokenUrl = String(format: KServiceConfig.movie_upcoming, KGlobalMock.apiToken)
        _movieService?.httpGetRest(
            url: tokenUrl,
            extraHeaders: nil,
            gnRequestType: KHttpRequestType.movieUpcoming.rawValue)
        
        self.waitForExpectations(timeout: GNConfigService.TimeOutInterval, handler: nil)
    }
    
    /**
     * FAIL
     */
    
    /*****************************************************************
     ** Prueba que ejecuta el servicio Popularity Movies No Exitoso **
     *****************************************************************/
    func testGetPopularityMoviesFail() {
        _isFailed = true
        _expectation = expectation(description: "::: Fail Get Popularity Movies")
        
        _movieService?.httpGetRest(
            url: KServiceConfig.movie_popular,
            extraHeaders: nil,
            gnRequestType: KHttpRequestType.moviePopularity.rawValue)
        
        self.waitForExpectations(timeout: GNConfigService.TimeOutInterval, handler: nil)
    }
    
    /***********************************************************
     ** Prueba que ejecuta el servicio Rate Movies No Exitoso **
     ***********************************************************/
    func testGetRateMoviesFail() {
        _isFailed = true
        _expectation = expectation(description: "::: Fail Get Rate Movies")
        
        _movieService?.httpGetRest(
            url: KServiceConfig.movie_rated,
            extraHeaders: nil,
            gnRequestType: KHttpRequestType.movieRate.rawValue)
        
        self.waitForExpectations(timeout: GNConfigService.TimeOutInterval, handler: nil)
    }
    
    /***********************************************************
     ** Prueba que ejecuta el servicio Rate Movier No Exitoso **
     ***********************************************************/
    func testGetUpcomingMoviesFail() {
        _isFailed = true
        _expectation = expectation(description: "::: Fail Get Upcoming Movies")
        
        _movieService?.httpGetRest(
            url: KServiceConfig.movie_upcoming,
            extraHeaders: nil,
            gnRequestType: KHttpRequestType.movieUpcoming.rawValue)
        
        self.waitForExpectations(timeout: GNConfigService.TimeOutInterval, handler: nil)
    }
    
    /**
     * DELEGATES
     */
    
    /**********************
     ** RESPONSE SUCCESS **
     **********************/
    func dataResponseService(response: [KMovieModel], type: KHttpRequestType) {
        _expectation?.fulfill()
        XCTAssertTrue(response.isNotEmpty)
    }
    
    /********************
     ** RESPONSE ERROR **
     ********************/
    func requestFailWithError(error: Error) {
        _expectation?.fulfill()
        
        if _isFailed {
            XCTAssert(!error.localizedDescription.isEmpty)
        }
        else {
            XCTFail("\n::: Error: \(error.localizedDescription)")
        }
    }
}
