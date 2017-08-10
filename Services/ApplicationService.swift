//
//  PageService.swift
//  NewsNow
//
//  Created by DEVELMS on 07/11/16.
//
//

struct ApplicationService {
    
    func getApplication(success: @escaping () -> Void, fail: @escaping (_ error: String) -> Void) {
       /*
        Request.sharedInstance.APIRequest(method: .GET, endPoint: .application,
                                          
            success: { result in
                
                let sectionService = SectionService()
                
                Application.sharedInstance.sections = sectionService.parseSections(json: JSON(result))
                
                success()
                                            
        },  failure: { failure in
            
                if failure == 502 { fail("Desculpe, estamos com problemas no servidor, tente novamente mais tarde.") }
                else { fail("Parece que sua conexão não está muito boa.") }
        })
 */
    }
}
