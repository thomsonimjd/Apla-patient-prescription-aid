Data(gender,"name,value"){
Male,Male
Female,Female
}
Div(Class: content-wrapper){
		Div(Class:panel-body row){
			Image(Src: Binary().ById(6))
		}
		
	Div(Class: breadcrumb){
		LinkPage(Home, HospitalHome)
		Span(/).Style(margin-right: 10px; margin-left: 10px;)
		LinkPage(Admission, HosptialPatientAdmission)
	}


 	Div(Class: row df f-valign){
        Div(Class: col-md-3)
        Div(Class: col-md-6){

			Div(Class: panel panel-info){
                Div(Class: panel-heading, Body: Register Patient)
                Form(){
					Div(Class: list-group-item){
                        Div(Class: row df f-valign){
								Div(Class: col-md-3 text-right) {
                                	Span(Body: Name)
                                }
                                Div(Class: col-md-9 text-center mb-lg) {
                                    Input(Name: Name,Placeholder: Name of Patient, Type: text)
                                }
								Div(Class: col-md-3 text-right) {
                                	Span(Body: Age)
                                }
                                Div(Class: col-md-9 text-center mb-lg) {
                                    Input(Name: Age,Placeholder: Age of Patient, Type: Number)
                                }
								Div(Class: col-md-3 text-right) {
                                	Span(Body: Gender)
                                }
                                Div(Class: col-md-9 text-center mb-lg) {
                                    Select(Name: Gender,NameColumn: name,ValueColumn: value,Source:gender)
                                }
								Div(Class: col-md-3 text-right) {
                                	Span(Body: Date of Birth)
                                }
                                Div(Class: col-md-9 text-center mb-lg) {
                                    Input(Name: Dob, Placeholder: DOB, Type: date)
                                }
								Div(Class: col-md-3 mt-sm text-right){
									Span(Body:Email)
								}
								Div(Class: col-md-9 mc-sm text-left mb-lg){
									Input(Name: Email, Placeholder: Email Address, Class: form-control, Type: text)
								}
								Div(Class: col-md-3 mt-sm text-right){
									Span(Body:Phone)
								}
								Div(Class: col-md-9 mc-sm text-left mb-lg){
									Input(Name: Phone, Placeholder: Phone No, Class: form-control, Type: text)
								}
								Div(Class: col-md-3 mt-sm text-right){
									Span(Body:Address)
								}
								Div(Class: col-md-9 mc-sm text-left mb-lg){
									Input(Name: Address, Placeholder: Residential Address, Class: form-control, Type: textarea)
								}
								Div(Class: col-md-3 mt-sm text-right){
									Span(Body:Insurance Name)
								}
								Div(Class: col-md-9 mc-sm text-left mb-lg){
									Input(Name: InsName, Placeholder: Insurance Name, Class: form-control, Type: text)
								}
								Div(Class: col-md-3 mt-sm text-right){
									Span(Body:Insurance #)
								}
								Div(Class: col-md-9 mc-sm text-left mb-lg){
									Input(Name: InsNo, Placeholder: Insurance Number, Class: form-control, Type: number)
								}								
								Div(Class: col-md-3 mt-sm text-right){
									Span(Body:Photo)
								}
								Div(Class: col-md-9 mc-sm text-left mb-lg){
									Input(Name: Photo, Placeholder:Passport Size Photo, Class: form-control, Type: file)
								}

								
						}
					}
					Div(Class: panel-footer clearfix){
                        Div(Class: pull-right){
                            Button(Body: Submit, Class: btn btn-primary, Page: HospitalPatient, Contract: HospitalPatient)
                        }  
				}
			}
		}
	}
	}
	Div(Class: row df f-valign){
            Div(Class: col-md-3)
            Div(Class: list-group-item col-md-6){
				DBFind("HospitalPatient",pt_source).Columns("id,name,regno,insurancename,insurance,email")
                Table(Source: pt_source,"#=id,Registration#=regno,Name=name,Insurance Name=insurancename,Insurance #=insurance,Email=email")
            }   
     }
}
