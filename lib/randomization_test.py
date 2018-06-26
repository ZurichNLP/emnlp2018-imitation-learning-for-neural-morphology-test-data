#!/usr/bin/env python
# -*- coding: utf-8 -*-
from __future__ import unicode_literals, print_function, division
from optparse import OptionParser
import os
import sys
import codecs
import numpy as np
from numpy.random import RandomState
from permute.core import one_sample



"""
Module for applying randomization tests on tabseparated data between two systems

 - needs a gold standard in the same format as the systems that will be compared
 - assumes that there are exactly two text files to compare to which contain the data in the same sequence
 - supports accuracy computations by default

 Output is a tabulator-separated line of text with the following columns:
 0. text label of experiment
 1. pvalue
 2. mean-difference
 3. number of test items
 3. system 1's accuracy
 4. system 2's accuracy
 5. number of iterations
"""

sys.stdout = codecs.getwriter('utf-8')(sys.__stdout__)
sys.stderr = codecs.getwriter('utf-8')(sys.__stderr__)
sys.stdin = codecs.getreader('utf-8')(sys.__stdin__)

options = {}
args = []


def read_data_file(fpath, options):
    """
    Read data and return pair of labels list, rest list
    """
    labels = []
    data = []
    with codecs.open(fpath,'r',encoding="utf-8") as f:
        for i,l in enumerate(f):
            d = l.rstrip().split('\t')
            if len(d) > 0:
                labels.append(d[options['column']])
                data.append(d)
    print('DATAFILE={fpath}\nITEMS={items}'.format(fpath=fpath,items=len(labels)), file=sys.stderr)
    return (labels,data)


def remove_equal_labels(system1, system2):
    s2 = []
    s1 = []
    for i,l1 in enumerate(system1):
        if l1 != system2[i]:
            s1.append(system1[i])
            s2.append(system2[i])
    return s1,s2

def accuracy(system, gold, options):
    return [ (1 if s == gold[i] else 0) for i,s in enumerate(system)]

def process(options=None,args=None):
    """
    Do the processing
    """
    items = None
    if options["debug"]:
        print(options, file=sys.stderr)
    prng = RandomState(options['seed'])
    if options['gold']:
        goldlabel,golddata = read_data_file(options['gold'], options)
    else:
        goldlabel,golddata = None, None
        print("Gold data needed", file=sys.stderr)
        exit(1)

    system1label, system1data = read_data_file(args[0], options)
    system2label, system2data = read_data_file(args[1], options)

    items = len(system1label)
    system1accuracy = accuracy(system1label, goldlabel, options)
    s1acc_value = sum(system1accuracy)/items
    print('Accuracy:System1',args[0],s1acc_value, file=sys.stderr)
    system2accuracy = accuracy(system2label, goldlabel, options)
    s2acc_value = sum(system2accuracy)/items
    print('Accuracy:System2',args[1],s2acc_value, file=sys.stderr)
    _s1, _s2 = remove_equal_labels(system1accuracy, system2accuracy)
    reldiffs = len(_s1)/items
    if 'r' in options['mode']:  #  taking only the items where the systems actually have a difference
        system1accuracy, system2accuracy = _s1, _s2
        print('Reducing labels to differences only: {reditems} out of {items} '.format(reditems=len(system1accuracy),items=items), file=sys.stderr)
        print('DISAGREEMENT={}%'.format(len(system1accuracy)*100/items), file=sys.stderr)
    else:
        print('DISAGREEMENT={}%'.format(len(_s1)*100/items), file=sys.stderr)
    if len(_s1) == 0:
        pvalue, diff_means = 1,0
    else:
    # perform the test
        (pvalue, diff_means) = one_sample(system1accuracy, system2accuracy, stat="mean", alternative="greater", reps=options['iterations'], seed=prng)


    print('pvalue=',pvalue,'diff_means', file=sys.stderr)
    print("{label}\t{pvalue}\t{diff_means}\t{items}\t{reldiff}\t{accuracy1}\t{accuracy2}\t{alpha}\t{significant}\t{iterations}".format(
        label=options['label'],
        pvalue=pvalue,
        items=items,
        reldiff=reldiffs,
        diff_means=diff_means,
        accuracy1=s1acc_value,
        accuracy2=s2acc_value,
        alpha=options['alpha'],
        significant=1 if pvalue < options['alpha'] else 0,
        iterations=options['iterations']), file=sys.stdout)

def main():
    """
    Invoke this module as a script
    """
    global options, args
    parser = OptionParser(
        usage = '%prog [OPTIONS] SYSTEM1 SYSTEM2',
        version='%prog 0.99', #
        description='Apply randomization tests',
        epilog='Contact simon.clematide@uzh.ch'
        )
    parser.add_option('-l', '--logfile', dest='logfilename',
                      help='write log to FILE', metavar='FILE')
    parser.add_option('-q', '--quiet',
                      action='store_true', dest='quiet', default=False,
                      help='do not print status messages to stderr')
    parser.add_option('-d', '--debug',
                      action='store_true', dest='debug', default=False,
                      help='print debug information')
    parser.add_option('-c', '--column',
                      action='store', dest='column', default=1, type=int,
                      help='specify column (zero-based) containing the label column (default %default)')
    parser.add_option('-g', '--gold',
                      action='store', dest='gold', default=None,
                      help='optional gold file')
    parser.add_option('-m', '--mode',
                      action='store', dest='mode', default='ga',
                      help='mode ')
    parser.add_option('-i', '--iterations',
                      action='store', dest='iterations', default=1000000, type=int,
                      help='number of permutation iterations (default %default)')
    parser.add_option('-s', '--seed',
                      action='store', dest='seed', default=42,type=int,
                      help='seed value of pseudo random number generator (default %default)')
    parser.add_option('-a', '--alpha',
                      action='store', dest='alpha', default=0.05,
                      help='alpha level for significance (default %default)')

    parser.add_option('-L', '--label',
                      action='store', dest='label', default='TEST',
                      help='label for dataset (default %default)')

    (opts, args) = parser.parse_args()
    options.update(vars(opts))
    if len(args) != 2:
        print("Two system outputs needed", file=sys.stderr)
        exit(1)

    process(options=options,args=args)


if __name__ == '__main__':
    main()
