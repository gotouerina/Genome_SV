# Syri

syri : https://github.com/schneebergerlab/syri

To install syri , type

    conda create -n syri_env -c bioconda syri
    conda activate syri_env
or

    conda install -c bioconda syri

You can also try to build from the source code

It is recommanded to do syri after mummer alignment

I have write an instruction about it ,see

https://github.com/gotouerina/Colinear_mummer_NGenomeSyn

It is also recommanded to split genome into chr to perform syri , there I provide a perl script split.pl , Usage:

        perl split.pl <_.fasta>
 
The result of syri can be visualized by plotsr : https://github.com/schneebergerlab/plotsr

you can install it by typing 

        conda install -c bioconda plotsr 

and you can check the example in the plotsr dictionary


#   Assemblytics

Upload file on http://assemblytics.com

or dowanload source code on https://github.com/marianattestad/assemblytics

#   SVIM-ASM


