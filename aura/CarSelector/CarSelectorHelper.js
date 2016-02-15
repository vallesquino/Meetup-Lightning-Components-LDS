({
	//Call to server to get brand list
    getBrands: function (component) {
        var me = this,
			action = component.get("c.getBrandsL");

        me.performAction(action, function (brands, success, errorMessage){
			if (success){
				component.set("v.brands", brands);
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