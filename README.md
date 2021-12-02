# Data Pirates
## Citizens Police Database Project - Tracking Effectiveness of Police Reform 

## Theme

The question that we hope to answer with this project is whether police reform is effective. We are assessing and tracking police reform to check if there are improvements after reformative interventions like the COPA. Research into tracking police reform is essential in knowing whether substantial improvements are being made across the board, identifying neighborhoods that might require additional supervision/intervention, checking for under-reporting of cases, and increase vigilance in these areas accordingly.

Our goal is to leverage the information available on types of complaints made by both civilians and officers alike against police officers, based on neighborhood demographics, complaint outcomes, the extent of disciplining, and information on subsequent investigation to gain insight on if and how accountability is being enforced.

## Checkpoint 1 - SQL Analytics

> In this checkpoint we evaluate the accountability measures taken by the CPD concerning investigations. This will allow us to gain an understanding of how effective COPA has been since its advent and also observe patterns in disciplinary actions.

- What are the top 3 complaints in each neighborhood before COPA?
- What are the top 3 complaints in each neighbourhood after COPA?
- For all officers that had sustained allegations, what were the disciplinary actions taken?
- For each type of allegation, how many were sustained before COPA and after COPA?

## Checkpoint 2 - Data Exploration

> In this checkpoint, we establish grounds to investigate complaint trends, visualise a timeline of reforms and their effect on the complaint trends. We further scrutinise the results on sustained and non-sustained allegations we observed from Checkpoint 1.

- What are the trends in complaint count overall and per complaint category over time and what are the effects on these counts with the introduction of various reforms? We can visualise this data as line graphs with reference lines indicating the introduction of each reform introduced over time. 
- What is the percentage of Total Count of Complaints for each Category of final_findings ( ”SU”, ”NA”, ”NS” etc.) broken down by Disciplinary action?

## Checkpoint 3 -Interactive Visualisation 

> With interactive visualisation, we would like to interact with the complaints and disciplinary action taken over the years to understand how accountability is being relayed in each neighbourhood in the form of heat maps, line graphs, etc.

## Checkpoint 4 - Graph Analytics

> We hope to construct an entity relationship map where the entities are police units - which would comprise of beats and police officers, neighbourhoods, types of complaints and visualise the relations between these entities.

## Checkpoint 5 - Natural Language Processing

> In this checkpoint, we hope to explore the complaint reports using sentiment analysis to add to the observations of neighborhood demographics to gain insight on whether there is a bias towards certain social-economic groups or races, and if reform should be targeted towards specific officers or precincts in the neighborhood require reformative training as a whole. 
        
> Elaborating on that, if the sentiment of a certain Complaint Report seems negative, and the neighbourhood that the complaint report belongs to is largely low-income households, we can make an observation that there's economic discrimination in play and reformative training as a whole is required for the precinct in that neighbourhood. 
