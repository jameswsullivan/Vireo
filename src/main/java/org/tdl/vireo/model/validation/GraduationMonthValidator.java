package org.tdl.vireo.model.validation;

import edu.tamu.weaver.validation.model.InputValidationType;
import edu.tamu.weaver.validation.validators.BaseModelValidator;
import edu.tamu.weaver.validation.validators.InputValidator;

public class GraduationMonthValidator extends BaseModelValidator {

    public static final String MONTH_YEAR_REGEX = "^\\w+ \\d{4}$";

    public GraduationMonthValidator() {
        String monthProperty = "month";
        this.addInputValidator(new InputValidator(InputValidationType.required, "Graduation Month requires a month", monthProperty, true));
        this.addInputValidator(new InputValidator(InputValidationType.pattern, "Not a valid month", monthProperty, MONTH_YEAR_REGEX));
    }

}
