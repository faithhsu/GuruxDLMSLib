//
// --------------------------------------------------------------------------
//  Gurux Ltd
// 
//
//
// Filename:        $HeadURL$
//
// Version:         $Revision$,
//                  $Date$
//                  $Author$
//
// Copyright (c) Gurux Ltd
//
//---------------------------------------------------------------------------
//
//  DESCRIPTION
//
// This file is a part of Gurux Device Framework.
//
// Gurux Device Framework is Open Source software; you can redistribute it
// and/or modify it under the terms of the GNU General Public License 
// as published by the Free Software Foundation; version 2 of the License.
// Gurux Device Framework is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of 
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. 
// See the GNU General Public License for more details.
//
// More information of Gurux products: http://www.gurux.org
//
// This code is licensed under the GNU General Public License v2. 
// Full text may be retrieved at http://www.gnu.org/licenses/gpl-2.0.txt
//---------------------------------------------------------------------------

#include "../GXDLMSVariant.h"
#include "../GXDLMSClient.h"
#include "GXDLMSExtendedRegister.h"

bool CGXDLMSExtendedRegister::IsRead(int index)
{
    if (index == 3)
    {
        return m_Unit != 0;
    }
	return CGXDLMSObject::IsRead(index);
}
//Constructor.
CGXDLMSExtendedRegister::CGXDLMSExtendedRegister(void) : CGXDLMSRegister(OBJECT_TYPE_EXTENDED_REGISTER, 0)
{
}

//SN Constructor.
CGXDLMSExtendedRegister::CGXDLMSExtendedRegister(unsigned short sn) : CGXDLMSRegister(OBJECT_TYPE_EXTENDED_REGISTER, sn)
{
}

//LN Constructor.
CGXDLMSExtendedRegister::CGXDLMSExtendedRegister(basic_string<char> ln) : CGXDLMSRegister(OBJECT_TYPE_EXTENDED_REGISTER, ln)
{
}

/** 
 Status of COSEM Extended Register object.
*/
CGXDLMSVariant CGXDLMSExtendedRegister::GetStatus()
{
    return m_Status;
}
void CGXDLMSExtendedRegister::SetStatus(CGXDLMSVariant value)
{
    m_Status = value;
}

/** 
 Capture time of COSEM Extended Register object.
*/
CGXDateTime& CGXDLMSExtendedRegister::GetCaptureTime()
{
    return m_CaptureTime;
}

void CGXDLMSExtendedRegister::SetCaptureTime(CGXDateTime value)
{
    m_CaptureTime = value;
}

int CGXDLMSExtendedRegister::GetUIDataType(int index, DLMS_DATA_TYPE& type)
{
    if (index == 5)
    {
		type = DLMS_DATA_TYPE_DATETIME;			
    }
	else
	{
		return CGXDLMSObject::GetUIDataType(index, type);
	}
	return ERROR_CODES_OK;
}

// Returns amount of attributes.
int CGXDLMSExtendedRegister::GetAttributeCount()
{
	return 5;
}

// Returns amount of methods.
int CGXDLMSExtendedRegister::GetMethodCount()
{
	return 1;
}

void CGXDLMSExtendedRegister::GetValues(vector<string>& values)
{
	CGXDLMSRegister::GetValues(values);
	values.push_back(m_Status.ToString());
	values.push_back(m_CaptureTime.ToString());
}

void CGXDLMSExtendedRegister::GetAttributeIndexToRead(vector<int>& attributes)
{
	CGXDLMSRegister::GetAttributeIndexToRead(attributes);
	//Status
    if (!IsRead(4))
    {
        attributes.push_back(4);
    }
    //CaptureTime
    if (CanRead(5))
    {
        attributes.push_back(5);
    }
}

int CGXDLMSExtendedRegister::GetDataType(int index, DLMS_DATA_TYPE& type)
{
	if (index < 4)
	{
		return CGXDLMSRegister::GetDataType(index, type);
	}
	if (index == 4)
    {
		return CGXDLMSObject::GetDataType(index, type);
    }
	if (index == 5)
    {
		type = DLMS_DATA_TYPE_DATETIME;
		return ERROR_CODES_OK;
    }
	return ERROR_CODES_INVALID_PARAMETER;
}

int CGXDLMSExtendedRegister::GetValue(int index, int selector, CGXDLMSVariant& parameters, CGXDLMSVariant& value)
{
	if (index < 4)
	{
		return CGXDLMSRegister::GetValue(index, selector, parameters, value);
	}
    if (index == 4)
	{
		value = m_Status;
		return ERROR_CODES_OK;
	}
	if (index == 5)
	{
		value = m_CaptureTime;
		return ERROR_CODES_OK;
	}
	return ERROR_CODES_INVALID_PARAMETER;
}

int CGXDLMSExtendedRegister::SetValue(int index, CGXDLMSVariant& value)
{
	if (index < 4)
	{
		return CGXDLMSRegister::SetValue(index, value);
	}
    else if (index == 4)
    {                
        m_Status = value;
    }
    else if (index == 5)
    {
		if (value.vt == DLMS_DATA_TYPE_OCTET_STRING)
		{
			CGXDLMSVariant tmp;
			CGXDLMSClient::ChangeType(value.byteArr, DLMS_DATA_TYPE_DATETIME, tmp);
			m_CaptureTime = tmp.dateTime;
		}
		else
		{
			m_CaptureTime = value.dateTime;
		}
    }		
	else 
	{
		return ERROR_CODES_INVALID_PARAMETER;
	}
	return ERROR_CODES_OK;
}    

