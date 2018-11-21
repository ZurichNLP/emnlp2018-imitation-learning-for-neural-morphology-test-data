
# PUT DIFFERENT OUTPUT FORMATS INTO CANONICAL FORM
# {LANG}_{FOLD}_{MODEL}_test.tsv
# MODEL is always 5 for this data set.
# The reported averages stem from the different folds for each language.

# the origin of the our own test data is defined in https://gitlab.cl.uzh.ch/makarov/conll2017/coling2018-datasets/coling2018-sigmorphon-2016.mk

# main path specification

LEMMATIZATIONWIC2002_DIR:= data/lemmatizationwic2002


# set target-specific variables


canonical-lemmatizationwic2002-ca-crp-avg:   CANONICALDIR:=$(LEMMATIZATIONWIC2002_DIR)/CA-CRP-AVG
canonical-lemmatizationwic2002-ca-lcs-avg:   CANONICALDIR:=$(LEMMATIZATIONWIC2002_DIR)/CA-LCS-AVG


canonical-lemmatizationwic2002-ha-crp-avg:   CANONICALDIR:=$(LEMMATIZATIONWIC2002_DIR)/HASTAR-CRP-AVG
canonical-lemmatizationwic2002-ha-lcs-avg:   CANONICALDIR:=$(LEMMATIZATIONWIC2002_DIR)/HASTAR-LCS-AVG


# for EMNLP 2018 paper
canonical-lemmatizationwic2002-ca-d-avg:   CANONICALDIR:=$(LEMMATIZATIONWIC2002_DIR)/CA-D-AVG
canonical-lemmatizationwic2002-ca-r-avg:   CANONICALDIR:=$(LEMMATIZATIONWIC2002_DIR)/CA-R-AVG
canonical-lemmatizationwic2002-ca-rm-avg:   CANONICALDIR:=$(LEMMATIZATIONWIC2002_DIR)/CA-RM-AVG


# all targets for sigmorphon 2017 low
canonical-lemmatizationwic2002-targets: \
  canonical-lemmatizationwic2002-ca-d-avg \
  canonical-lemmatizationwic2002-ca-r-avg \
  canonical-lemmatizationwic2002-ca-rm-avg \
  canonical-lemmatizationwic2002-ca-crp-avg \
  canonical-lemmatizationwic2002-ha-crp-avg \
  canonical-lemmatizationwic2002-ca-lcs-avg \
  canonical-lemmatizationwic2002-ha-lcs-avg 



# General rule for performing canonicalization of averages
#  lemmatizationwic2002-ha-lcs-avg/english_9_/s_5/f.beam4.test.predictions => $(CANONICALDIR)/english_9_/s_5/f.beam4.test.predictions
canonical-%-avg:
	unzip -ud origdata origdata/$*-avg.zip && \
	mkdir -p $(CANONICALDIR)/ && \
	rename -v 's{origdata/$*-avg/(.+)_(\d)_/s_(\d)/f.beam4.test.predictions}{$(CANONICALDIR)/$${1}_$${2}_$${3}_test.tsv}' origdata/$*-avg/*_/s_5/f.beam4.test.predictions 




SHELL:=/bin/bash
