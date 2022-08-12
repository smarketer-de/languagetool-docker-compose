FROM erikvl87/languagetool

# Improving the spell checker
# http://wiki.languagetool.org/hunspell-support
USER root
RUN echo "Adding custom hunspell dictionary"
COPY de_additions.txt de_additions.txt
RUN  (echo; cat de_additions.txt) >> org/languagetool/resource/de/hunspell/spelling.txt

# Download ngrams dictionaries
RUN mkdir /ngrams

RUN echo "Downloading DE ngrams"
RUN wget -O ngrams_de.zip https://languagetool.org/download/ngram-data/ngrams-de-20150819.zip
RUN unzip ngrams_de.zip
RUN mv de /ngrams/de

# RUN echo "Downloading EN ngrams"
# RUN wget -O ngrams_en.zip https://languagetool.org/download/ngram-data/ngrams-en-20150817.zip
# RUN unzip ngrams_en.zip
# RUN mv ngrams-en-20150817 /ngrams/en

RUN echo "Setup done!"
USER languagetool
