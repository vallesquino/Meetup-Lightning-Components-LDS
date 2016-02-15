({
    //Call to server to get car list
    getCars: function (component, brandId) {
        var me = this,
			action = component.get("c.getCarsByBrandL");

        action.setParams({
            brand: brandId
        });

        me.performAction(action, function (cars, success, errorMessage){
			if (success){
				component.set("v.cars", cars);
			}else {
				//show error message
			}
        });
    },

    //Server-side action call wrapper
	performAction: function (action, callback){
		var me = this,
			actionResponse;

		action.setCallback(me, function (action) {
			actionResponse = action.getReturnValue();

			//Callback function call if any
			if (actionResponse && typeof callback === 'function'){
				callback(actionResponse.data, !actionResponse.error, actionResponse.message);
			}
        });
        $A.enqueueAction(action);
    }
})