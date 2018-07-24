DBFind("HospitalPatient",selected_pt_source).Where("regno='#regno#'").Custom(PhotoImage){
				Image(Src: Binary().ById(#image#), Class: img-squre).Style(width: 80px; border: 1px solid #5A5D63;)
				}.Vars(patient)

DBFind("HosptialPatientAdmission",selected_pt_admission_source).Where("id='#admission#'")
DBFind("hospitaldoctor",doctor_source).Columns("id,name")
Data(disease,"name,value"){
	None,None
	Cholera,Cholera
	Yellow fever,Yellow fever
	Venereal Disease,Venereal Disease
	Plague,Plague
	AIDS,AIDS
	Leprosy,Leprosy
	Psychosis,Psychosis
}
Div(Class: content-wrapper){
		Div(Class:panel-body row){
			Image(Src: Binary().ById(6))
		}

		Div(Class: breadcrumb){
			LinkPage(Home, HospitalHome)
			Span(/).Style(margin-right: 10px; margin-left: 10px;)
			Span(Body: Check Up, Class: text-muted)
		}

		
	Div(Class: row df f-valign){
       Div(Class: col-md-1)
        Div(Class: col-md-10){

			Div(Class: panel panel-info){
                Div(Class: h1 panel-heading h1, Body: Patient)
                Form(){
					Div(Class: list-group-item){
					 	Div(Class: h2, Body: Patient Details)
						Div(Class: table table-responsive){
							Table(selected_pt_source,"Reg#=regno,Name=name,Email=email,Phone#=phone,Age=age,Dob=dob,Insurance Name=insurancename,Insurance #=insurance,Address=address,Photo=PhotoImage")
						} 

						Div(Class: h2, Body: Patient Admission Details)
						Div(Class: table table-responsive){
							Table(selected_pt_admission_source,"Hospital=hospital,Date=date,Time=time,Weight=weight,Height=height,Health Condition=healthcondition,Medications=mediction,Illness=illness,Allergies=allergies,Surgery=surgery,Reason for Visit=reason,Status=status")
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
                Div(Class: h1 panel-heading h1, Body: Doctor Prescription Form)
                Form(){
					Div(Class: list-group-item){
						Div(Class: row df f-valign){
							Div(Class: col-md-3 text-right) {
                                	Span(Body: Doctor)
                                }
								Div(Class: col-md-9 text-center mb-lg) {
                                	Select(Name: Doctor,Source: doctor_source,ValueColumn: "name",NameColumn: "name")
                                }
								Div(Class: col-md-3 text-right) {
                                	Span(Body: Doctor Comments)
                                }
								Div(Class: col-md-9 text-center mb-lg) {
                                	Input(Type:textarea,Name:Comments,Placeholder: Please write your comments on examining the patient #patient_name#)
                                }
								Div(Class: col-md-3 text-right ) {
                                	Span(Body: Have you found any other diseases?)
                                }
								Div(Class: col-md-9 text-center mb-lg) {
                                	Input(Type:text,Name:Disease,Placeholder: Mention if the patient #patient_name# has any other diseases while examining)
                                }
								Div(Class: col-md-3 text-right ) {
                                	Span(Body: Scan/Xray and other)
                                }
								Div(Class: col-md-9 text-center mb-lg) {
                                	Input(Type:file,Name:Scan,Placeholder: Please upload if the patient #patient_name# has gone through any scan or xray other checkup's result copy)
                                }
						}
					}

					Div(Class: list-group-item){
						Div(Class: h3 text-center, Body: Prescriptions)
							Div(Class: row df f-valign){


								Div(panel-body){
										Div(row text-muted){
											Div(col-md-6 mt-lg){
												Label(){Medicine Name}
											}
											Div(col-md-3 mt-lg){
												Label(){Time}
											}
											Div(col-md-2 mt-lg){
												Label(){Quantity}
											}
											Div(col-md-1 mt-lg){
												Label(){Action}
											}
										}
										If(GetVar(cs)==""){
											SetVar(cs,0)
										}
										If(#del# == 1){
											SetVar(cs,Calculate(#cs# - 1))
										}.Else{
											SetVar(cs,Calculate(#cs# + 1))
										}
										Range(params_range, 0, #cs#)
										ForList(Source: params_range){
											Div(row mt-sm){
												Div(col-md-6){
													Input(Name:MedicineNameArr, Placeholder: Name of Medicine)
												}.Style(input {padding: 6px;text-align:center;})
												Div(col-md-3){
													Input(Name:MedicineTimeArr,Placeholder: Time to take medicine)
												}
												Div(col-md-2){
													Input(Name:MedicineQuanArr,Placeholder: Quantity to take medicine)
												}
												Div(col-md-1){
													If(And(#cs#==#params_range_index#,#cs#>1)){
														Button(Class:fa fa-trash btn btn-default, PageParams: "admission=#admission#,regno=#regno#,cs=#cs#,del=1", Page: HospitalPatientCheckUp)
													}
												}
											}
										}
										Div(row){
											Div(col-md-12 mt-lg){
												LinkPage(Body: "Add Medicine", Page: HospitalPatientCheckUp, PageParams:"cs=#cs#,admission=#admission#,regno=#patient_regno#")
											}
										}
									}
									Div(Class:text-center panel-footer){
										Button(Body: "Save", Class: btn btn-primary, Contract: HospitalPatientMedicine, Page: HosptialPatientAdmission, Params:"Name=#patient_name#,RegNo=#patient_regno#,AdmissionId=#admission#")
								}


								
							}	

					}
			}
		}
	}
 }
}
