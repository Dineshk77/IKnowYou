module SearchProperties
	PROPERTIES ||= {
		"screen" => {
			"home" => {
				"pageCheckId" => "email_signin_button",
				"button" => {
					"emailLogin" => "email_signin_button"
				}
			},
			"signUp" => {
				"pageCheckId" => "action_signup"
			},
			"login" => {
				"pageCheckId" => "action_signup"
			}
		},
		"form" => {
			"signUp" => {
				"text" => {
					"name" => {
						"id" => "text_username",
						"text" => "test",
					},
					"password" => {
						"id" => "text_password",
						"text" => "test"
					},
					"email" => {
						"id" => "text_email",
						"text" => "test"+Time.now.strftime("%d-%m-%Y_%H-%M")+"@gmail.com"
					}
				},
				"chooseItem" => {
					"city" =>  {
						"pageCheckId" => "layout_city",
						"id" => "text_city",
						"location" => {
							"id" => "text_location",
							"text" => "Singapore"
						}
					}
				},
				"button" => {
					"signUp" => "action_signup"
				},
				"tabs" => {
					"signUp" => "SIGN UP"
				}
			},
			"login" => {
				"text" => {
					"name" => {
						"id" => "text_username",
						"text" => "Dineshkumar7"
					},
					"password" => {
						"id" => "text_password",
						"text" => "carousellJD"
					}
				},
				"button" => {
					"login" => "action_signin"
				},
				"tabs" => {
					"login" => "LOGIN"
				}
			}
		},
		"notification" => {
			"firstTime" => {
				"skip" => "dialog_prompt_button_later"
			},
			"search" => {
				"skip" => "feature_button"
			}
		},
		"search" => {
			"home" => {
				"id" => "action_search",
				"textBox" => "input_search_bar",
				"validate" => {
					"productTitle" => "text_product"
				}
			}
		}
	}
end