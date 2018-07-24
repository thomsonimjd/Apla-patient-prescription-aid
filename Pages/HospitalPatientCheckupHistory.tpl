DBFind("HospitalPatient",pt_source).Where("regno='#regno#'").Custom(PhotoImage){
				Image(Src: Binary().ById(#image#), Class: img-squre).Style(width: 80px; border: 1px solid #5A5D63;)
				}.Vars(patient)

DBFind("HosptialPatientAdmission",admission_source).Where("id='#admission#'").Vars(admission)
DBFind("HospitalPatientMedicine",checkup_source).Where("admission='#admission#'").Custom(ScanImage){
				Image(Src: Binary().ById(#scan#), Class: img-squre).Style(width: 80px; border: 1px solid #5A5D63;)
				}.Vars(medicine)

DBFind("hospitalpatientmedicinelist",medicine_source).Where("medicine_id='#medicine_id#'").Vars(medicine_list)

Div(Class: content-wrapper){
		Div(Class:panel-body row){
			Image(Src: Binary().ById(6))
		}

		Div(Class: breadcrumb){
			LinkPage(Home, HospitalHome)
			Span(/).Style(margin-right: 10px; margin-left: 10px;)
			Span(Body: History, Class: text-muted)
		}
	
		Div(Class: row df f-valign){
       		Div(Class: col-md-1)
        		Div(Class: col-md-10){
					Div(Class: panel panel-info){
                		Div(Class: panel-heading, Body: Patient)
						Form(){
							Div(Class: list-group-item){
								Div(Class: table table-responsive){
									Table(pt_source,"Reg#=regno,Name=name,Age=age,Dob=dob,Insurance#=insurance,Insurance Name=insurancename,Eamil=email,Gender=gender,Photo=PhotoImage")
								}
							}
						}
					}
				}
		}

			Div(Class: row df f-valign){
       		Div(Class: col-md-1)
        		Div(Class: col-md-10){
					Div(Class: panel panel-info){
                		Div(Class: panel-heading, Body: Admission)
						Form(){
							Div(Class: list-group-item){
								Div(Class: table table-responsive){
									Table(admission_source,"Hospital=hospital,Date=date,Time=time,Weight=weight,Height=height,Helath Condition=healthcondition,Illness=illness,Medication=medication,Surgery=surgery,Reason=reason")
								}
							}
						}
					}
				}
		}

			Div(Class: row df f-valign){
       		Div(Class: col-md-1)
        		Div(Class: col-md-10){
					Div(Class: panel panel-info){
                		Div(Class: panel-heading, Body: Check Up)
						Form(){
							Div(Class: list-group-item){
								Div(Class: table table-responsive){
									Table(checkup_source,"Doctor=dotor,Doctor Comments=comment, Any other diease found?=disease,Scan/Xray=ScanImage")
								}
							}
						}
					}
				}
		}

			Div(Class: row df f-valign){
       		Div(Class: col-md-1)
        		Div(Class: col-md-10){
					Div(Class: panel panel-info){
                		Div(Class: panel-heading, Body: Prescription)
						Form(){
							Div(Class: list-group-item){
								Div(Class: table table-responsive){
									Table(medicine_source,"Medicine Name=name,Time To Take=time,Quantatiy To Take=quantity")
								}
							}
						}
					}
				}
		}

}
