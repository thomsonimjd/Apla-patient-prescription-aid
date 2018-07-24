DBFind("HospitalPatient",pt_source).Columns("id,regno,name")
DBFind("Hospital",hp_source).Columns("id,name")
DBFind("HospitalPatient",selected_pt_source).Where("regno='#regno#'").Custom(PhotoImage){
				Image(Src: Binary().ById(#image#), Class: img-squre).Style(width: 80px; border: 1px solid #5A5D63;)
				}.Vars(patient)
Data(healthcondition,"name,id"){
Diabetes,Diabetes
Heart Disease,Heart Disease
Asthma,Asthma
High Blood Pressure,High Blood Pressure
None, None
}
Div(Class: content-wrapper){
		Div(Class:panel-body row){
			Image(Src: Binary().ById(6))
		}
		
	Div(Class: breadcrumb){
		LinkPage(Home, HospitalHome)
		Span(/).Style(margin-right: 10px; margin-left: 10px;)
		Span(Body: Admission, Class: text-muted)
	}
  

	Div(Class: row df f-valign){
       Div(Class: col-md-1)
        Div(Class: col-md-10){

			Div(Class: panel panel-info){
                Div(Class: h1 panel-heading h1, Body: Select Patient)
                Form(){
					Div(Class: list-group-item){

                        Div(Class: row df f-valign){
								Div(Class: col-md-3 text-right) {
                                	Span(Body: Patient)
                                }
                                Div(Class: col-md-9 text-center mb-lg) {
									Div(Class: col-md-7){
									 Select(Name: Patient, Source: pt_source,NameColumn: "regno",ValueColumn: "regno")
									}
									Div(Class: col-md-2){
									 Button(Body: Check, Class:btn btn-primary, Page:HosptialPatientAdmission,PageParams:"regno=Val(Patient)")
									 
									}
                                }

									Div(Class: col-md-12 text-right) {
                                		Table(selected_pt_source,"Reg#=regno,Name=name,Email=email,Phone#=phone,Age=age,Dob=dob,Insurance Name=insurancename,Insurance #=insurance,Address=address,Photo=PhotoImage")
                                	}
						}

					}
				}
			}
		}
	}

	Div(Class: row df f-valign){
       Div(Class: col-md-2)
        Div(Class: col-md-8){
			Div(Class: panel panel-info){
                Div(Class: h1 panel-heading h1, Body: Patient Admission Form)
                Form(){
					Div(Class: list-group-item){

                        	Div(Class: row df f-valign){

								Div(Class: col-md-3 text-right) {
                                	Span(Body: Hospital)
                                }
                                Div(Class: col-md-9 text-center mb-lg) {
									Select(Name: Hospital, Source: hp_source,NameColumn: "name",ValueColumn: "name")
								}
								Div(Class: col-md-3 text-right) {
                                	Span(Body: Date)
                                }
                                Div(Class: col-md-9 text-center mb-lg) {
									Input(Name: Date, Type: date, Placeholder: Date of Admission)
								}
								Div(Class: col-md-3 text-right) {
                                	Span(Body: Time)
                                }
                                Div(Class: col-md-9 text-center mb-lg) {
									Input(Name: Time, Type: time, Placeholder: Time of Admission)
								}
								Div(Class: col-md-3 text-right) {
                                	Span(Body: Weight)
                                }
                                Div(Class: col-md-9 text-center mb-lg) {
									Input(Name: Weight, Type: number, Placeholder: Current Weight of Patient)
								}
								Div(Class: col-md-3 text-right) {
                                	Span(Body: Height)
                                }
                                Div(Class: col-md-9 text-center mb-lg) {
									Input(Name: Height, Type: number, Placeholder: Current Height of Patient)
								}

								Div(Class: col-md-3 text-right) {
                                	Span(Body: Does patient have any health conditions?)
                                }
                                Div(Class: col-md-9 text-center mb-lg) {
									 Select(Name: HealthCondition, Source: healthcondition,NameColumn: "name",ValueColumn: "value")
								}
								Div(Class: col-md-3 text-right) {
                                	Span(Body: Other illness?)
                                }
                                Div(Class: col-md-9 text-center mb-lg) {
									 Input(Name: Illness, Type: text, Placeholder: Any other illness)
								}
								Div(Class: col-md-3 text-right) {
                                	Span(Body: Does patient take any regular medications?)
                                }
                                Div(Class: col-md-9 text-center mb-lg) {
									 Input(Name: Medication, Type: text, Placeholder: Any Regular Medications)
								}
								Div(Class: col-md-3 text-right) {
                                	Span(Body: Does patient have any allergies?)
                                }
                                Div(Class: col-md-9 text-center mb-lg) {
									 Input(Name: Allergies, Type: text, Placeholder: Any Allergies)
								}
								Div(Class: col-md-3 text-right) {
                                	Span(Body: did patient have any surgery? Please detail)
                                }
                                Div(Class: col-md-9 text-center mb-lg) {
									 Input(Name: Surgery, Type: textarea, Placeholder: Previous Major Surgery in the last 5 years)
								}
								Div(Class: col-md-3 text-right) {
                                	Span(Body: Reason for admission)
                                }
                                Div(Class: col-md-9 text-center mb-lg) {
									 Input(Name: Reason, Type: textarea, Placeholder: Reason for taking admission)
								}
							}
					}
					Div(Class: panel-footer clearfix){
                        Div(Class: pull-right){
                            Button(Body: Admit, Class: btn btn-primary, Contract: HospitalPatientAdmission, Params:"regno=#patient_regno#,name=#patient_name#")
                        }  
					}
				}
			}
		}
	}

	Div(Class: row df f-valign){
            Div(Class: col-md-3)
            Div(Class: list-group-item col-md-6){
				DBFind("hosptialpatientadmission",open_pt_ad_source).Columns("id,name,regno,date,time,reason,status").Where("status='OPEN'").Custom(action){
					Button(Body:Examine,Class: btn btn-warning,Page:HospitalPatientCheckUp,PageParams:"name=#name#,regno=#regno#,admission=#id#")
				}
				DBFind("hosptialpatientadmission",comp_pt_ad_source).Columns("id,name,regno,date,time,reason,status").Where("status='CLOSED'").Custom(action){
					Button(Body:Open,Class: btn btn-warning,Page:HospitalPatientCheckUpHistory,PageParams:"name=#name#,regno=#regno#,admission=#id#")
				}
				Div(Class: table table-responsive table-bordered table-hover){
					Div(Class: h1 panel-heading h1, Body: Open Admissions)
					Table(Source: open_pt_ad_source,"Name=name,Reg#=regno,Admission Date=date,Time=time,Reason=reason,Actions=action")
				}
				Div(Class: table table-responsive table-bordered table-hover){
				 	Div(Class: h1 panel-heading h1, Body: Completed Admissions)
					Table(Source: comp_pt_ad_source,"Name=name,Reg#=regno,Admission Date=date,Time=time,Reason=reason,Actions=action")
				}
                
            }   
     }
}
