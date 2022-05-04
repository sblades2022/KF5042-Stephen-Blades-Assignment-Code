clc
clear
fidPositive = fopen(fullfile('opinion-lexicon-English', 'positive-words.txt'));
C = textscan(fidPositive, '%s', 'CommentStyle',';');
wordsPositive = string(C{1});

fclose all;

fidNegative = fopen(fullfile('opinion-lexicon-English', 'negative-words.txt'));
D = textscan(fidNegative, '%s', 'CommentStyle',';');
wordsNegative = string(D{1});

fclose all;

words_hash = java.util.Hashtable;

[possize, ~] = size(wordsPositive);
for ii = 1:possize
        words_hash.put(wordsPositive(ii,1),1);
end

[negsize, ~] = size(wordsNegative);
for ii = 1:negsize
        words_hash.put(wordsNegative(ii,1),-1);
end