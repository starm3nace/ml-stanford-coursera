function p = predict(Theta1, Theta2, X)
%PREDICT Predict the label of an input given a trained neural network
%   p = PREDICT(Theta1, Theta2, X) outputs the predicted label of X given the
%   trained weights of a neural network (Theta1, Theta2)

% Useful values
m = size(X, 1);
num_labels = size(Theta2, 1);

% You need to return the following variables correctly
p = zeros(size(X, 1), 1);

% ====================== YOUR CODE HERE ======================
% Instructions: Complete the following code to make predictions using
%               your learned neural network. You should set p to a
%               vector containing labels between 1 to num_labels.
%
% Hint: The max function might come in useful. In particular, the max
%       function can also return the index of the max element, for more
%       information see 'help max'. If your examples are in rows, then, you
%       can use max(A, [], 2) to obtain the max for each row.



%num_labels


%size(X)

% ONE Example

X = [ones(m, 1), X]; % add bias unit made of ones

% second layer

a_2 = sigmoid(X*Theta1') ;% size(a_2)
a_2 = [ones(m, 1), a_2];% size(a_2) % add bias unit made of ones
size(Theta2)
% a_3 is the final, OUTPUT LAYER
a_3 = sigmoid(a_2*Theta2') ;% size(a_3)
[V, iV] = max(a_3, [], 2);

p = iV;

% =========================================================================


end
