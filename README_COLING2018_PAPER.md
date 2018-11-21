# Repository of test data from COLING 2018 paper "Neural Transition-based String Transduction for Limited-Resource Setting in Morphology" by Peter Makarov and Simon Clematide
The code to reproduce these results can be found at <https://github.com/ZurichNLP/coling2018-neural-transition-based-morphology>.
The exact definition of which results from which result directory actually went into which table of our paper (and the corresponding test data in <https://github.com/ZurichNLP/coling2018-neural-transition-based-morphology-test-data>) can be found 
in the makefiles in <https://github.com/ZurichNLP/coling2018-neural-transition-based-morphology/coling2018-datasets> and in <https://github.com/ZurichNLP/coling2018-neural-transition-based-morphology-test-data>.  

All files in this repository are results from using a beam width of 4.


# FIGURE 5: celex2PKE and celex13SIA 50/100/300
All results from low resource settings of 2PKE and 13SIA tasks.

| Model   | 13SIA| 2PKE | PATH |
|---------|------|------|------|
| LAT     |      |      | n/a  |
| NWFST   |      |      | n/a  |
| HA*     |      |      | `data/celexbytasklow/HASTAR-CRP` |
| CA      |      |      | `data/celexbytasklow/CA-CRP` |
| gold standard  |  |   | `data/celexbytasklow/GOLD`|

# Table 1: Celex
All models on celex data were computed via crp alignment.

## Table 1: Part CELEX-BY-TASK

| Model    |     |   | PATH |
|----------|------------|------|------|
| gold standard  |      |      | `data/celexbytask/GOLD`|



The data files contain all tasks according to the table headers for the tasks. They numbers in the task-specific columns are averages over 5 models. The number in column "Avg." is the average of all these averages.

| Model   | 13SIA | 2PIE |2PKE | rP   | Avg. | PATH |
|---------|------|------|------|------|------|------|
| LAT     | 87.5 | 93.4 | 87.4 | 84.9 | 88.3 | n/a  |
| NWFST   | 85.1 | 94.4 | 85.5 | 83.0 | 87.0 | n/a  |
| HA*     | 84.6 | 93.9 | 88.1 | 85.1 | 87.9 | `data/celexbytask/HASTAR-CRP` |
| CA      | 85.0 | 94.5 | 88.0 | 84.9 | 88.1 | `data/celexbytask/CA-CRP` |
| HA*-MRT | 84.8 | 94.0 | 88.1 | 85.2 | 88.0 | `data/celexbytask/HASTAR-CRP` |
| CA-MRT  | 85.6 | 94.6 | 88.0 | 85.3 | 88.4 | `data/celexbytask/CA-MRT-CRP` |

Datasets with explicit linguistic features for rP reinflection task can be found in <https://gitlab.cl.uzh.ch/morphology-datasets/sigmorphon-2017-format/celex-by-task>.

## Table 1: Part CELEX-ALL 
There are 5 folds where we built 5 models for each fold. From the 5 models an ensemble system is built. The reported numbers are the averages of the ensembles (!).

| Model    |     |             | PATH |
|----------|------------|------|------|
| gold standard  |      |      | `data/celexall/GOLD`|


| Model      | Alignment | Avg.  | PATH                             |
|------------|-----------|------|-----------------------------------|
| MED        |           | 87.2 | n/a                               |
| HA         |           | 89.5 | n/a                               |
| HA\*-E     | crp       | 89.1 | `data/celexall/HASTAR-CRP-E`      |
| CA-E       | crp       | 89.1 | `data/celexall/CA-CRP-E`          |
| HA\*-MRT-E | crp       | 89.4 | `data/celexall/HASTAR-MRT-CRP-E`  |
| CA-MRT-E   | crp       |**89.5**| `data/celexall/CA-MRT-CRP-E`    |



# Table 2: SIGMORPHON 2017
The HAECM-E15-* data is taken from our official submission email.

The gold standard (same for low and medium):

| Model    |     | low/medium  | PATH |
|----------|------------|------|------|
| gold standard  |      |    | `data/sigmorphon2017/GOLD/`|



## Table 2: Part SIGMORPHON 2017 Low  Averages


| Model    | Alignment | low  | PATH |
|----------|------------|------|------|
| baseline |            | 37.9 | n/a  |
| HA\*     | lcs        | 29.1 | `data/sigmorphon2017/low/HASTAR-LCS-AVG` |
| CA       | lcs        | 47.3 | `data/sigmorphon2017/low/CA-LCS-AVG` |
| HA*      | crp        | 23.9 | `data/sigmorphon2017/low/HASTAR-CRP-AVG` |
| CA       | crp        | 42.5 | `data/sigmorphon2017/low/CA-CRP-AVG` |
| HA\*-MRT | lcs        | 30.2 |  `data/sigmorphon2017/low/HASTAR-MRT-LCS-AVG` |
| CA-MRT   | lcs      | **48.1** | `data/sigmorphon2017/low/CA-MRT-LCS-AVG` |
| HA\*-MRT | crp        | 25.3 | `data/sigmorphon2017/low/HASTAR-MRT-CRP-AVG` |
| CA-MRT   | crp        | 43.6 | `data/sigmorphon2017/low/CA-MRT-CRP-AVG` |

## Table 2: Part SIGMORPHON 2017 Medium  Averages



| Model    | Alignment  | medium | PATH |
|----------|------------|--------|------|
| baseline |            | 64.7   |  n/a |
| HA\*     | lcs        | 78.5   | `data/sigmorphon2017/medium/HASTAR-LCS-AVG` |
| CA       | lcs        | 79.5   | `data/sigmorphon2017/medium/CA-LCS-AVG` |
| HA*      | crp        | 75.4   | `data/sigmorphon2017/medium/HASTAR-CRP-AVG` |
| CA       | crp        | 78.9   | `data/sigmorphon2017/medium/CA-CRP-AVG` |
| HA\*-MRT | lcs        | 79.6   | `data/sigmorphon2017/medium/HASTAR-MRT-LCS-AVG` |
| CA-MRT   | lcs        | 80.3   | `data/sigmorphon2017/medium/CA-MRT-LCS-AVG`|
| HA\*-MRT | crp        | 78.1   | `data/sigmorphon2017/medium/HASTAR-MRT-CRP-AVG` |
| CA-MRT   | crp      | **81.1** | `data/sigmorphon2017/medium/CA-MRT-CRP-AVG` |


## Table 2: Part SIGMORPHON 2017 Low  Ensembles

| Model       | Alignment   | low  | PATH |
|-------------|-------------|------|------|
| baseline    |             | 37.9 | n/a  |
| HA\*-E      | lcs         | 31.5 | `data/sigmorphon2017/low/HASTAR-LCS-E` |
| CA-E        | lcs         | 48.8 | `data/sigmorphon2017/low/CA-LCS-E` |
| HA\*-E      | crp         | 26.1 | `data/sigmorphon2017/low/HASTAR-CRP-E` |
| CA-E        | crp         | 44.0 | `data/sigmorphon2017/low/CA-CRP-E` |
| HA\*-MRT-E  | lcs         | 33.1 | `data/sigmorphon2017/low/HASTAR-MRT-LCS-E` |
| CA-MRT-E    | lcs         | 49.9 | `data/sigmorphon2017/low/CA-MRT-LCS-E` |
| HA\*-MRT-E  | crp         | 28.1 | `data/sigmorphon2017/low/HASTAR-MRT-CRP-E` |
| CA-MRT-E    | crp         | 45.7 | `data/sigmorphon2017/low/CA-MRT-CRP-E` |
| HACM-E7     |             | 46.8 | n/a |
| HAEM-E7     |             | 48.5 | n/a |
| HA[EC]M-E15 |             | **50.6** | `data/sigmorphon2017/low/HAECM-E15` |




## Table 2: Part SIGMORPHON 2017 Medium  Ensembles

| Model       | Alignment   | medium | PATH |
|-------------|-------------|--------|------|
| baseline    |             | 64.7   |  n/a |
| HA\*-E      | lcs         | 80.2   | `data/sigmorphon2017/medium/HASTAR-LCS-E` |
| CA-E        | lcs         | 81.0   | `data/sigmorphon2017/medium/CA-LCS-E`  |
| HA\*-E      | crp         | 77.8   | `data/sigmorphon2017/medium/HASTAR-CRP-E` |
| CA-E        | crp         | 80.6   | `data/sigmorphon2017/medium/CA-CRP-E` |
| HA\*-MRT-E  | lcs         | 81.5   | `data/sigmorphon2017/medium/HASTAR-MRT-LCS-E` | 
| CA-MRT-E    | lcs         | 81.9   | `data/sigmorphon2017/medium/CA-MRT-LCS-E` |
| HA\*-MRT-E  | crp         | 80.5   | `data/sigmorphon2017/medium/HASTAR-MRT-CRP-E` |
| CA-MRT-E    | crp         | **82.9**   | `data/sigmorphon2017/medium/CA-MRT-CRP-E` |
| HACM-E7     |             | 81.8   | n/a |
| HAEM-E7     |             | 80.3   | n/a |
| HA[EC]M-E15 |             | 82.8   |`data/sigmorphon2017/medium/HAECM-E15` |


# Table 3: SIGMORPHON 2016
The gold standard of task 1 data:

| Model    |     |    | PATH |
|----------|------------|------|------|
| gold standard  |      |    | `data/sigmorphon2016/GOLD/`|


## Table 3: SIGMORPHON 2016 Averages
| Model       | Alignment   |  Avg.   | PATH |
|-------------|-------------|---------|------|
| HA\*        | crp         |  94.35  | `data/sigmorphon2016/HASTAR-CRP-AVG`   |
| CA          | crp         |**94.39**| `data/sigmorphon2016/CA-CRP-AVG`   |

## Table 3: SIGMORPHON 2016 Ensembles

| Model       | Alignment   |  Avg.   | PATH |
|-------------|-------------|---------|------|
| MED         |             |  95.56  | n/a  |
| SOFT        |             |**96.34**| n/a  |
| HA          |             |  95.61  | n/a  |
| HA\*-E      | crp         |  95.21  | `data/sigmorphon2016/HASTAR-CRP-E`   |
| CA-E        | crp         |  95.30  | `data/sigmorphon2016/CA-CRP-E`   |

# Table 4: Lemmatization
Only averages over the official folds (10 folds) from one model (generated by seed 5) are here. 

The gold standard data:

| Model    |     |    | PATH |
|----------|------------|------|------|
| gold standard  |      |    | `data/lemmatizationwic2002/GOLD/`|


| Model       | Alignment   | Avg. | PATH |
|-------------|-------------|--------|------|
| LAT         |             |  94.2  | n/a  |
| NWFST       |             |  95.3  | n/a  |
| HA\*        | lcs         | **97.7**| `data/lemmatizationwic2002/HASTAR-LCS-AVG` |
| CA          | lcs         |  97.3  | `data/lemmatizationwic2002/CA-LCS-AVG` |
| HA*         | crp         |  97.3  | `data/lemmatizationwic2002/HASTAR-CRP-AVG` |
| CA          | crp         |  96.8  | `data/lemmatizationwic2002/CA-CRP-AVG` |


Feel free to ask <simon.clematide@uzh.ch> for questions related to the data or <makarov@cl.uzh.ch> for questions regarding the code.
