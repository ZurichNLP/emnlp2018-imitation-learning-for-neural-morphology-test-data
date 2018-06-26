
# PUT DIFFERENT OUTPUT FORMATS INTO CANONICAL FORM
# celexall_{FOLD}_{MODEL}_test.tsv
# Ensembles are always fold 0.

# main path specification for low and medium

CELEXALL_DIR:= data/celexall



# set target-specific variables

canonical-celexall-ca-crp-e:   CANONICALDIR:=$(CELEXALL_DIR)/CA-CRP-E
canonical-celexall-ca-mrt-crp-e:   CANONICALDIR:=$(CELEXALL_DIR)/CA-MRT-CRP-E
canonical-celexall-ha-crp-e:   CANONICALDIR:=$(CELEXALL_DIR)/HASTAR-CRP-E
canonical-celexall-ha-mrt-crp-e:   CANONICALDIR:=$(CELEXALL_DIR)/HASTAR-MRT-CRP-E


# all targets for sigmorphon 2017 low
canonical-celexall-targets: \
  canonical-celexall-ca-crp-e \
  canonical-celexall-ca-mrt-crp-e \
  canonical-celexall-ha-crp-e \
  canonical-celexall-ha-mrt-crp-e \

	


celexall-zip-files := \
  celexall-ca-crp-e.zip \
  celexall-ha-crp-e.zip \
  celexall-ca-mrt-crp-e.zip \
  celexall-ha-mrt-crp-e.zip \


# General rule for performing canonicalization of ensembles
# celexall-ca-mrt-crp-e/13SIA-13SKE_2PIE-13PKE_2PKE-z_rP-pA_0./s_0/f.beam4.test.predictions
canonical-%-e:
	unzip -d origdata origdata/$*-e.zip && \
	mkdir -p $(CANONICALDIR)/ && \
	rename -v 's{origdata/$*-e/13SIA-13SKE_2PIE-13PKE_2PKE-z_rP-pA_(\d)\./s_0/f.beam4.test.predictions}{$(CANONICALDIR)/celexall_$${1}_0_test.tsv}' origdata/$*-e/*./s_0/f.beam4.test.predictions 



# GOLD data is taken from git@gitlab.cl.uzh.ch:morphology-datasets/sigmorphon-2017-format/celex.git
# cd origdata && git clone git@gitlab.cl.uzh.ch:morphology-datasets/sigmorphon-2017-format/celex.git
# origdata/celex/data/13SIA-13SKE_2PIE-13PKE_2PKE-z_rP-pA_0.test.txt => 
canonical-celexall-GOLD: 
	mkdir -p data/$(CELEXALL_DIR)/GOLD && \
	rename -v 's{origdata/celex/data/13SIA-13SKE_2PIE-13PKE_2PKE-z_rP-pA_(\d).test.txt}{$(CELEXALL_DIR)/GOLD/celexall_$${1}_test.tsv}' origdata/celex/data/13SIA-13SKE_2PIE-13PKE_2PKE-z_rP-pA_?.test.txt


SHELL:=/bin/bash

