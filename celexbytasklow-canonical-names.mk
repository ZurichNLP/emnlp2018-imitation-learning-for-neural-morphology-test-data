
# PUT DIFFERENT OUTPUT FORMATS INTO CANONICAL FORM
# {SUBTASK}_{FOLD}_{MODEL}_test.tsv
# The subtasks names are the shortnames from the table columns

datasets := 13SIA   2PKE
size := 0050 0100 0300

subtasks := $(foreach ds,$(datasets),$(foreach sz,$(size),$(ds)$(sz)))

CELEXBYTASKLOW_DIR:= data/celexbytasklow



# all targets for sigmorphon 2017 low
canonical-celexbytasklow-targets: \
  $(foreach st,$(subtasks),canonical-celexbytasklow-$(st)-ca-crp-avg) \
  $(foreach st,$(subtasks),canonical-celexbytasklow-$(st)-ha-crp-avg) 




define CELEX_RULE

canonical-celexbytasklow-$(SUBTASK)-%-avg: 
	unzip -ud origdata origdata/celexbytasklow-$(SUBTASK)-$$*-avg.zip && \
	mkdir -p $(CELEXBYTASKLOW_DIR)/$$(subst HA,HASTAR,$$(call uppercase,$$*))/ && \
	rename -v 's{origdata/celexbytasklow-$(SUBTASK)-$$*-avg/(\d)/s_(\d)/f.beam4.test.predictions}{$(CELEXBYTASKLOW_DIR)/$$(subst HA,HASTAR,$$(call uppercase,$$*))/$(SUBTASK)_$$$${1}_$$$${2}_test.tsv}' origdata/celexbytasklow-$(SUBTASK)-$$*-avg/?/s_{1,2,3,4,5}/f.beam4.test.predictions 
endef

$(eval $(foreach SUBTASK,$(subtasks),$(CELEX_RULE)))


# GOLD data is taken from https://gitlab.cl.uzh.ch/morphology-datasets/sigmorphon-2017-format/celex-by-task
# cd origdata && git clone https://gitlab.cl.uzh.ch/morphology-datasets/sigmorphon-2017-format/celex-by-task
canonical-celexbytasklow-GOLD: 
	mkdir -p data/celexbytasklow/GOLD && \
	rename -v 's{origdata/celex-by-task/13SIA-13SKE/(\d+)/(\d)/test}{data/celexbytasklow/GOLD/13SIA$${1}_$${2}_test.tsv}' origdata/celex-by-task/13SIA-13SKE/0{050,300,100}/?/test && \
	rename -v 's{origdata/celex-by-task/2PKE-z/(\d+)/(\d)/test}{data/celexbytasklow/GOLD/2PKE$${1}_$${2}_test.tsv}'     origdata/celex-by-task/2PKE-z/0{050,300,100}/?/test 




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


