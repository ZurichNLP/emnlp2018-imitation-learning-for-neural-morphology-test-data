
# PUT DIFFERENT OUTPUT FORMATS INTO CANONICAL FORM
# {LANG}_{MODEL}_test.tsv
# Ensembles are always model 0.

# The averages from 5 folds are always folds 1 to 5.

# the origin of the our own test data is defined in https://gitlab.cl.uzh.ch/makarov/conll2017/coling2018-datasets/coling2018.mk

# main path specification for low and medium

SIGMORPHON2017LOW_DIR:= data/sigmorphon2017/low
SIGMORPHON2017MEDIUM_DIR:= data/sigmorphon2017/medium


# set target-specific variables
# for COLING 2018 paper

canonical-sgm2017-low-ca-lcs-e:   CANONICALDIR:=$(SIGMORPHON2017LOW_DIR)/CA-LCS-E
canonical-sgm2017-low-ca-lcs-avg:   CANONICALDIR:=$(SIGMORPHON2017LOW_DIR)/CA-LCS-AVG

canonical-sgm2017-low-ca-crp-e:   CANONICALDIR:=$(SIGMORPHON2017LOW_DIR)/CA-CRP-E
canonical-sgm2017-low-ca-crp-avg:   CANONICALDIR:=$(SIGMORPHON2017LOW_DIR)/CA-CRP-AVG

canonical-sgm2017-low-ca-mrt-lcs-e:   CANONICALDIR:=$(SIGMORPHON2017LOW_DIR)/CA-MRT-LCS-E
canonical-sgm2017-low-ca-mrt-lcs-avg:   CANONICALDIR:=$(SIGMORPHON2017LOW_DIR)/CA-MRT-LCS-AVG

canonical-sgm2017-low-ca-mrt-crp-e:   CANONICALDIR:=$(SIGMORPHON2017LOW_DIR)/CA-MRT-CRP-E
canonical-sgm2017-low-ca-mrt-crp-avg:   CANONICALDIR:=$(SIGMORPHON2017LOW_DIR)/CA-MRT-CRP-AVG

canonical-sgm2017-low-ha-lcs-e:   CANONICALDIR:=$(SIGMORPHON2017LOW_DIR)/HASTAR-LCS-E
canonical-sgm2017-low-ha-lcs-avg:   CANONICALDIR:=$(SIGMORPHON2017LOW_DIR)/HASTAR-LCS-AVG

canonical-sgm2017-low-ha-crp-e:   CANONICALDIR:=$(SIGMORPHON2017LOW_DIR)/HASTAR-CRP-E
canonical-sgm2017-low-ha-crp-avg:   CANONICALDIR:=$(SIGMORPHON2017LOW_DIR)/HASTAR-CRP-AVG

canonical-sgm2017-low-ha-mrt-lcs-e:   CANONICALDIR:=$(SIGMORPHON2017LOW_DIR)/HASTAR-MRT-LCS-E
canonical-sgm2017-low-ha-mrt-lcs-avg:   CANONICALDIR:=$(SIGMORPHON2017LOW_DIR)/HASTAR-MRT-LCS-AVG

canonical-sgm2017-low-ha-mrt-crp-e:   CANONICALDIR:=$(SIGMORPHON2017LOW_DIR)/HASTAR-MRT-CRP-E
canonical-sgm2017-low-ha-mrt-crp-avg:   CANONICALDIR:=$(SIGMORPHON2017LOW_DIR)/HASTAR-MRT-CRP-AVG

# for EMNLP 2018 paper
canonical-sgm2017-low-ca-mrt-a-e:   CANONICALDIR:=$(SIGMORPHON2017LOW_DIR)/CA-MRT-A-E
canonical-sgm2017-low-ca-mrt-a-avg:   CANONICALDIR:=$(SIGMORPHON2017LOW_DIR)/CA-MRT-A-AVG

canonical-sgm2017-low-ca-d-e:   CANONICALDIR:=$(SIGMORPHON2017LOW_DIR)/CA-D-E
canonical-sgm2017-low-ca-d-avg:   CANONICALDIR:=$(SIGMORPHON2017LOW_DIR)/CA-D-AVG

canonical-sgm2017-low-ca-r-e:   CANONICALDIR:=$(SIGMORPHON2017LOW_DIR)/CA-R-E
canonical-sgm2017-low-ca-r-avg:   CANONICALDIR:=$(SIGMORPHON2017LOW_DIR)/CA-R-AVG

