library(ggdag)
library(plotly)
theme_set(theme_dag())
dagified <- dagify(Corruption ~ fem + 
                     Size + 
                     StartUp + 
                     Region + 
                     LocalitySize+
                    Establishments +
                     Subsidiary +
                    FemaleOwner +
                   GovOwner + 
                   Established +
                   FinRisk +
                   LegalStatus + 
                   Industry,
                   Establishments ~ Subsidiary,
                   FemaleOwner ~ Established + Region + LegalStatus+ Size,
                   FinRisk ~ GovOwner + Established + Industry + LegalStatus + Size,
                   fem ~ 
                     Size + 
                     StartUp + 
                     Region + 
                     LocalitySize+
                     Establishments +
                     Subsidiary +
                     FemaleOwner +
                     GovOwner + 
                     Established +
                     FinRisk +
                     LegalStatus + 
                     Industry,
                   
                   exposure = "fem",
                   outcome = "Corruption",
                   labels = c('Corruption' ='Perception of corruption',
                              'fem' = 'Female Manager', 
                                'LocalitySize' = 'Locality Size',
                              'Size' = "Size of Business",
                              'Establishments' = 'No. of Establishments',
                              'Subsidiary' = 'Is Subsidiary',
                              'FemaleOwner' = 'Female Ownership',
                              'GovOwner'= 'Government Ownership',
                              'Established' = 'Year of establishment',
                              'StartUp' = 'Size at Startup',
                              'FinRisk'= 'Financial Risk',
                              'Region' = "State",
                              'LegalStatus' = 'Legal Status',
                              'Industry' = 'Industry'))

ggdag(dagified, text = F, use_labels = "label")
