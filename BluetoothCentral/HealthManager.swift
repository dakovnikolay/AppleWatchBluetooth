//
//  HealthManager.swift
//  VitelMed
//
//  Created by Vikas on 11/25/15.
//  Copyright © 2015 bviadmin. All rights reserved.
//

import UIKit
import Foundation
import HealthKit

struct HealthValue {
    static let kNoData : String = "nodata"
    static let kIdentifierTypeName : String = "healthdata_type"
    static let kIdentifierValue : String = "healthdata_value"
    static let kIdentifierDisplayUnit : String = "healthdata_unit"
    static let kRecordDate : String = "healthdata_date"
}

@available(iOS 8.0, *)
struct HealthKitData {
    
    
    
    static let BloodAlcoholContent: HKQuantityType = HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier.bloodAlcoholContent)!
    static let BloodAlcoholContentUnit : String = "%"
    static let BloodAlcoholContentDisplayUnit : String = "ml"
    
    static let BloodGlucose: HKQuantityType =    HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier.bloodGlucose)!
    static let BloodGlucoseUnit : String = "mg/dl"
    static let BloodGlucoseDisplayUnit : String = "mg/dL"
    
    
    static let BloodPressureSystolic: HKQuantityType =    HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier.bloodPressureSystolic)!
    static let BloodPressureSystolicUnit : String = "mmHg"
    static let BloodPressureSystolicDisplayUnit : String = "mmHg"
    
    static let BloodPressureDiastolic: HKQuantityType =    HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier.bloodPressureDiastolic)!
    static let BloodPressureDiastolicUnit : String = "mmHg"
    static let BloodPressureDiastolicDisplayUnit : String = "mmHg"
    
    static let BloodType: HKQuantityType =    HKObjectType.quantityTypeForIdentifier(HKCharacteristicTypeIdentifierBloodType)!
    
    
    static let DateOfBirth: HKCharacteristicType =    HKObjectType.characteristicTypeForIdentifier(HKCharacteristicTypeIdentifierDateOfBirth)!
    
    static let BiologicalSex: HKQuantityType =    HKObjectType.quantityTypeForIdentifier(HKCharacteristicTypeIdentifierBiologicalSex)!
    
    
    static let BodyMass: HKQuantityType =    HKObjectType.quantityTypeForIdentifier(HKQuantityTypeIdentifierBodyMass)!
    static let BodyMassUnit : String = "kg"
    static let BodyMassDisplayUnit : String = "Kg"
    
    static let BodyMassIndex: HKQuantityType =    HKObjectType.quantityTypeForIdentifier(HKQuantityTypeIdentifierBodyMassIndex)!
    static let BodyMassIndexUnit : String = "count"
    static let BodyMassIndexDisplayUnit : String = "BMI"
    
    static let BodyTemperature: HKQuantityType =    HKObjectType.quantityTypeForIdentifier(HKQuantityTypeIdentifierBodyTemperature)!
    static let BodyTemperatureUnit : String = "degF"
    static let BodyTemperatureDisplayUnit : String = "Fahrenheit"
    
    static let DistanceCycling: HKQuantityType =    HKObjectType.quantityTypeForIdentifier(HKQuantityTypeIdentifierDistanceCycling)!
    //    static let DistanceCyclingUnit : String = "mi"
    static let DistanceCyclingUnit : String = "km"
    //vks need to change
    static let DistanceCyclingDisplayUnit : String = "Km"
    
    
    static let DietaryCholesterol: HKQuantityType =    HKObjectType.quantityTypeForIdentifier(HKQuantityTypeIdentifierDietaryCholesterol)!
    static let DietaryCholesterolUnit : String = "mg"
    static let DietaryCholesterolDisplayUnit : String = "mg/dl"
    
    static let HeartRate: HKQuantityType =    HKObjectType.quantityTypeForIdentifier(HKQuantityTypeIdentifierHeartRate)!
    static let HeartRateUnit : String = "count/min"
    static let HeartRateDisplayUnit : String = "bpm"
    
    static let Height: HKQuantityType =    HKObjectType.quantityTypeForIdentifier(HKQuantityTypeIdentifierHeight)!
    static let HeightUnit : String = "cm"
    static let HeightDisplayUnit : String = "cm"
    
    static let OxygenSaturation: HKQuantityType =    HKObjectType.quantityTypeForIdentifier(HKQuantityTypeIdentifierOxygenSaturation)!
    static let OxygenSaturationUnit : String = "%"
    static let OxygenSaturationDisplayUnit : String = "%"
    
    static let PeakExpiratoryFlowRate: HKQuantityType =    HKObjectType.quantityTypeForIdentifier(HKQuantityTypeIdentifierPeakExpiratoryFlowRate)!
    static let PeakExpiratoryFlowRateUnit : String = "L/min"
    static let PeakExpiratoryFlowRateDisplayUnit : String = "L/min"
    
    static let RespiratoryRate: HKQuantityType =    HKObjectType.quantityTypeForIdentifier(HKQuantityTypeIdentifierRespiratoryRate)!
    static let RespiratoryRateUnit : String = "count/min"
    //    static let RespiratoryRateUnit : String = "count/s"
    static let RespiratoryRateDisplayUnit : String = "breaths/min"
    
    
    
    @available(iOS 9.0, *)
    static let DietaryWater: HKQuantityType =    HKObjectType.quantityTypeForIdentifier(HKQuantityTypeIdentifierDietaryWater)!
    //    static let DietaryWaterUnit : String = "L"
    static let DietaryWaterUnit : String = "ml"
    static let DietaryWaterDisplayUnit : String = "L"
    
}

