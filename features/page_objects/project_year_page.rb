class ProjectYearPage < SitePrism::Page

  section(:user_bar, AdminUserBarSection, AdminUserBarSection::SELECTOR)

  element(:april_2016_March_2017, "#financial_year_step_project_end_financial_year_2016")
  element(:april_2017_March_2018, "#financial_year_step_project_end_financial_year_2017")
  element(:april_2018_March_2019, "#financial_year_step_project_end_financial_year_2018")
  element(:april_2019_March_2020, "#financial_year_step_project_end_financial_year_2019")
  element(:april_2020_March_2021, "#financial_year_step_project_end_financial_year_2020")
  element(:april_2021_March_2022, "#financial_year_step_project_end_financial_year_2021")

  element(:after_2020, "a[href~='/financial_year_alternative']")



  element(:submit_button, "input[name='commit']")


    def submit(args = {})

    case args[:option]
	 
    when :Year_2016_2017
      	april_2016_March_2017.click
	  
    when :Year_2017_2018
      	april_2017_March_2018.click
    
    when :Year_2018_2019
      	april_2018_March_2019.click

    when :Year_2019_2020
        april_2019_March_2020.click     

    when :Year_2020_2021
        april_2020_March_2021.click        

    when :Year_2021_2022
        april_2021_March_2022.click     
	  end

        submit_button.click
  	end

end