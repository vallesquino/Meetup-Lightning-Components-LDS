<aura:application >
	<ltng:require styles="/resource/SLDS0121/assets/styles/salesforce-lightning-design-system-ltng.css" />
    <div class="slds">
        <!-- HEADER -->
        <div class="slds-anchor slds-text-heading--medium slds-text-align--center slds-theme--alt-inverse">
        	<c:svg xlinkHref="/resource/SLDS0121/assets/icons/custom-sprite/svg/symbols.svg#custom31" ariaHidden="true" class="slds-icon slds-icon--large"/>
            Car App
        </div>
        
        <div class="slds-m-vertical--medium"></div>
        <c:CarSelector />
        
        <div class="slds-m-vertical--medium"></div>
        <c:CarResults />
    </div>
</aura:application>