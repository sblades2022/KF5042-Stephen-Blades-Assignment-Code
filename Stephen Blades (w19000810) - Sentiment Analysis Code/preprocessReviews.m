function [documents] = preprocessReviews(textData)
cleanTextData = lower(textData);
documents = tokenizedDocument(cleanTextData);
erasePunctuation(documents);
documents = removeStopWords(documents);
end