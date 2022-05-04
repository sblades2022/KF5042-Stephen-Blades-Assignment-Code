filename = "spiderman_tweets_labelled.txt";
dataReviews = readtable(filename, 'TextType', 'string'); textData = dataReviews.review;
actualScore = dataReviews.score;
sents = preprocessReviews(textData);

fprintf('File: %s, Sentences: %d \n', filename, size(sents));

sentimentScore = zeros(size(sents));

for ii = 1 : sents.length
    docwords = sents(ii).Vocabulary;
    for jj = 1 : length(docwords)
    if words_hash.containsKey(docwords(jj))
            sentimentScore(ii) = sentimentScore(ii) + words_hash.get(docwords(jj));
end
    end

if (sentimentScore(ii)>=1)
    sentimentScore(ii)=1; 
elseif (sentimentScore(ii)<=-1)
    sentimentScore(ii) = -1; 
end
    fprintf('Sent: %d, Words: %s, FoundScore: %d, GoldScore: %d\n', ii, joinWords(sents(ii)), sentimentScore(ii), actualScore(ii)); 
end

%Task 3 combined here%
ZeroVal = sum(sentimentScore == 0);
covered = numel(sentimentScore) - ZeroVal;
fprintf("Total of positive and negative classes (coverage): %2.2f%, Distinct %d, Not found or Neutral: $d\n", (covered * 100)/numel(sentimentScore), covered, ZeroVal);

tp = sentimentScore((sentimentScore==1) & (actualScore==1));
tn = sentimentScore((sentimentScore==0) & (actualScore==0));
acc = (numel(tp) + numel(tn))*100/covered;
fprintf("Accuracy: %2.2f%%, TP: %d, TN: %d\n", acc, numel(tp), numel(tn)); figure
confusionchart(actualScore, sentimentScore);