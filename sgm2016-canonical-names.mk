
# PUT DIFFERENT OUTPUT FORMATS INTO CANONICAL FORM
# LANG_{FOLD}_test.tsv
# Ensembles are always fold 0.

# The averages from 5 folds are always folds 1 to 5.

# the origin of the our own test data is defined in https://gitlab.cl.uzh.ch/makarov/conll2017/coling2018-datasets/coling2018-sigmorphon-2016.mk

# main path specification for low and medium

SIGMORPHON2016_DIR:= data/sigmorphon2016


# set target-specific variables

canonical-sgm2016-ca-crp-e:   CANONICALDIR:=$(SIGMORPHON2016_DIR)/CA-CRP-E
canonical-sgm2016-ca-crp-avg:   CANONICALDIR:=$(SIGMORPHON2016_DIR)/CA-CRP-AVG

canonical-sgm2016-ha-crp-e:   CANONICALDIR:=$(SIGMORPHON2016_DIR)/HASTAR-CRP-E
canonical-sgm2016-ha-crp-avg:   CANONICALDIR:=$(SIGMORPHON2016_DIR)/HASTAR-CRP-AVG


# all targets for sigmorphon 2017 low
canonical-sgm2016-targets: \
  canonical-sgm2016-ca-crp-e \
  canonical-sgm2016-ca-crp-avg \
  canonical-sgm2016-ha-crp-e \
  canonical-sgm2016-ha-crp-avg \

	



# General rule for performing canonicalization of ensembles
# origdata/sgm2016-ca-crp-e/german-task1/s_0/f.beam4.test.predictions
canonical-%-e:
	unzip -ud origdata origdata/$*-e.zip && \
	mkdir -p $(CANONICALDIR)/ && \
	rename -v 's{origdata/$*-e/(.+)-task1/s_0/f.beam4.test.predictions}{$(CANONICALDIR)/$${1}_0_test.tsv}' origdata/$*-e/*/s_0/f.beam4.test.predictions 

# General rule for performing canonicalization of averages

canonical-%-avg:
	unzip -ud origdata origdata/$*-avg.zip && \
	mkdir -p $(CANONICALDIR)/ && \
	rename -v 's{origdata/$*-avg/(.+)-task1/s_(\d)/f.beam4.test.predictions}{$(CANONICALDIR)/$${1}_$${2}_test.tsv}' origdata/$*-avg/*/s_{1,2,3,4,5}/f.beam4.test.predictions 


# normalize to {LANG}_test.txt
# german-task1-test => german_test.txt
fix-gold-filenames:
	rename -v 's{-task1-test}{_test.txt}' data/sigmorphon2016/GOLD/*-test 


SHELL:=/bin/bash
