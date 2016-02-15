({
	doInit: function (component, event, helper)
	{
		helper.getBrands(component);
	},

    brandChange: function (component, event, helper) {
        // get the template item selected of the select option
        var selectedBrandId = event.target.value;

        // Fire selection event with brand id selected
        $A.get("e.c:CarsBrandSelectedEvent").setParams({
            brand: selectedBrandId
        }).fire();
    },

    viewAllClick: function (component, event, helper) {
        // Clean selection
        document.getElementById('brandSelector').selectedIndex = 0;

		// Fire selection event with none brand selected
        $A.get("e.c:CarsBrandSelectedEvent").setParams({
            brand: null
        }).fire();
    }
})