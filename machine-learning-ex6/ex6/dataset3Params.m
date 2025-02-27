function [C, sigma] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.03;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%

bestScore = 99999999;
for Cval = [0.01, 0.03, 0.1, 0.3, 1, 3, 30]
	for sigmaval = [0.01, 0.03, 0.1, 0.3, 1, 3, 30]
		model = svmTrain(X, y , Cval, @(x1, x2) gaussianKernel(x1, x2, sigmaval));
		scores = svmPredict(model, Xval);
		score = mean(double(scores ~= yval));
		if score < bestScore;
			bestScore = score;
			C = Cval;
			sigma = sigmaval;
		end
	end
end






% =========================================================================

end
