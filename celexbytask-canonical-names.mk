
# PUT DIFFERENT OUTPUT FORMATS INTO CANONICAL FORM
# {SUBTASK}_{FOLD}_{MODEL}_test.tsv
# The subtasks names are the shortnames from the table columns

subtasks := 13SIA  2PIE 2PKE  rP


CELEXBYTASK_DIR:= data/celexbytask



# set target-specific variables

$(foreach st,$(subtasks),canonical-celexbytask-$(st)-ca-crp-avg):       CANONICALDIR:=$(CELEXBYTASK_DIR)/CA-CRP-AVG
$(foreach st,$(subtasks),canonical-celexbytask-$(st)-ca-mrt-crp-avg):   CANONICALDIR:=$(CELEXBYTASK_DIR)/CA-MRT-CRP-AVG
$(foreach st,$(subtasks),canonical-celexbytask-$(st)-ha-crp-avg):       CANONICALDIR:=$(CELEXBYTASK_DIR)/HASTAR-CRP-AVG
$(foreach st,$(subtasks),canonical-celexbytask-$(st)-ha-mrt-crp-avg):   CANONICALDIR:=$(CELEXBYTASK_DIR)/HASTAR-MRT-CRP-AVG



canonical-celexbytask-targets: \
  $(foreach st,$(subtasks),canonical-celexbytask-$(st)-ca-crp-avg) \
  $(foreach st,$(subtasks),canonical-celexbytask-$(st)-ca-mrt-crp-avg) \
  $(foreach st,$(subtasks),canonical-celexbytask-$(st)-ha-crp-avg) \
  $(foreach st,$(subtasks),canonical-celexbytask-$(st)-ha-mrt-crp-avg) \



define CELEX_RULE

canonical-celexbytask-$(SUBTASK)-%-avg: 
	unzip -ud origdata origdata/celexbytask-$(SUBTASK)-$$*-avg.zip && \
	mkdir -p $(CELEXBYTASK_DIR)/$$(subst HA,HASTAR,$$(call uppercase,$$*))/ && \
	rename -v 's{origdata/celexbytask-$(SUBTASK)-$$*-avg/(\d)/s_(\d)/f.beam4.test.predictions}{$(CELEXBYTASK_DIR)/$$(subst HA,HASTAR,$$(call uppercase,$$*))/$(SUBTASK)_$$$${1}_$$$${2}_test.tsv}' origdata/celexbytask-$(SUBTASK)-$$*-avg/?/s_{1,2,3,4,5}/f.beam4.test.predictions 
endef

$(eval $(foreach SUBTASK,$(subtasks),$(CELEX_RULE)))


# GOLD data is taken from https://gitlab.cl.uzh.ch/morphology-datasets/sigmorphon-2017-format/celex-by-task
# cd origdata && git clone https://gitlab.cl.uzh.ch/morphology-datasets/sigmorphon-2017-format/celex-by-task
canonical-celexbytask-GOLD: 
	mkdir -p data/celexbytask/GOLD && \
	rename -v 's{origdata/celex-by-task/rP-pA/0500/(\d)/test}{data/celexbytask/GOLD/rP_$${1}_test.tsv}' origdata/celex-by-task/rP-pA/0500/?/test && \
	rename -v 's{origdata/celex-by-task/13SIA-13SKE/0500/(\d)/test}{data/celexbytask/GOLD/13SIA_$${1}_test.tsv}' origdata/celex-by-task/13SIA-13SKE/0500/?/test && \
	rename -v 's{origdata/celex-by-task/2PIE-13PKE/0500/(\d)/test}{data/celexbytask/GOLD/2PIE_$${1}_test.tsv}' origdata/celex-by-task/2PIE-13PKE/0500/?/test && \
	rename -v 's{origdata/celex-by-task/2PKE-z/0500/(\d)/test}{data/celexbytask/GOLD/2PKE_$${1}_test.tsv}' origdata/celex-by-task/2PKE-z/0500/?/test



SHELL:=/bin/bash

# Funktion for uppercasing...
# https://bitbucket.org/tnmurphy/raptor/src/fbb2e624d320e5eabc0689105e2f2b80d131ca03/lib/flm/flmtools.mk?at=default&fileviewer=file-view-default
# A macro for converting a string to uppercase 
uppercase_TABLE:=a,A b,B c,C d,D e,E f,F g,G h,H i,I j,J k,K l,L m,M n,N o,O p,P q,Q r,R s,S t,T u,U v,V w,W x,X y,Y z,Z 

define uppercase_internal 
$(if $1,$$(subst $(firstword $1),$(call uppercase_internal,$(wordlist 2,$(words $1),$1),$2)),$2)
endef 

define uppercase 
$(eval uppercase_RESULT:=$(call uppercase_internal,$(uppercase_TABLE),$1))$(uppercase_RESULT)
endef 
