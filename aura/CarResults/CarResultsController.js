({
    doInit: function (component, event, helper){
		helper.getCars(component, null);
	},

	updateList: function (component, event, helper) {
		var brand = event.getParam('brand');
        helper.getCars(component, brand);
	}
})