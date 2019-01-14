describe('controller: EmailTemplateRepoController', function () {

    var controller, scope;

    beforeEach(function() {
        module('core');
        module('vireo');
        module('mock.dragAndDropListenerFactory');
        module('mock.emailTemplateRepo');
        module('mock.fieldPredicateRepo');
        module('mock.modalService');
        module('mock.restApi');
        module('mock.storageService');
        module('mock.wsApi');

        inject(function ($controller, _$q_, $rootScope, $window, _DragAndDropListenerFactory_, _EmailTemplateRepo_, _FieldPredicateRepo_, _ModalService_, _RestApi_, _StorageService_, _WsApi_) {
            installPromiseMatchers();
            scope = $rootScope.$new();

            controller = $controller('EmailTemplateRepoController', {
                $q: _$q_,
                $scope: scope,
                $window: $window,
                DragAndDropListenerFactory: _DragAndDropListenerFactory_,
                EmailTemplateRepo: _EmailTemplateRepo_,
                FieldPredicateRepo: _FieldPredicateRepo_,
                ModalService: _ModalService_,
                RestApi: _RestApi_,
                StorageService: _StorageService_,
                WsApi: _WsApi_
            });

            // ensure that the isReady() is called.
            scope.$digest();
        });
    });

    describe('Is the controller defined', function () {
        it('should be defined', function () {
            expect(controller).toBeDefined();
        });
    });

});