canonical-sgm2017-low-ca-rm-e:   CANONICALDIR:=$(SIGMORPHON2017LOW_DIR)/CA-RM-E
canonical-sgm2017-low-ca-rm-avg:   CANONICALDIR:=$(SIGMORPHON2017LOW_DIR)/CA-RM-AVG




# all targets for sigmorphon 2017 low
canonical-sgm2017-low-targets: \
  canonical-sgm2017-low-ca-lcs-e \
  canonical-sgm2017-low-ca-lcs-avg \
  canonical-sgm2017-low-ca-crp-e \
  canonical-sgm2017-low-ca-crp-avg \
  canonical-sgm2017-low-ca-mrt-lcs-e \
  canonical-sgm2017-low-ca-mrt-lcs-avg \
  canonical-sgm2017-low-ca-mrt-crp-e \
  canonical-sgm2017-low-ca-mrt-crp-avg \
  canonical-sgm2017-low-ha-lcs-e \
  canonical-sgm2017-low-ha-lcs-avg \
  canonical-sgm2017-low-ha-crp-e \
  canonical-sgm2017-low-ha-crp-avg \
  canonical-sgm2017-low-ha-mrt-lcs-e \
  canonical-sgm2017-low-ha-mrt-lcs-avg \
  canonical-sgm2017-low-ha-mrt-crp-e \
  canonical-sgm2017-low-ha-mrt-crp-avg \
  canonical-sgm2017-low-ca-mrt-a-e \
  canonical-sgm2017-low-ca-mrt-a-avg \
  canonical-sgm2017-low-ca-d-e \
  canonical-sgm2017-low-ca-d-avg \
  canonical-sgm2017-low-ca-r-e \
  canonical-sgm2017-low-ca-r-avg \
  canonical-sgm2017-low-ca-rm-e \
  canonical-sgm2017-low-ca-rm-avg \
#  
	


# set target-specific variables

canonical-sgm2017-medium-ca-lcs-e:   CANONICALDIR:=$(SIGMORPHON2017MEDIUM_DIR)/CA-LCS-E
canonical-sgm2017-medium-ca-lcs-avg:   CANONICALDIR:=$(SIGMORPHON2017MEDIUM_DIR)/CA-LCS-AVG

canonical-sgm2017-medium-ca-crp-e:   CANONICALDIR:=$(SIGMORPHON2017MEDIUM_DIR)/CA-CRP-E
canonical-sgm2017-medium-ca-crp-avg:   CANONICALDIR:=$(SIGMORPHON2017MEDIUM_DIR)/CA-CRP-AVG

canonical-sgm2017-medium-ca-mrt-lcs-e:   CANONICALDIR:=$(SIGMORPHON2017MEDIUM_DIR)/CA-MRT-LCS-E
canonical-sgm2017-medium-ca-mrt-lcs-avg:   CANONICALDIR:=$(SIGMORPHON2017MEDIUM_DIR)/CA-MRT-LCS-AVG

canonical-sgm2017-medium-ca-mrt-crp-e:   CANONICALDIR:=$(SIGMORPHON2017MEDIUM_DIR)/CA-MRT-CRP-E
canonical-sgm2017-medium-ca-mrt-crp-avg:   CANONICALDIR:=$(SIGMORPHON2017MEDIUM_DIR)/CA-MRT-CRP-AVG

canonical-sgm2017-medium-ha-lcs-e:   CANONICALDIR:=$(SIGMORPHON2017MEDIUM_DIR)/HASTAR-LCS-E
canonical-sgm2017-medium-ha-lcs-avg:   CANONICALDIR:=$(SIGMORPHON2017MEDIUM_DIR)/HASTAR-LCS-AVG

canonical-sgm2017-medium-ha-crp-e:   CANONICALDIR:=$(SIGMORPHON2017MEDIUM_DIR)/HASTAR-CRP-E
canonical-sgm2017-medium-ha-crp-avg:   CANONICALDIR:=$(SIGMORPHON2017MEDIUM_DIR)/HASTAR-CRP-AVG

canonical-sgm2017-medium-ha-mrt-lcs-e:   CANONICALDIR:=$(SIGMORPHON2017MEDIUM_DIR)/HASTAR-MRT-LCS-E
canonical-sgm2017-medium-ha-mrt-lcs-avg:   CANONICALDIR:=$(SIGMORPHON2017MEDIUM_DIR)/HASTAR-MRT-LCS-AVG

