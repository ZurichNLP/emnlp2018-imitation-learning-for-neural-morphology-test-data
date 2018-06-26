
# PUT DIFFERENT OUTPUT FORMATS INTO CANONICAL FORM
# LANG_{FOLD}_test.tsv
# Ensembles are always fold 0.

# The averages from 5 folds are always fold 1 to 5.

# the origin of the original data is defined in https://gitlab.cl.uzh.ch/makarov/conll2017/coling2018-datasets/coling2018.mk

SIGMORPHON2017LOW_DIR:= data/sigmorphon2017/low
SIGMORPHON2017MEDIUM_DIR:= data/sigmorphon2017/medium


# data/sigmorphon2017/sigmorphon-low-ca-mrt-e-cls/french_/s_0/f.beam4.test.predictions 
# =>  data/sigmorphon2017/sigmorphon-low-ca-mrt-e-cls/french_0_test.tsv
# set target-specific variables
canonical-sigmorphon-low-ca-mrt-e-cls:   CANONICALDIR:=$(SIGMORPHON2017LOW_DIR)/CA-MRT-E-cls

canonical-sigmorphon-low-ca-mrt-e-cls:
	unzip -d origdata origdata/sigmorphon-low-ca-mrt-e-cls.zip && \
	mkdir -p $(CANONICALDIR)/ && \
	rename -v 's{origdata/sigmorphon-low-ca-mrt-e-cls/(.+)_/s_0/f.beam4.test.predictions}{$(CANONICALDIR)/$${1}_0_test.tsv}' origdata/sigmorphon-low-ca-mrt-e-cls/*_/s_0/f.beam4.test.predictions 


# original data comes from sigmorphon-uzh/paper2018/results/sgm2017medium/x-haem-acrp-psgm2017medium-n200_1-w100_20_100_T-e50_15-oADADELTA_0-mmrt1-x/s_0

canonical-sigmorphon-medium-ca-mrt-e-crp:   CANONICALDIR:=$(SIGMORPHON2017MEDIUM_DIR)/CA-MRT-E-crp

canonical-sigmorphon-medium-ca-mrt-e-crp:
	unzip -d origdata origdata/sigmorphon-medium-ca-mrt-e-crp.zip && \
	mkdir -p $(CANONICALDIR)/ && \
	rename -v 's{origdata/sigmorphon-medium-ca-mrt-e-crp/(.+)_/s_0/f.beam4.test.predictions}{$(CANONICALDIR)/$${1}_0_test.tsv}' origdata/sigmorphon-medium-ca-mrt-e-crp/*_/s_0/f.beam4.test.predictions 



# original data comes from sigmorphon-uzh/paper2018/results/sgm2017low/x-haem-acls-psgm2017low-n200_1-w100_20_100_T-e60_15-oADADELTA_0-mmle-x/s_{1,2,3,4,5}

canonical-sigmorphon-low-ca-cls:   CANONICALDIR:=$(SIGMORPHON2017LOW_DIR)/CA-cls

canonical-sigmorphon-low-ca-cls:
	unzip -d origdata origdata/sigmorphon-low-ca-cls-avg.zip && \
	mkdir -p $(CANONICALDIR)/ && \
	rename -v 's{origdata/sigmorphon-low-ca-cls-avg/(.+)_/s_(\d)/f.beam4.test.predictions}{$(CANONICALDIR)/$${1}_$${2}_test.tsv}' origdata/sigmorphon-low-ca-cls-avg/*_/s_{1,2,3,4,5}/f.beam4.test.predictions 


# original data comes from sigmorphon-uzh/paper2018/results/sgm2017low/x-haem-acls-psgm2017low-n200_1-w100_20_100_T-e60_20-oADADELTA_0-mmrt1-x/s_{1,2,3,4,5}
# CA-cls
canonical-sigmorphon-low-ca-mrt-cls-avg:   CANONICALDIR:=$(SIGMORPHON2017LOW_DIR)/CA-MRT-cls

canonical-sigmorphon-low-ca-mrt-cls-avg:
	unzip -d origdata origdata/sigmorphon-low-ca-mrt-cls-avg.zip && \
	mkdir -p $(CANONICALDIR)/ && \
	rename -v 's{origdata/sigmorphon-low-ca-mrt-cls-avg/(.+)_/s_(\d)/f.beam4.test.predictions}{$(CANONICALDIR)/$${1}_$${2}_test.tsv}' origdata/sigmorphon-low-ca-mrt-cls-avg/*_/s_{1,2,3,4,5}/f.beam4.test.predictions 


# original data comes from sigmorphon-uzhpaper2018/results/sgm2017medium/x-haem-acls-psgm2017medium-n200_1-w100_20_100_T-e50_15-oADADELTA_0-mmrt1-x/s_{1,2,3,4,5}

canonical-sigmorphon-medium-ca-mrt-cls-avg:   CANONICALDIR:=$(SIGMORPHON2017MEDIUM_DIR)/CA-MRT-cls

canonical-sigmorphon-medium-ca-mrt-cls-avg:
	unzip -d origdata origdata/sigmorphon-medium-ca-mrt-cls-avg.zip && \
	mkdir -p $(CANONICALDIR)/ && \
	rename -v 's{origdata/sigmorphon-medium-ca-mrt-cls-avg/(.+)_/s_(\d)/f.beam4.test.predictions}{$(CANONICALDIR)/$${1}_$${2}_test.tsv}' origdata/sigmorphon-medium-ca-mrt-cls-avg/*_/s_{1,2,3,4,5}/f.beam4.test.predictions 

# original data comes from sigmorphon-uzhpaper2018/results/sgm2017medium/x-haem-acls-psgm2017medium-n200_1-w100_20_100_T-e50_15-oADADELTA_0-mmrt1-x/s_{1,2,3,4,5}

canonical-sigmorphon-medium-ca-mrt-crp-avg:   CANONICALDIR:=$(SIGMORPHON2017MEDIUM_DIR)/CA-MRT-crp

canonical-sigmorphon-medium-ca-mrt-crp-avg:
	unzip -d origdata origdata/sigmorphon-medium-ca-mrt-crp-avg.zip && \
	mkdir -p $(CANONICALDIR)/ && \
	rename -v 's{origdata/sigmorphon-medium-ca-mrt-crp-avg/(.+)_/s_(\d)/f.beam4.test.predictions}{$(CANONICALDIR)/$${1}_$${2}_test.tsv}' origdata/sigmorphon-medium-ca-mrt-crp-avg/*_/s_{1,2,3,4,5}/f.beam4.test.predictions 


# put HAECM-E15 into canonical format
# original data comes from official submission email sent to the organizers

canonical-sigmorphon-medium-HAECM-E15:
	rename -v 's{-medium-out}{_0_test.tsv}' data/sigmorphon2017/medium/HAECM-E15/*-out
canonical-sigmorphon-low-HAECM-E15:
	rename -v 's{-low-out}{_0_test.tsv}' data/sigmorphon2017/low/HAECM-E15/*-out
