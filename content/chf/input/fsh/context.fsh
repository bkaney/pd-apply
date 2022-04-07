

Instance: ContextPatient
InstanceOf: Patient

Instance: ExistingOrder
InstanceOf: MedicationRequest
* status = #active
* intent = #order
* medicationCodeableConcept.text = "Medication A"
* subject = Reference(ContextPatient)

Instance: NewOrder
InstanceOf: MedicationRequest
* status = #draft
* intent = #proposal
* medicationCodeableConcept.text = "Medication B"
* subject = Reference(ContextPatient)

Instance: DiscontinueExistingOrder
InstanceOf: $cpg-task
* intent = #proposal
* status = #draft
* input
  * type = #discontinue-order
  * valueReference = Reference(ExitingOrder)

Instance: CreateNewOrder
InstanceOf: $cpg-task
* intent = #proposal
* status = #draft
* input
  * type = #new-order
  * valueReference = Reference(NewOrder)

Instance: ReplaceExistingWithNewOrder
InstanceOf: $cpg-task
* intent = #proposal
* status = #draft
* input[+]
  * type = #discontinue-order
  * valueReference = Reference(ExistingOrder)
* input[+]
  * type = #new-order
  * valueReference = Reference(NewOrder)

Instance: ContextOriginal
InstanceOf: Bundle
* type = #collection
* entry[+].resource = ContextPatient
* entry[+].resource = ExistingOrder

Instance: ContextTransientDiscontinue
InstanceOf: Bundle
* type = #collection
* entry[+].resource = ContextPatient
* entry[+].resource = ExistingOrder
* entry[+].resource = DiscontinueExistingOrder

Instance: ContextTransientCreateNew
InstanceOf: Bundle
* type = #collection
* entry[+].resource = ContextPatient
* entry[+].resource = ExistingOrder
* entry[+].resource = NewOrder
* entry[+].resource = CreateNewOrder

Instance: ContextTransientReplaceExiting
InstanceOf: Bundle
* type = #collection
* entry[+].resource = ContextPatient
* entry[+].resource = NewOrder
* entry[+].resource = ExistingOrder
* entry[+].resource = ReplaceExistingWithNewOrder


Instance: ExtractedAnswer
InstanceOf: CaseFeatureDefinition1
* status = #preliminary
* valueQuantity
  * value = 80
  * unit = #kg
  * code = #kg

Instance: ContextAnsweredQuestion
InstanceOf: Bundle
* type = #collection
* entry[+].resource = ContextPatient
* entry[+].resource = ExtractedAnswer