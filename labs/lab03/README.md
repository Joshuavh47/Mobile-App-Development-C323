Josh Eres
1/18/24

Unwrapping fails if the user presses control-D when providing input to the readLine() function because the terminal will interpret this as an EOF, and will cause the readLine() to return null. Since null is not the same type as a String, unwrapping the variable as a String will not work. 