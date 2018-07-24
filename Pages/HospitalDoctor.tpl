DBFind("Hospital",hp_source).Columns("id,name")
Div(Class: content-wrapper){
		Div(Class:panel-body row){
			Image(Src: Binary().ById(6))
		}
	Div(Class: breadcrumb){
		LinkPage(Home, HospitalHome)
	}

	 Div(Class: row df f-valign){
        Div(Class: col-md-3)
        Div(Class: col-md-6){
		
            Div(Class: panel panel-info){
                Div(Class: panel-heading, Body: Doctor)
                Form(){
					Div(Class: list-group-item){
                        Div(Class: row df f-valign){
                            
								Div(Class: col-md-3 text-right) {
                                	Span(Body: Name)
                                }
                                Div(Class: col-md-9 text-center mb-lg) {
                                    Input(Name: Name,Placeholder: Name of Doctor, Type: text)
                                }
								Div(Class: col-md-3 mt-sm text-right){
									Span(Body:Email)
								}

								Div(Class: col-md-9 mc-sm text-left mb-lg){
									Input(Name: Email, Placeholder: Email Address, Class: form-control, Type: text)
								}

								Div(Class: col-md-3 mt-sm text-right){
									Span(Body:Qualification)
								}

								Div(Class: col-md-9 mc-sm text-left mb-lg){
									Input(Name: Qualification, Placeholder:Qualificaiton as in State Medical Counsil, Class: form-control, Type: text)
								}

								Div(Class: col-md-3 mt-sm text-right){
									Span(Body:Registered No)
								}

								Div(Class: col-md-9 mc-sm text-left mb-lg){
									Input(Name: RegNo, Placeholder:Registered No as in State Medical Counsil, Class: form-control, Type: number)
								}

								Div(Class: col-md-3 mt-sm text-right){
									Span(Body:Address)
								}

								Div(Class: col-md-9 mc-sm text-left mb-lg){
									Input(Name: Address, Placeholder:Recidential Address, Class: form-control, Type: textarea)
								}

								Div(Class: col-md-3 mt-sm text-right){
									Span(Body:Photo)
								}

								Div(Class: col-md-9 mc-sm text-left mb-lg){
									Input(Name: Photo, Placeholder:Passport Size Photo, Class: form-control, Type: file)
								}

								Div(Class: col-md-3 mt-sm text-right){
									Span(Body:Certificate)
								}

								Div(Class: col-md-9 mc-sm text-left mb-lg){
									Input(Name: Certificate, Placeholder:Registered Certificate Scan Copy, Class: form-control, Type: file)
								}

								Div(Class: col-md-3 mt-sm text-right){
									Span(Body:Hospital)
								}

								Div(Class: col-md-9 mc-sm text-left mb-lg){
									 Select(Name: Hospital, Source: hp_source,NameColumn: "name",ValueColumn: "name")
								}
                        	}   
                      	}  
						Div(Class: panel-footer clearfix){
                        Div(Class: pull-right){
                            Button(Body: Submit, Class: btn btn-primary, Page: HospitalDoctor, Contract: HospitalDoctor)
                        }              
                    }
						
				}
			}
		}
	}

	Div(Class: row df f-valign){
            Div(Class: col-md-3)
            Div(Class: list-group-item col-md-6){
				DBFind("HospitalDoctor",dr_source).Custom(PhotoImage){
				Image(Src: Binary().ById(#photo#), Class: img-squre).Style(width: 80px; border: 1px solid #5A5D63;)
				}.Custom(CertificateImage){
				Image(Src: Binary().ById(#certificate#), Class: img-squre).Style(width: 80px; border: 1px solid #5A5D63;)
				}
                Table(Source: dr_source,"#=id,Name=name,Email=email,Medical Reg#=regno,Qualification=qualification,Address=address,Photo=PhotoImage,Certificate=CertificateImage")
            }   
     }

}
