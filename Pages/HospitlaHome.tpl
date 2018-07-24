Div(Class: content-wrapper){
	Div(Class:panel-body row){
		Image(Src: Binary().ById(6))
	}
	
	
	Div(Class: breadcrumb){
		Span(Class: text-muted, Body: Home)
		Span(/).Style(margin-right: 10px; margin-left: 10px;)
		LinkPage(Hospital, HospitalKyc)
	}



	    Div(row){
			Div(col-sm-8 col-sm-offset-2 col-lg-6 col-lg-offset-3){
				Form(panel panel-default){
					Div(panel-heading text-center){
						Span(Class: h3, Body: Doctor)
					}
					Div(panel-body){
						Div(form-group){
							Div(row){
								Div(col-md-12 mt-sm text-center){
										Button(Class: fa fa-user-md fa-5x btn-link, Page: HospitalDoctor)						
								}
							}
						}
					}
				}
			}

			Div(col-sm-8 col-sm-offset-2 col-lg-6 col-lg-offset-3){
				Form(panel panel-default){
					Div(panel-heading text-center){
						Span(Class: h3, Body: Patient)
					}
					Div(panel-body){
						Div(form-group){
							Div(row){
								Div(col-md-12 mt-sm text-center){
										Button(Class: fa fa-wheelchair custom fa-5x btn-link, Page: HospitalPatient)						
								}
							}
						}
					}
				}
			}
    }

}
