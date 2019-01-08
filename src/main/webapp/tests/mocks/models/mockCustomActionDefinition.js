var mockCustomActionDefinition1 = {
    id: 1,
    isStudentVisible: false,
    label: "custom action 1"
};

var mockCustomActionDefinition2 = {
    id: 2,
    isStudentVisible: false,
    label: "custom action 2"
};

var mockCustomActionDefinition3 = {
    id: 3,
    isStudentVisible: true,
    label: "custom action 3"
};

var mockCustomActionDefinition = function($q) {
    var model = mockModel($q, mockCustomActionDefinition1);

    return model;
};

angular.module('mock.customActionDefinition', []).service('CustomActionDefinition', mockCustomActionDefinition);

