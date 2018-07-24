DBFind("Hospital",hp_source)
Div(Class: content-wrapper){
		Div(Class:panel-body row){
			Image(Src: Binary().ById(6))
		}
	Div(Class: breadcrumb){
		LinkPage(Home, HospitalHome)
		Span(/).Style(margin-right: 10px; margin-left: 10px;)
		Span(Class: text-muted, Body: Hospital)
	}

    Div(Class: row df f-valign){
        Div(Class: col-md-3)
        Div(Class: col-md-6){
		
            Div(Class: panel panel-primary){
                Div(Class: panel-heading, Body: Hospital)
                Form(){

                    Div(Class: list-group-item){
                        Div(Class: row df f-valign){
                            
                            Div(Class: col-md-3 text-right) {
                                    Span(Body: Name of Organization)
                                }
                                Div(Class: col-md-9 text-center mb-lg) {
                                    Input(Placeholder: Hospital/Nursing Home/Clicnic, Name: Name, Type: text)
                                }

                            Div(Class: col-md-3 mt-sm text-right){
                                    Span(Body:Email)
                			}

                			Div(Class: col-md-9 mc-sm text-left mb-lg){
                			    Input(Name: Email, Class: form-control, Type: text)
                			}
                        }                   
                    }

                    Div(Class: list-group-item){
                        Div(Class: row df f-valign){
                			Div(Class: col-md-3 mt-lg text-right){
                                Span(Body: Address)
                            }
                			Div(Class: col-md-9 mc-sm text-left mb-lg){
                			    Input(Name: Address, Class: form-control, Type: textarea)
                			}

                            Div(Class: col-md-3 mt-sm text-right){
                                    Span(Body:Name of Medical Director)
                			}
                			Div(Class: col-md-9 mc-sm text-left mb-lg){
                			    Input(Name: Director, Class: form-control, Type: text)
                			}

                            Div(Class: col-md-3 mt-sm text-right){
                                    Span(Body:Medical Council Registration No)
                			}
                			Div(Class: col-md-9 mc-sm text-left mb-lg){
                			    Input(Name: RegNo, Class: form-control, Type: text)
                			}
                        }                      
                    }

                   

                    Div(Class: panel-footer clearfix){
                        Div(Class: pull-right){
                            Button(Body: Submit, Class: btn btn-primary, Page: HospitalKyc, Contract: HospitalKyc)
                        }
                    }

                }
            }
		}
    }

     Div(Class: row df f-valign){
            Div(Class: col-md-3)
            Div(Class: list-group-item col-md-6){
                Table(Source: hp_source,Columns:"#=id,Medical Director = name, Medical Council Registration No = refno, Email=email,Address=address")
            }   
     }
}