canonical-sgm2017-medium-ha-mrt-crp-e:   CANONICALDIR:=$(SIGMORPHON2017MEDIUM_DIR)/HASTAR-MRT-CRP-E
canonical-sgm2017-medium-ha-mrt-crp-avg:   CANONICALDIR:=$(SIGMORPHON2017MEDIUM_DIR)/HASTAR-MRT-CRP-AVG

# for EMNLP 2018 paper
canonical-sgm2017-medium-ca-mrt-a-e:   CANONICALDIR:=$(SIGMORPHON2017MEDIUM_DIR)/CA-MRT-A-E
canonical-sgm2017-medium-ca-mrt-a-avg:   CANONICALDIR:=$(SIGMORPHON2017MEDIUM_DIR)/CA-MRT-A-AVG

canonical-sgm2017-medium-ca-d-e:   CANONICALDIR:=$(SIGMORPHON2017MEDIUM_DIR)/CA-D-E
canonical-sgm2017-medium-ca-d-avg:   CANONICALDIR:=$(SIGMORPHON2017MEDIUM_DIR)/CA-D-AVG

canonical-sgm2017-medium-ca-r-e:   CANONICALDIR:=$(SIGMORPHON2017MEDIUM_DIR)/CA-R-E
canonical-sgm2017-medium-ca-r-avg:   CANONICALDIR:=$(SIGMORPHON2017MEDIUM_DIR)/CA-R-AVG

canonical-sgm2017-medium-ca-rm-e:   CANONICALDIR:=$(SIGMORPHON2017MEDIUM_DIR)/CA-RM-E
canonical-sgm2017-medium-ca-rm-avg:   CANONICALDIR:=$(SIGMORPHON2017MEDIUM_DIR)/CA-RM-AVG



# all targets for sigmorphon 2017 low
canonical-sgm2017-medium-targets: \
  canonical-sgm2017-medium-ca-lcs-e \
  canonical-sgm2017-medium-ca-lcs-avg \
  canonical-sgm2017-medium-ca-crp-e \
  canonical-sgm2017-medium-ca-crp-avg \
  canonical-sgm2017-medium-ca-mrt-lcs-e \
  canonical-sgm2017-medium-ca-mrt-lcs-avg \
  canonical-sgm2017-medium-ca-mrt-crp-e \
  canonical-sgm2017-medium-ca-mrt-crp-avg \
  canonical-sgm2017-medium-ha-lcs-e \
  canonical-sgm2017-medium-ha-lcs-avg \
  canonical-sgm2017-medium-ha-crp-e \
  canonical-sgm2017-medium-ha-crp-avg \
  canonical-sgm2017-medium-ha-mrt-lcs-e \
  canonical-sgm2017-medium-ha-mrt-lcs-avg \
  canonical-sgm2017-medium-ha-mrt-crp-e \
  canonical-sgm2017-medium-ha-mrt-crp-avg \
  canonical-sgm2017-medium-ca-mrt-a-e \
  canonical-sgm2017-medium-ca-mrt-a-avg \
  canonical-sgm2017-medium-ca-d-e \
  canonical-sgm2017-medium-ca-d-avg \
  canonical-sgm2017-medium-ca-r-e \
  canonical-sgm2017-medium-ca-r-avg \
  canonical-sgm2017-medium-ca-rm-e \
  canonical-sgm2017-medium-ca-rm-avg \
#  
	


# General rule for performing canonicalization of ensembles

canonical-%-e:
	unzip -d origdata origdata/$*-e.zip && \
	mkdir -p $(CANONICALDIR)/ && \
	rename -v 's{origdata/$*-e/(.+)_/s_0/f.beam4.test.predictions}{$(CANONICALDIR)/$${1}_0_test.tsv}' origdata/$*-e/*_/s_0/f.beam4.test.predictions 

# General rule for performing canonicalization of averages

canonical-%-avg:
	unzip -d origdata origdata/$*-avg.zip && \
	mkdir -p $(CANONICALDIR)/ && \
	rename -v 's{origdata/$*-avg/(.+)_/s_(\d)/f.beam4.test.predictions}{$(CANONICALDIR)/$${1}_$${2}_test.tsv}' origdata/$*-avg/*_/s_{1,2,3,4,5}/f.beam4.test.predictions 




# put HAECM-E15 into canonical format
# original data comes from official submission email sent to the organizers

canonical-sigmorphon-medium-HAECM-E15:
	rename -v 's{-medium-out}{_0_test.tsv}' data/sigmorphon2017/medium/HAECM-E15/*-out
canonical-sigmorphon-low-HAECM-E15:
	rename -v 's{-low-out}{_0_test.tsv}' data/sigmorphon2017/low/HAECM-E15/*-out



