# This code contains various utility functions 

## limit the display of model outputs to 3 decimal places
# Custom summary wrapper function for glm and glmmTMB
custom_summary <- function(model) {
  # Check if the model is from glmmTMB
  if ("glmmTMB" %in% class(model)) {
    
    # Get the summary of the glmmTMB model
    summary_obj <- summary(model)
    
    # Extract the coefficient matrix for conditional part
    coef_matrix <- summary_obj$coefficients$cond
    
    # Round the coefficients to 3 decimal places
    coef_matrix_rounded <- round(coef_matrix, 3)
    
    # Replace the original coefficients with the rounded ones
    summary_obj$coefficients$cond <- coef_matrix_rounded
    
    # Print the summary with rounded coefficients
    print(summary_obj)
    
  } else if ("glm" %in% class(model)) {
    
    # Get the summary of the glm model
    summary_obj <- summary(model)
    
    # Extract the coefficient matrix
    coef_matrix <- summary_obj$coefficients
    
    # Round the coefficients to 3 decimal places
    coef_matrix_rounded <- round(coef_matrix, 3)
    
    # Replace the original coefficients with the rounded ones
    summary_obj$coefficients <- coef_matrix_rounded
    
    # Print the summary with rounded coefficients
    print(summary_obj)
    
  } else {
    print("The model is not of class 'glm' or 'glmmTMB'")
  }
}