@available(iOS 8.0, *)
class HealthManager: NSObject{
    
    
    
    static let sharedInstance = HealthManager()
    
    override init() {
        HealthStore = HKHealthStore()
    }
    
    
    var HealthStore : AnyObject
    
    func isHealthAvailable ( ) -> Bool
    {
        return HKHealthStore.isHealthDataAvailable()
    }
    
    private func dataTypesToRead() -> Set<HKObjectType>
    {
        let healthKitTypesToRead : Set<HKObjectType>
        
        if #available(iOS 9.0, *) {
            healthKitTypesToRead = Set(arrayLiteral:
                HKObjectType.quantityTypeForIdentifier(HKQuantityTypeIdentifierBloodAlcoholContent)!,
                                       HKObjectType.quantityTypeForIdentifier(HKQuantityTypeIdentifierBloodGlucose)!,
                                       HKObjectType.quantityTypeForIdentifier(HKQuantityTypeIdentifierBloodPressureSystolic)!,
                                       HKObjectType.quantityTypeForIdentifier(HKQuantityTypeIdentifierBloodPressureDiastolic)!,
                                       
                                       HKObjectType.characteristicTypeForIdentifier(HKCharacteristicTypeIdentifierBloodType)!,
                                       HKObjectType.characteristicTypeForIdentifier(HKCharacteristicTypeIdentifierDateOfBirth)!,
                                       HKObjectType.characteristicTypeForIdentifier(HKCharacteristicTypeIdentifierBiologicalSex)!,
                                       HKObjectType.quantityTypeForIdentifier(HKQuantityTypeIdentifierBodyMass)!,
                                       HKObjectType.quantityTypeForIdentifier(HKQuantityTypeIdentifierBodyMassIndex)!,
                                       HKObjectType.quantityTypeForIdentifier(HKQuantityTypeIdentifierBodyTemperature)!,
                                       HKObjectType.quantityTypeForIdentifier(HKQuantityTypeIdentifierDistanceCycling)!,
                                       HKObjectType.quantityTypeForIdentifier(HKQuantityTypeIdentifierDietaryCholesterol)!,
                                       HKObjectType.quantityTypeForIdentifier(HKQuantityTypeIdentifierHeartRate)!,
                                       HKObjectType.quantityTypeForIdentifier(HKQuantityTypeIdentifierHeight)!,
                                       HKObjectType.quantityTypeForIdentifier(HKQuantityTypeIdentifierOxygenSaturation)!,
                                       HKObjectType.quantityTypeForIdentifier(HKQuantityTypeIdentifierPeakExpiratoryFlowRate)!,
                                       HKObjectType.quantityTypeForIdentifier(HKQuantityTypeIdentifierRespiratoryRate)!,
                                       HKObjectType.quantityTypeForIdentifier(HKQuantityTypeIdentifierDietaryWater)!
            )
        } else {
            // Fallback on earlier versions
            healthKitTypesToRead = Set(arrayLiteral:
                HKObjectType.quantityTypeForIdentifier(HKQuantityTypeIdentifierBloodAlcoholContent)!,
                                       HKObjectType.quantityTypeForIdentifier(HKQuantityTypeIdentifierBloodGlucose)!,
                                       HKObjectType.quantityTypeForIdentifier(HKQuantityTypeIdentifierBloodPressureSystolic)!,
                                       HKObjectType.quantityTypeForIdentifier(HKQuantityTypeIdentifierBloodPressureDiastolic)!,
                                       HKObjectType.characteristicTypeForIdentifier(HKCharacteristicTypeIdentifierBloodType)!,
                                       HKObjectType.characteristicTypeForIdentifier(HKCharacteristicTypeIdentifierDateOfBirth)!,
                                       HKObjectType.characteristicTypeForIdentifier(HKCharacteristicTypeIdentifierBiologicalSex)!,
                                       HKObjectType.quantityTypeForIdentifier(HKQuantityTypeIdentifierBodyMass)!,
                                       HKObjectType.quantityTypeForIdentifier(HKQuantityTypeIdentifierBodyMassIndex)!,
                                       HKObjectType.quantityTypeForIdentifier(HKQuantityTypeIdentifierBodyTemperature)!,
                                       HKObjectType.quantityTypeForIdentifier(HKQuantityTypeIdentifierDistanceCycling)!,
                                       HKObjectType.quantityTypeForIdentifier(HKQuantityTypeIdentifierDietaryCholesterol)!,
                                       HKObjectType.quantityTypeForIdentifier(HKQuantityTypeIdentifierHeartRate)!,
                                       HKObjectType.quantityTypeForIdentifier(HKQuantityTypeIdentifierHeight)!,
                                       HKObjectType.quantityTypeForIdentifier(HKQuantityTypeIdentifierOxygenSaturation)!,
                                       HKObjectType.quantityTypeForIdentifier(HKQuantityTypeIdentifierPeakExpiratoryFlowRate)!,
                                       HKObjectType.quantityTypeForIdentifier(HKQuantityTypeIdentifierRespiratoryRate)!
            )
        }
        return healthKitTypesToRead
    }
    
    
    func CheckAuthorizationStatusFor ( readWriteTypes : Set<HKObjectType>) -> Void
    {
        
        for demoType  in readWriteTypes
        {
            //       let dbType   = HKQuantityType.quantityTypeForIdentifier(HKCharacteristicTypeIdentifierDateOfBirth)
            let status : HKAuthorizationStatus =  (HealthStore as! HKHealthStore).authorizationStatusForType(demoType)
            
            if(status == HKAuthorizationStatus.SharingAuthorized)
            {
                
            }
            else if(status == HKAuthorizationStatus.SharingDenied)
            {
                
            }
            else if(status == HKAuthorizationStatus.NotDetermined)
            {
                
            }
            
        }
    }
    
    func authorizeHealthKit (SuccessCompletion: (((success : Bool) -> Void)!) , FailureCompletion: ((( err : NSError? ) -> Void)!) )
    {
        if !isHealthAvailable()
        {
            let error = NSError(domain: "com.raywenderlich.tutorials.healthkit", code: 2, userInfo: [NSLocalizedDescriptionKey:"HealthKit is not available in this Device"])
            
            FailureCompletion(err: error)
            return;
        }
        
        // 4.  Request HealthKit authorization
        (HealthStore as! HKHealthStore).requestAuthorizationToShareTypes(nil, readTypes: dataTypesToRead()) { (success, error) -> Void in
            
            //            self.CheckAuthorizationStatusFor(self.dataTypesToRead())
            
            
            if (success)
            {
                
                SuccessCompletion(success: success)
                return;
            }
            else
            {
                
                FailureCompletion(err: error)
                return;
            }
            
        }
    }
    
    
    
    
    
    
    
    func getBilogicalSex () -> String
    {
        
        var strBiologicalSex = HealthValue.kNoData
        //        var bloodType:HKBloodTypeObject = HKBloodTypeObject()
        do {
            let  bioSexType = try (self.HealthStore as! HKHealthStore).biologicalSex()
            strBiologicalSex = biologicalSexLiteral(bioSexType.biologicalSex)
        } catch _ as NSError {
            strBiologicalSex = HealthValue.kNoData
        }
        
        return strBiologicalSex
    }
    
    
    
    
    
    
    
    
    //MARK:Get BiologicalSex
    func biologicalSexLiteral(biologicalSex:HKBiologicalSex?)->String
    {
        var biologicalSexText = HealthValue.kNoData;
        
        if  biologicalSex != nil {
            
            switch( biologicalSex! )
            {
            case .Female:
                biologicalSexText = "Female"
            case .Male:
                biologicalSexText = "Male"
            case .Other:
                biologicalSexText = "Unknown"
            default:
                biologicalSexText = HealthValue.kNoData
            }
        }
        
        return biologicalSexText
    }
    
    //MARK:Get DOB
    func  getDateOfBirth () -> String
    {
        var strDOB = HealthValue.kNoData
        
        let dateOfBirth: NSDate?
        
        do {
            
            dateOfBirth = try (self.HealthStore as! HKHealthStore).dateOfBirth()
            
        } catch _ as NSError {
            
            dateOfBirth = nil
            strDOB = HealthValue.kNoData
        }
        
        
        
        if dateOfBirth == nil {
            
            strDOB = HealthValue.kNoData
        }
        
        if let validDateOfBirth = dateOfBirth
        {
            let dateFormatter = NSDateFormatter()
            //get in indian style
            dateFormatter.dateFormat = "dd-MM-YYYY"
            //            dateFormatter.dateFormat = "MM/dd/YYYY"
            //            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"//this your string date format
            //            dateFormatter.dateStyle = .MediumStyle
            
            //change date formatter here later as need
            //static vks
            strDOB = dateFormatter.stringFromDate(validDateOfBirth)
        }
        
        
        return strDOB
    }
    
    //MARK:Get bloodtype
    func getBloodType () -> String
    {
        var strBloodType = HealthValue.kNoData
        //        var bloodType:HKBloodTypeObject = HKBloodTypeObject()
        do {
            let  bloodType = try (self.HealthStore as! HKHealthStore).bloodType()
            
            
            strBloodType = bloodTypeLiteral(bloodType.bloodType)
        } catch _ as NSError {
            strBloodType = HealthValue.kNoData
        }
        
        return strBloodType
    }
    
    func bloodTypeLiteral(bloodType:HKBloodType?)->String
    {
        var bloodTypeText = HealthValue.kNoData;
        
        if bloodType != nil {
            
            switch( bloodType! ) {
            case .APositive:
                bloodTypeText = "A+"
            case .ANegative:
                bloodTypeText = "A-"
            case .BPositive:
                bloodTypeText = "B+"
            case .BNegative:
                bloodTypeText = "B-"
            case .ABPositive:
                bloodTypeText = "AB+"
            case .ABNegative:
                bloodTypeText = "AB-"
            case .OPositive:
                bloodTypeText = "O+"
            case .ONegative:
                bloodTypeText = "O-"
            default:
                bloodTypeText = HealthValue.kNoData;
            }
            
        }
        return bloodTypeText
    }
    
    //MARK:get data from healthKit
    func getHealthDataValue ( HealthQuantityType : HKQuantityType , strUnitType : String , GetBackFinalhealthData: ((( healthValues : [AnyObject] ) -> Void)!) )
    {
        
        if let heartRateType = HKQuantityType.quantityTypeForIdentifier(HealthQuantityType.identifier)
        {
            if (HKHealthStore.isHealthDataAvailable()  ){
                
                let sortByTime = NSSortDescriptor(key:HKSampleSortIdentifierEndDate, ascending:false)
                
                //            let timeFormatter = NSDateFormatter()
                //            timeFormatter.dateFormat = "hh:mm:ss"
                //yyyy-MM-dd'T'HH:mm:ss.SSSZZZZ
                
                let dateFormatter = NSDateFormatter()
                dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
                
                let query = HKSampleQuery(sampleType:heartRateType, predicate:nil, limit:7, sortDescriptors:[sortByTime], resultsHandler:{(query, results, error) in
                    
                    guard let results = results else {
                        
                        //include the healthkit error in log
                        if let errorDescription = error!.description as String?
                        {
                            
                            GetBackFinalhealthData (healthValues: [HealthValue.kNoData])
                        }
                        return
                    }
                    
                    var arrHealthValues     = [AnyObject]()
                    
                    for quantitySample in results {
                        let quantity = (quantitySample as! HKQuantitySample).quantity
                        let healthDataUnit : HKUnit
                        if (strUnitType.length > 0 ){
                            healthDataUnit = HKUnit(fromString: strUnitType)
                        }else{
                            healthDataUnit = HKUnit.countUnit()
                        }
                        
                        let tempActualhealthData = "\(quantity.doubleValueForUnit(healthDataUnit))"
                        let tempActualRecordedDate = "\(dateFormatter.stringFromDate(quantitySample.startDate))"
                        if  (tempActualhealthData.length > 0){
                            let dicHealth : [String:AnyObject] = [HealthValue.kIdentifierValue :tempActualhealthData , HealthValue.kRecordDate :tempActualRecordedDate , HealthValue.kIdentifierDisplayUnit : strUnitType ]
                            
                            arrHealthValues.append(dicHealth)
                        }
                    }
                    
                    if  (arrHealthValues.count > 0)
                    {
                        GetBackFinalhealthData (healthValues: arrHealthValues)
                    }
                    else
                    {
                        GetBackFinalhealthData (healthValues: [HealthValue.kNoData])
                    }
                })
                (self.HealthStore as! HKHealthStore).executeQuery(query)
            }
        }
    }
    
    
    
}

extension Array where Element : Hashable {
    var unique: [Element] {
        return Array(Set(self))
    }
}

extension String {
    var length : Int {
        return self.characters.count
    }
}

