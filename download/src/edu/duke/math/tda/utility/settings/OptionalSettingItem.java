/*
 * Created 2012
 * 
 * This file is part of Topological Data Analysis
 * edu.duke.math.tda
 * TDA is licensed from Duke University.
 * Copyright (c) 2012-2014 by John Harer
 * All rights reserved.
 * 
 */

package edu.duke.math.tda.utility.settings;

/**
 * Holds an individual setting that is loaded.
 * 
 * <p><strong>Details:</strong> <br>
 *  
 * <p><strong>Change History:</strong> <br>
 * Created 2012
 * 
 * @author Jurgen Sladeczek (hjs) <br>
 * For the latest info, please visit www.math.duke.edu.
 */
public class OptionalSettingItem extends SettingItem {

    /**
     * Constructor for creating a new "optional" settingItem.
     * 
     * @param _itemNameCanonical The unique name that we use to refer to the settingItem.
     * @param _itemNameDescriptive The descriptive name of the settingItem.
     * @param _settingNameForDisplay The special name of the settingItem used in user feedback.
     * 
     */
    public OptionalSettingItem( 
            final String _itemNameCanonical,
            final String _itemNameDescriptive, 
            final String _settingNameForDisplay ) throws Exception {

        super( _itemNameCanonical, _itemNameDescriptive, _settingNameForDisplay );
    }

    /**
     * Constructor based on an existing settingItem. Note that the invoked super class
     * constructor does a "deep" copy.
     *
     * @param _settingItem The settingItem that we want to use as basis for the new one.
     * 
     */ 
    public OptionalSettingItem ( SettingItem _settingItem ) {

        super( _settingItem );
    }

    /**
     * Validation of an "optional" setting item.
     * 
     */
    // Note: Depending on whether this method returns 'true' or 'false', we will
    // add the settingItem to a collection. This lets us present all input related
    // errors to the user at one time.
    public boolean validate( 
            final String _itemValueAsLoaded,
            final String _dataTypeToValidateAgainst,
            final int _validationType,
            final Object _additionalInfo,
            final Object _defaultValue ) throws Exception {
        
        boolean isValidDataType = true;
        String strItemValueToValidate;

	    setItemValueAsLoaded( _itemValueAsLoaded );
	    
	    // For optional items we allow empty strings in case no value is provided
	    // (replacing null values with empty strings just makes our life a little
	    // easier down the road: Note that from a practical point of view, the 
	    // difference is only whether the setting name was found in the settings 
	    // file without a value specified, or if it was omitted entirely. We treat
	    // both cases the same anyway.)
	    if ( _itemValueAsLoaded  == null ) {

	        strItemValueToValidate = new String( "" );
	    }
	    else {

	        strItemValueToValidate = new String( _itemValueAsLoaded );
	    }
        
	    // For optional settings we pass along the default value independent of the supplied value
		isValidDataType = super.validate( strItemValueToValidate,
		        _dataTypeToValidateAgainst,
		        _validationType,
		        _additionalInfo, 
		        _defaultValue );

        this.setValidSetting( isValidDataType );
        
        return isValidDataType;
    }
}

