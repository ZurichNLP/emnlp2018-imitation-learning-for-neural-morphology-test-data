# SIGMORPHON 2017 permutation test

PARALLEL?=;	
ITERATIONS?=10000
FOLDS?= 1 2 3 4 5

LNGS?=$(shell cat data/sigmorphon2017/languages.txt)


permutation-test-out.d/sigmorphon2017/low/HAECM-E15_greater_CA-MRT-E-cls/permute.tsv : 
	mkdir -p $(@D) && \
	for l in $(LNGS) ; do \
		python lib/randomization_test.py -g data/sigmorphon2017/GOLD/$${l}_test.txt  data/sigmorphon2017/low/HAECM-E15/$${l}_0_test.tsv data/sigmorphon2017/low/CA-MRT-E-cls/$${l}_0_test.tsv -m gar -i  $(ITERATIONS)  -s 42 --label $${l} $(PARALLEL) \
	done  > $@  2> $@.err \
	&& wait && touch $@


permutation-test-out.d/sigmorphon2017/low/CA-MRT-E-cls_greater_HAECM-E15/permute.tsv: 
	mkdir -p $(@D) && \
	for l in $(LNGS) ; do \
		python lib/randomization_test.py -g data/sigmorphon2017/GOLD/$${l}_test.txt  data/sigmorphon2017/low/CA-MRT-E-cls/$${l}_0_test.tsv  data/sigmorphon2017/low/HAECM-E15/$${l}_0_test.tsv -m gar -i $(ITERATIONS)  -s 42 --label $${l} $(PARALLEL) \
	done  > $@  2> $@.err \
	&& wait && touch $@


# 
permutation-test-out.d/sigmorphon2017/medium/CA-MRT-E-crp_greater_HAECM-E15/permute.tsv : 
	mkdir -p $(@D) && \
	for l in $(LNGS) ; do \
		python lib/randomization_test.py -g data/sigmorphon2017/GOLD/$${l}_test.txt  data/sigmorphon2017/medium/CA-MRT-E-crp/$${l}_0_test.tsv data/sigmorphon2017/medium/HAECM-E15/$${l}_0_test.tsv -m gar -i  $(ITERATIONS)  -s 42 --label $${l} $(PARALLEL) \
	done  > $@  2> $@.err \
	&& wait && touch $@

permutation-test-out.d/sigmorphon2017/medium/HAECM-E15p_greater_CA-MRT-E-cr/permute.tsv : 
	mkdir -p $(@D) && \
	for l in $(LNGS) ; do \
		python lib/randomization_test.py -g data/sigmorphon2017/GOLD/$${l}_test.txt data/sigmorphon2017/medium/HAECM-E15/$${l}_0_test.tsv  data/sigmorphon2017/medium/CA-MRT-E-crp/$${l}_0_test.tsv  -m gar -i  $(ITERATIONS)  -s 42 --label $${l} $(PARALLEL) \
	done  > $@  2> $@.err \
	&& wait && touch $@


####
permutation-test-out.d/sigmorphon2017/low/CA-MRT-cls_greater_CA-cls/permute.tsv : 
	mkdir -p $(@D) && \
	for f in $(FOLDS) ; do \
		for l in $(LNGS) ; do \
			python lib/randomization_test.py -g data/sigmorphon2017/GOLD/$${l}_test.txt  data/sigmorphon2017/low/CA-MRT-cls/$${l}_$${f}_test.tsv data/sigmorphon2017/low/CA-cls/$${l}_$${f}_test.tsv -m gar -i  $(ITERATIONS)  -s 42 --label $${l} $(PARALLEL) \
		done \
		done  > $@  2> $@.err \
	&& wait && touch $@

permutation-test-out.d/sigmorphon2017/low/CA-cls_greater_CA-MRT-cls/permute.tsv : 
	mkdir -p $(@D) && \
	for f in $(FOLDS) ; do \
		for l in $(LNGS) ; do \
			python lib/randomization_test.py -g data/sigmorphon2017/GOLD/$${l}_test.txt  data/sigmorphon2017/low/CA-cls/$${l}_$${f}_test.tsv data/sigmorphon2017/low/CA-MRT-cls/$${l}_$${f}_test.tsv  -m gar -i  $(ITERATIONS)  -s 42 --label $${l} $(PARALLEL) \
		done \
		done  > $@  2> $@.err \
	&& wait && touch $@



