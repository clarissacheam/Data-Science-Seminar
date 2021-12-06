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

> In this checkpoint, we interact with the misconducts occurring over the years and investigate why reforms identified in previous checkpoints are failing.

- What misdemeanours were prevalent in each year and do they decrease or increase? Study the trend and reform affected in further detail following the previous checkpoint. We can do this by using a bar chart race to illustrate the leading complaint category trends up till 2018.
- Why are targeted reforms failing? Are these reforms as targeted as they claim to be? For this we can use circle packaging visualization to view the misconducts and the sub categories within it.

## Checkpoint 4 - Graph Analytics

> In this checkpoint, we test the hypothesis, ”Are certain officers the cause of high misconduct counts in a certain district, or is it a unit-wide issue? If so, how does this affect reform choices”. We test this hypothesis to investi- gate whether reform needs to be implemented unit-wide or would retraining/removing certain officers improve the situation. To this end we will be interacting with officer nodes, unit ids and coaccusal counts. This checkpoint will further expand our focus from “Tracking police reform” to “Tracking and Nudging Police reform towards efficiency”.

- What is the distribution of allegation counts and trr counts in units? Is the distribution uniformly distributed indicating a unit wide problem or is the distribution skewed showing presence of certain problematic officers?
- If certain officers are the problem in their respective units we want to magnify this network and investigate which officers are the ring leaders, and at the center of co-accusals, influencing other officers?

Based on insights derived from these questions, an informed reform plan can be made where units can be revamped and problematic officers can be removed from the force.

## Checkpoint 5 - Natural Language Processing

> In this checkpoint we explore the text content available in the tables data attachmentnarrative and data allegation. We study both these tables since data attachmentnarrative table’s text content gives an account of the allegation, along with the victim perspective in terms of words uttered by the accused to them, tone/demeanor of accused that they observed, etc. whereas the data allegation table’s text content gives a report written by an officer without much of the victim’s direct words.

The question we hope to answer:
        
- What was the sentiment in the CPDB complaint data pre major reforms ( before 2016 ) and post major reforms? We use sentiment analysis to find out the same.

Note: Major reforms here indicate reforms like COPA and introduction of TRR
