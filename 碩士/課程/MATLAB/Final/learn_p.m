function [FW, Fb, W_list, b_list]=...
    learn_p(P,T,W,b,Learn_b,Lumbda,TF_mode)
% This is the ON_line or INCREMENTAL Perceptron learning algorithm.
%
% [FW, Fb, MSE]=learn_p(P,T,W,b,Learn_b,Lumbda,TF_mode);
% Adaline learning rule with TF---purelin
% P----Input pattern
% T----Target pattern
% W----Initial weight
% b----Initial bias
% Set Learn_b=1 to update bias b, otherwise, b is not learnt
%     in the process             DEFAULT,Learn_b=1
% Lumbda---Learning factor (0 to 1), DEFAULT=0.03.
%         Better NO larger than 0.2!
% TF_mode=1(Default) if hardlims used, =0 if hardlim used.
%
% FW---Final weight
% Fb---Final bias
% W_list---List of W varied from iteration to iteration
% b_list---List of b varied from iteration to iteration
% [W_list, b_list] generated if b is a scalr only.
%%
%% [Calling example: example 2.2-2]
%P=[1 2 3 0.9 -1 -2 -1.5 -3;1 0.8 2 2 -0.3 -0.5 -1.5 -2]
%[R,Q]=size(P);
%T=[1 1 1 1 -1 -1 -1 -1];
%W=[1 -2]; b=2.5;
%Learn_b=1; Lumbda=0.2; TF_mode=1;
%[FW, Fb, W_list, b_list]=learn_p(P,T,W,b,Learn_b,Lumbda,TF_mode)
%a=hardlims(FW*P+Fb*ones(1,Q));
%disp('Upper half is Target, Lower half is NN output'); [T;a]
%...
%...   Plot a figure concerning decision boundary and training data.
%...
%figure;
%T0 = [1 1 1 1 0 0 0 0];
%V = [-4 4 -3 3];
%plotpv(P,T0,V)
%plotpc(FW,Fb)
%hold on
% 
%x1 = -4:0.01:4;
%x2 = -(FW(1,1)*x1+Fb)/FW(1,2);
%plot(x1,x2,'r-')
%hold off
%...

%... Written by PenChen Chou, 2002-07-18.
%... Updated by Prof. Sheng-Ju Wu, 2020-03-10.

% Get Q as the sample size (How many patterns in an epoch)
[R, Q]=size(P); [S, Q1]=size(T);
randn('state',sum(100*clock));
if Q~=Q1
    error('===>ERROR: I/O sample size is not matched');
end
% Set defaults
if nargin<=6
    TF_mode=1;
end
if nargin<=5
    Lumbda=0.03;
end
if nargin<=4
    Learn_b=1;
end
if nargin<=3
    b=0.001*randn(S,1);
end
if nargin<=2
    W=0.001*randn(S,R);
end

% Initiallization
MAX_iter=10000;
iter=0;     % One iter is one EPOCH.
give_up=0;  % No much improvement on MSE, then we give up after 1000 times.
if Lumbda>=0.21, Lumbda=0.02; end % Not too large
ERR=1; W_list=[]; b_list=[];
if length(b)==1, W_list=W';b_list=b; end
init_W=W; init_b=b;
% Update weight W and bias b.
fprintf('\n===>Now running [Perceptron learning rule (learn_p)]. Please wait!\n');
while (ERR)
    OK=0*ones(1,Q); iter=iter+1;
    for i=1:Q
        [~,nn]=size(W*P(:,i));
        n=W*P(:,i)+b*ones(1,nn); % Get NN output
        if TF_mode==1
            a=hardlims(n);
        elseif TF_mode==0
            a=hardlim(n);
        else
            error('Error on TF_mode assinment, (0 or 1 only)!');
        end
        err=T(:,i)-a; % Find err
        if sum(abs(err))~=0
            W=W+Lumbda*err*[P(:,i)]';  % Update W
            if Learn_b==1
                b=b+Lumbda*err;        % Update b
            end
        else
            OK(i)=1;
        end
        if length(b)==1
            W_list=[W_list W'];
            b_list=[b_list b];
        end
    end % end for
    if sum(OK)==Q
        ERR=0;
    end
    if iter>MAX_iter && sum(OK)~=Q
        disp('Warning!, Search aborted (Max. iter.), but no good!');
        ERR=0;
    end
end % while

% Set final results
FW=W; Fb=b; W=init_W; b=init_b;

% End of this function file.