####
permutation-test-out.d/sigmorphon2017/medium/CA-MRT-crp_greater_CA-MRT-cls/permute.tsv : 
	mkdir -p $(@D) && \
	for f in $(FOLDS) ; do \
		for l in $(LNGS) ; do \
			python lib/randomization_test.py -g data/sigmorphon2017/GOLD/$${l}_test.txt  data/sigmorphon2017/medium/CA-MRT-crp/$${l}_$${f}_test.tsv data/sigmorphon2017/medium/CA-MRT-cls/$${l}_$${f}_test.tsv -m gar -i  $(ITERATIONS)  -s 42 --label $${l} $(PARALLEL) \
		done \
		done  > $@  2> $@.err \
	&& wait && touch $@


####
permutation-test-out.d/sigmorphon2017/medium/CA-MRT-cls_greater_CA-MRT-crp/permute.tsv : 
	mkdir -p $(@D) && \
	for f in $(FOLDS) ; do \
		for l in $(LNGS) ; do \
			python lib/randomization_test.py -g data/sigmorphon2017/GOLD/$${l}_test.txt  data/sigmorphon2017/medium/CA-MRT-cls/$${l}_$${f}_test.tsv  data/sigmorphon2017/medium/CA-MRT-crp/$${l}_$${f}_test.tsv -m gar -i  $(ITERATIONS)  -s 42 --label $${l} $(PARALLEL) \
		done \
		done  > $@  2> $@.err \
	&& wait && touch $@


####
permutation-test-out.d/sigmorphon2017/medium/CA-MRT-E-crp_greater_HASTAR-MRT-E-cls/permute.tsv : 
	mkdir -p $(@D) && \
		for l in $(LNGS) ; do \
			python lib/randomization_test.py -g data/sigmorphon2017/GOLD/$${l}_test.txt  data/sigmorphon2017/medium/CA-MRT-E-crp/$${l}_0_test.tsv data/sigmorphon2017/medium/HASTAR-MRT-E-cls/$${l}_0_test.tsv -m gar -i  $(ITERATIONS)  -s 42 --label $${l} $(PARALLEL) \
		done  > $@  2> $@.err \
	&& wait && touch $@


permutation-test-out.d/sigmorphon2017/medium/HASTAR-MRT-E-cls_greater_CA-MRT-E-crp/permute.tsv : 
	mkdir -p $(@D) && \
		for l in $(LNGS) ; do \
			python lib/randomization_test.py -g data/sigmorphon2017/GOLD/$${l}_test.txt  data/sigmorphon2017/medium/HASTAR-MRT-E-cls/$${l}_0_test.tsv  data/sigmorphon2017/medium/CA-MRT-E-crp/$${l}_0_test.tsv -m gar -i  $(ITERATIONS)  -s 42 --label $${l} $(PARALLEL) \
		done  > $@  2> $@.err \
	&& wait && touch $@



# only non-MRT vs MRT
# SGMmedium-CA-MRT-E-crp_greater_CA-E-crp
permutation-test-out.d/sigmorphon2017/medium/CA-MRT-E-crp_greater_CA-E-crp/permute.tsv : 
	mkdir -p $(@D) && \
		for l in $(LNGS) ; do \
			python lib/randomization_test.py -g data/sigmorphon2017/GOLD/$${l}_test.txt  data/sigmorphon2017/medium/CA-MRT-E-crp/$${l}_0_test.tsv data/sigmorphon2017/medium/CA-E-crp/$${l}_0_test.tsv -m gar -i  $(ITERATIONS)  -s 42 --label $${l} $(PARALLEL) \
		done  > $@  2> $@.err \
	&& wait && touch $@

# SGMmedium-CA-MRT-E-cls_greater_CA-E-cls
permutation-test-out.d/sigmorphon2017/medium/CA-MRT-E-cls_greater_CA-E-cls/permute.tsv : 
	mkdir -p $(@D) && \
		for l in $(LNGS) ; do \
			python lib/randomization_test.py -g data/sigmorphon2017/GOLD/$${l}_test.txt  data/sigmorphon2017/medium/CA-MRT-E-cls/$${l}_0_test.tsv data/sigmorphon2017/medium/CA-E-cls/$${l}_0_test.tsv -m gar -i  $(ITERATIONS)  -s 42 --label $${l} $(PARALLEL) \
		done  > $@  2> $@.err \
	&& wait && touch $@



