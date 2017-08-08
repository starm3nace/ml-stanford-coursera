function [J grad] = nnCostFunction(nn_params, ...
                                   input_layer_size, ...
                                   hidden_layer_size, ...
                                   num_labels, ...
                                   X, y, lambda)
%NNCOSTFUNCTION Implements the neural network cost function for a two layer
%neural network which performs classification
%   [J grad] = NNCOSTFUNCTON(nn_params, hidden_layer_size, num_labels, ...
%   X, y, lambda) computes the cost and gradient of the neural network. The
%   parameters for the neural network are "unrolled" into the vector
%   nn_params and need to be converted back into the weight matrices.
%
%   The returned parameter grad should be a "unrolled" vector of the
%   partial derivatives of the neural network.
%

% Reshape nn_params back into the parameters Theta1 and Theta2, the weight matrices
% for our 2 layer neural network
Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
                 hidden_layer_size, (input_layer_size + 1));

Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
                 num_labels, (hidden_layer_size + 1));

% Setup some useful variables
m = size(X, 1);

% You need to return the following variables correctly
J = 0;
Theta1_grad = zeros(size(Theta1));
Theta2_grad = zeros(size(Theta2));

m
size(Theta1_grad)
% ====================== YOUR CODE HERE ======================
% Instructions: You should complete the code by working through the
%               following parts.
%
% Part 1: Feedforward the neural network and return the cost in the
%         variable J. After implementing Part 1, you can verify that your
%         cost function computation is correct by verifying the cost
%         computed in ex4.m

% ad 'bias' unit to input layer (i.e. a 'one' for each observation)
a1 = [ones(m, 1), X];

% z2 represents 25 activation units of the first hidden layers
% each row represents an observation
% thus z2 has size 5000*25
z2 = a1*Theta1'; size(z2)

% a2 is the activation values of second layer;
% a2 = sigmoid(z2) PLUS BIAS UNIT
a2 = [ones(m, 1), sigmoid(z2)]; size(a2)
size(Theta2)

z3 = a2*Theta2'; size(z3)

% for each observation, a3 is the output layer: a list of probabilities
% that the input corresponded to each of 10 possible classes
a3 = sigmoid(z3);

% https://stackoverflow.com/questions/10070443/row-wise-operations-in-octave
% hyptothesis h for some observation would correspond to the classes
% with the HIGHEST probability; that is achieved by the code below
% (see stack overflow link)
[max_values, indices] = max(a3,[],2);

size(indices)

% FIX: h should be 5000x10 where rows contain 9 zeroes and one 1, corresponding
% to the max prob

% <codecell>
% first h is only zeroes
h = zeros(m, num_labels); size(h)

% iterate over every row of H and replace corresponding column with a one;
% column 1 maps to ONE, column 10 maps to ZERO

for i = 1:m
    H_i = indices(i); % hypothesis for observation i is H_i
    h(i, H_i) = 1; % MAP a one to the corresponding column for observation i
end
% <codecell>
% Cost of NN without regularization
%J_nn =


%J_log = -(y'*log(h) + (1-y)'*log(1-h))/m;

% Part 2: Implement the backpropagation algorithm to compute the gradients
%         Theta1_grad and Theta2_grad. You should return the partial derivatives of
%         the cost function with respect to Theta1 and Theta2 in Theta1_grad and
%         Theta2_grad, respectively. After implementing Part 2, you can check
%         that your implementation is correct by running checkNNGradients
%
%         Note: The vector y passed into the function is a vector of labels
%               containing values from 1..K. You need to map this vector into a
%               binary vector of 1's and 0's to be used with the neural network
%               cost function.
%
%         Hint: We recommend implementing backpropagation using a for-loop
%               over the training examples if you are implementing it for the
%               first time.
%
% Part 3: Implement regularization with the cost function and gradients.
%
%         Hint: You can implement this around the code for
%               backpropagation. That is, you can compute the gradients for
%               the regularization separately and then add them to Theta1_grad
%               and Theta2_grad from Part 2.
%



















% -------------------------------------------------------------

% =========================================================================

% Unroll gradients
grad = [Theta1_grad(:) ; Theta2_grad(:)];


end
