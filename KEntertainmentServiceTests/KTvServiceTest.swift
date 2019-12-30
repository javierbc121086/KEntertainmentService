//
//  KTvServiceTest.swift
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
 Clase encargada de manejar las pruebas unitarias del flujo Tv
 */
class KTvServiceTest: XCTestCase, KTvServiceDelegate {
    
    private var _tvService: KTvService?
    private var _expectation: XCTestExpectation?
    private var _isFailed = false
    
    override func setUp() {
        super.setUp()
        _isFailed = false
        _tvService = KTvService(identifierService: KHelperTest.MockIdentifierCoreService)
        _tvService?.delegate = self
    }
    
    override func tearDown() {
        super.tearDown()
        _tvService?.removeReferenceContext()
        _tvService = nil
        _expectation = nil
    }
    
    /**
     * SUCCESS
     */
    
    /********************************************************************
     ** Prueba que ejecuta el servicio Popularity Tv Show Exitosamente **
     ********************************************************************/
    func testGetPopularityTvShowSuccess() {
        _expectation = expectation(description: "::: Get Popularity Tv")
        
        let tokenUrl = String(
            format: KServiceConfig.tv_popular, KGlobalMock.apiToken
        )
        _tvService?.httpGetRest(
            url: tokenUrl,
            extraHeaders: nil,
            gnRequestType: KHttpRequestType.tvPopularity.rawValue)
        
        self.waitForExpectations(timeout: GNConfigService.TimeOutInterval, handler: nil)
    }
    
    /**************************************************************
     ** Prueba que ejecuta el servicio Rate Tv Show Exitosamente **
     **************************************************************/
    func testGetRateTvShowSuccess() {
        _expectation = expectation(description: "::: Get Rate Tv")
        
        let tokenUrl = String(
            format: KServiceConfig.tv_rated, KGlobalMock.apiToken
        )
        _tvService?.httpGetRest(
            url: tokenUrl,
            extraHeaders: KGlobalMock.SessionHeader,
            gnRequestType: KHttpRequestType.tvRate.rawValue)
        
        self.waitForExpectations(timeout: GNConfigService.TimeOutInterval, handler: nil)
    }
    
    /******************************************************************
     ** Prueba que ejecuta el servicio Upcoming Tv Show Exitosamente **
     ******************************************************************/
    func testGetUpcomingTvShowSuccess() {
        _expectation = expectation(description: "::: Get Uncoming Tv")
        
        let tokenUrl = String(
            format: KServiceConfig.tv_upcoming,
            KGlobalMock.apiToken,
            KGlobalMock.dateFilter
        )
        _tvService?.httpGetRest(
            url: tokenUrl,
            extraHeaders: nil,
            gnRequestType: KHttpRequestType.tvUpcoming.rawValue)
        
        self.waitForExpectations(timeout: GNConfigService.TimeOutInterval, handler: nil)
    }
    
    /**
     * FAIL
     */
    
    /******************************************************************
     ** Prueba que ejecuta el servicio Popularity Tv Show No Exitosa **
     ******************************************************************/
    func testGetPopularityTvShowFail() {
        _isFailed = true
        _expectation = expectation(description: "::: Fail Get Popularity Tv")
        
        _tvService?.httpGetRest(
            url: KServiceConfig.tv_popular,
            extraHeaders: nil,
            gnRequestType: KHttpRequestType.tvPopularity.rawValue)
        
        self.waitForExpectations(timeout: GNConfigService.TimeOutInterval, handler: nil)
    }
    
    /************************************************************
     ** Prueba que ejecuta el servicio Rate Tv Show No Exitosa **
     ************************************************************/
    func testGetRateTvShowFail() {
        _isFailed = true
        _expectation = expectation(description: "::: Fail Get Rate Tv")
        
        _tvService?.httpGetRest(
            url: KServiceConfig.tv_rated,
            extraHeaders: KGlobalMock.SessionHeader,
            gnRequestType: KHttpRequestType.tvRate.rawValue)
        
        self.waitForExpectations(timeout: GNConfigService.TimeOutInterval, handler: nil)
    }
    
    /****************************************************************
     ** Prueba que ejecuta el servicio Upcoming Tv Show No Exitosa **
     ****************************************************************/
    func testGetUpcomingTvShowFail() {
        _isFailed = true
        _expectation = expectation(description: "::: Fail Get Uncoming Tv")
        
        _tvService?.httpGetRest(
            url: KServiceConfig.tv_upcoming,
            extraHeaders: nil,
            gnRequestType: KHttpRequestType.tvUpcoming.rawValue)
        
        self.waitForExpectations(timeout: GNConfigService.TimeOutInterval, handler: nil)
    }
    
    /**
     * DELEGATES
     */
    
    /**********************
     ** RESPONSE SUCCESS **
     **********************/
    func dataResponseService(response: [KTvModel], type: KHttpRequestType) {
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