# SGMmedium-HASTART-MRT-E-crp_greater_HASTAR-E-crp
permutation-test-out.d/sigmorphon2017/medium/CA-MRT-E-crp_greater_CA-E-crp/permute.tsv : 
	mkdir -p $(@D) && \
		for l in $(LNGS) ; do \
			python lib/randomization_test.py -g data/sigmorphon2017/GOLD/$${l}_test.txt  data/sigmorphon2017/medium/CA-MRT-E-crp/$${l}_0_test.tsv data/sigmorphon2017/medium/CA-E-crp/$${l}_0_test.tsv -m gar -i  $(ITERATIONS)  -s 42 --label $${l} $(PARALLEL) \
		done  > $@  2> $@.err \
	&& wait && touch $@


# SGMmedium-HASTART-MRT-E-crp_greater_HASTAR-E-crp
# permutation-test-out.d/sigmorphon2017/medium/CA-MRT-E-cls_greater_CA-E-cls/permute.tsv : 
# 	mkdir -p $(@D) && \
# 		for l in $(LNGS) ; do \
# 			python lib/randomization_test.py -g data/sigmorphon2017/GOLD/$${l}_test.txt  data/sigmorphon2017/medium/CA-MRT-E-cls/$${l}_0_test.tsv data/sigmorphon2017/medium/CA-E-cls/$${l}_0_test.tsv -m gar -i  $(ITERATIONS)  -s 42 --label $${l} $(PARALLEL) \
# 		done  > $@  2> $@.err \
# 	&& wait && touch $@



permutation-files+= permutation-test-out.d/sigmorphon2017/low/HAECM-E15_greater_CA-MRT-E-cls/permute.tsv
permutation-files+= permutation-test-out.d/sigmorphon2017/low/CA-MRT-E-cls_greater_HAECM-E15/permute.tsv

permutation-files+= permutation-test-out.d/sigmorphon2017/medium/CA-MRT-E-crp_greater_HAECM-E15/permute.tsv 
permutation-files+= permutation-test-out.d/sigmorphon2017/medium/HAECM-E15p_greater_CA-MRT-E-cr/permute.tsv


permutation-files+= permutation-test-out.d/sigmorphon2017/low/CA-MRT-cls_greater_CA-cls/permute.tsv 
permutation-files+= permutation-test-out.d/sigmorphon2017/low/CA-cls_greater_CA-MRT-cls/permute.tsv

permutation-files+= permutation-test-out.d/sigmorphon2017/medium/CA-MRT-crp_greater_CA-MRT-cls/permute.tsv 
permutation-files+= permutation-test-out.d/sigmorphon2017/medium/CA-MRT-cls_greater_CA-MRT-crp/permute.tsv 

permutation-files+=permutation-test-out.d/sigmorphon2017/medium/CA-MRT-crp_greater_HASTAR-MRT-cls/permute.tsv


permutation-target: $(permutation-files)

targets-all: data/sigmorphon2017/GOLD/ALL.tsv data/sigmorphon2017/low/HAECM-E15/ALL.tsv data/sigmorphon2017/low/CA-MRT-E-cls/ALL.tsv data/sigmorphon2017/medium/HAECM-E15/ALL.tsv data/sigmorphon2017/medium/CA-MRT-E-crp/ALL.tsv



# Micro-average computations (not used officially)
data/sigmorphon2017/GOLD/ALL.tsv:
	cat $$(ls data/sigmorphon2017/GOLD/*.txt | sort) > $@

data/sigmorphon2017/low/HAECM-E15/ALL.tsv:
	cat $$(ls data/sigmorphon2017/low/HAECM-E15/*test.tsv | sort) > $@

data/sigmorphon2017/low/CA-MRT-E-cls/ALL.tsv:
	cat $$(ls data/sigmorphon2017/low/CA-MRT-E-cls/*test.tsv | sort) > $@


data/sigmorphon2017/medium/HAECM-E15/ALL.tsv:
	cat $$(ls data/sigmorphon2017/medium/HAECM-E15/*test.tsv | sort) > $@

data/sigmorphon2017/medium/CA-MRT-E-crp/ALL.tsv:
	cat $$(ls data/sigmorphon2017/medium/CA-MRT-E-crp/*test.tsv | sort) > $@

