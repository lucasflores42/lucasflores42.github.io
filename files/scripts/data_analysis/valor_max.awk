BEGIN {
    # Initialize variables
    count3 = 0;
}

{
    # Round the values to 3 decimal places for consistency
    parametro2 = sprintf("%.3f", $2);
    parametro3 = sprintf("%.3f", $1);
    value4 = $3;

    # Track unique values of column 3
    if (!(parametro3 in seen_parametro3)) {
        parametro3_array[count3] = parametro3;
        seen_parametro3[parametro3] = 1;
        count3++;
    }

    # Update the maximum value of column 4 for each value of column 3
    if (!(parametro3 in max_value) || value4 > max_value[parametro3]) {
        max_value[parametro3] = value4;
        best_parametro2[parametro3] = parametro2;
    }
}

END {
    # Output the results
    for (i = 0; i < count3; i++) {
        parametro3 = parametro3_array[i];
        printf "%f %f %f\n", parametro3, best_parametro2[parametro3], max_value[parametro3];
    }
}