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
sigma = 0.3;

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

C_list = [0.01, 0.03, 0.1, 0.3, 1, 3, 10, 30];
sigma_list = [0.01, 0.03, 0.1, 0.3, 1, 3, 10, 30];
cl = length(C_list);
sl = length(sigma_list);

final_list = [];
for i = 1:cl
    C1 = C_list(i);
    for j = 1:sl
        sigma1 = sigma_list(j);
        model = svmTrain(X, y, C1, @(x1, x2) gaussianKernel(x1, x2, sigma1 ));
        predictions = svmPredict(model, Xval);
        prediction_error = mean(double(predictions ~= yval));
        final_list = [final_list;[C1,sigma1,prediction_error]];
    endfor
endfor
[row,column] = min(min(final_list,[],3));
C = final_list(column(3),1,1);
sigma = final_list(column(3),2,1);

 





% =========================================================================

end
