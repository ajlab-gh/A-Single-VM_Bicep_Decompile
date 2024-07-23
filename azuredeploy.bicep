@description('Username for the FortiGate VM')
param adminUsername string

@description('Password for the FortiGate VM')
@secure()
param adminPassword string

@description('Naming prefix for all deployed resources. The FortiGate VM will have the suffix \'-fgt\'. For example if the prefix is \'ACME-01\' the FortiGate will be named \'acme-01-fgt\'')
param fortiGateNamePrefix string

@description('Custom naming for the deployed FortiGate resources. This will override the automatic generation based on the prefix for the FortiGate name.')
param fortiGateName string = ''

@description('Identifies whether to to use PAYG (on demand licensing) or BYOL license model (where license is purchased separately')
@allowed([
  'fortinet_fg-vm'
  'fortinet_fg-vm_payg_2023'
])
param fortiGateImageSKU string = 'fortinet_fg-vm_payg_2023'

@description('Select the image version')
@allowed([
  '6.2.0'
  '6.2.2'
  '6.2.4'
  '6.2.5'
  '6.4.0'
  '6.4.10'
  '6.4.11'
  '6.4.12'
  '6.4.13'
  '6.4.15'
  '6.4.2'
  '6.4.3'
  '6.4.5'
  '6.4.6'
  '6.4.7'
  '6.4.8'
  '6.4.9'
  '7.0.0'
  '7.0.1'
  '7.0.10'
  '7.0.11'
  '7.0.12'
  '7.0.13'
  '7.0.14'
  '7.0.2'
  '7.0.3'
  '7.0.4'
  '7.0.5'
  '7.0.6'
  '7.0.8'
  '7.0.9'
  '7.2.0'
  '7.2.1'
  '7.2.2'
  '7.2.3'
  '7.2.4'
  '7.2.5'
  '7.2.6'
  '7.2.7'
  '7.4.0'
  '7.4.1'
  '7.4.2'
  '7.4.3'
  'latest'
])
param fortiGateImageVersion string = '7.2.7'

@description('The ARM template provides a basic configuration. Additional configuration can be added here.')
param fortiGateAdditionalCustomData string = ''

@description('Virtual Machine size selection - must be F4 or other instance that supports 4 NICs')
@allowed([
  'Standard_F2s'
  'Standard_F4s'
  'Standard_F8s'
  'Standard_F16s'
  'Standard_F2'
  'Standard_F4'
  'Standard_F8'
  'Standard_F16'
  'Standard_F2s_v2'
  'Standard_F4s_v2'
  'Standard_F8s_v2'
  'Standard_F16s_v2'
  'Standard_F32s_v2'
  'Standard_DS1_v2'
  'Standard_DS2_v2'
  'Standard_DS3_v2'
  'Standard_DS4_v2'
  'Standard_DS5_v2'
  'Standard_D2s_v3'
  'Standard_D4s_v3'
  'Standard_D8s_v3'
  'Standard_D16s_v3'
  'Standard_D32s_v3'
  'Standard_D2_v4'
  'Standard_D4_v4'
  'Standard_D8_v4'
  'Standard_D16_v4'
  'Standard_D32_v4'
  'Standard_D2s_v4'
  'Standard_D4s_v4'
  'Standard_D8s_v4'
  'Standard_D16s_v4'
  'Standard_D32s_v4'
  'Standard_D2a_v4'
  'Standard_D4a_v4'
  'Standard_D8a_v4'
  'Standard_D16a_v4'
  'Standard_D32a_v4'
  'Standard_D2as_v4'
  'Standard_D4as_v4'
  'Standard_D8as_v4'
  'Standard_D16as_v4'
  'Standard_D32as_v4'
  'Standard_D2_v5'
  'Standard_D4_v5'
  'Standard_D8_v5'
  'Standard_D16_v5'
  'Standard_D32_v5'
  'Standard_D2s_v5'
  'Standard_D4s_v5'
  'Standard_D8s_v5'
  'Standard_D16s_v5'
  'Standard_D32s_v5'
  'Standard_D2as_v5'
  'Standard_D4as_v5'
  'Standard_D8as_v5'
  'Standard_D16as_v5'
  'Standard_D32as_v5'
  'Standard_D2ads_v5'
  'Standard_D4ads_v5'
  'Standard_D8ads_v5'
  'Standard_D16ads_v5'
  'Standard_D32ads_v5'
  'Standard_D2ps_v5'
  'Standard_D4ps_v5'
  'Standard_D8ps_v5'
  'Standard_D16ps_v5'
  'Standard_D32ps_v5'
  'Standard_D2pds_v5'
  'Standard_D4pds_v5'
  'Standard_D8pds_v5'
  'Standard_D16pds_v5'
  'Standard_D32pds_v5'
  'Standard_D2pls_v5'
  'Standard_D4pls_v5'
  'Standard_D8pls_v5'
  'Standard_D16pls_v5'
  'Standard_D32pls_v5'
  'Standard_D2plds_v5'
  'Standard_D4plds_v5'
  'Standard_D8plds_v5'
  'Standard_D16plds_v5'
  'Standard_D32plds_v5'
  'Standard_E2ps_v5'
  'Standard_E4ps_v5'
  'Standard_E8ps_v5'
  'Standard_E16ps_v5'
  'Standard_E32ps_v5'
  'Standard_E2pds_v5'
  'Standard_E4pds_v5'
  'Standard_E8pds_v5'
  'Standard_E16pds_v5'
  'Standard_E32pds_v5'
])
param instanceType string = 'Standard_F2s'

@description('Deploy FortiGate VM in an Availability Set or Availability Zones. If Availability Zones deployment is selected but the location does not support Availability Zones an Availability Set will be deployed. If Availability Zones deployment is selected and Availability Zones are available in the location, FortiGate A will be placed in Zone 1, FortiGate B will be placed in Zone 2')
@allowed([
  'None'
  'Availability set'
  'Availability zone'
])
param availabilityOptions string = 'None'

@description('Name of existing Availability Set in case you want to replace or add a FortiGate to an existing cluster.')
param existingAvailabilitySetName string = ''

@description('Name of existing Availability Set in case you want to replace or add a FortiGate to an existing cluster.')
param availabilityZoneNumber string = ''

@description('Accelerated Networking enables direct connection between the VM and network card. Only available on 2 CPU F/Fs and 4 CPU D/Dsv2, D/Dsv3, E/Esv3, Fsv2, Lsv2, Ms/Mms and Ms/Mmsv2')
@allowed([
  false
  true
])
param acceleratedNetworking bool = false

@description('Accelerated connections provides an enhanced bandwidth at an additional cost')
param acceleratedConnections bool = false

@description('Accelerated Connections Auxiliary SKU bandwidth Tiers')
@allowed([
  'A1'
  'A2'
  'A4'
  'A8'
])
param acceleratedConnectionsSku string = 'A1'

@description('Choose between an existing or new public IP address linked to the external interface of the FortiGate VM')
@allowed([
  'new'
  'existing'
  'none'
])
param publicIP1NewOrExisting string = 'new'

@description('Name of Public IP address, if no name is provided the default name will be the Resource Group Name as the Prefix and \'-fgt-pip\' as the suffix')
param publicIP1Name string = ''

@description('Public IP Resource Group, this value is required if an existing Public IP is selected')
param publicIP1ResourceGroup string = ''

@description('Type of public IP address')
@allowed([
  'Dynamic'
  'Static'
])
param publicIP1AddressType string = 'Static'

@description('Type of public IP address')
@allowed([
  'Basic'
  'Standard'
])
param publicIP1SKU string = 'Standard'

@description('Identify whether to use a new or existing vnet')
@allowed([
  'new'
  'existing'
])
param vnetNewOrExisting string = 'new'

@description('Name of the Azure virtual network, required if utilizing an existing VNET. If no name is provided the default name will be the Resource Group Name as the Prefix and \'-vnet\' as the suffix')
param vnetName string = ''

@description('Resource Group containing the existing virtual network, leave blank if a new VNET is being utilize')
param vnetResourceGroup string = ''

@description('Virtual Network Address prefix')
param vnetAddressPrefix string = '172.16.136.0/22'

@description('Subnet 1 Name')
param subnet1Name string = 'ExternalSubnet'

@description('Subnet 1 Prefix')
param subnet1Prefix string = '172.16.136.0/26'

@description('Subnet 1 start address, 1 consecutive private IPs are required')
param subnet1StartAddress string = '172.16.136.4'

@description('Subnet 2 Subnet')
param subnet2Name string = 'InternalSubnet'

@description('Subnet 2 Prefix')
param subnet2Prefix string = '172.16.136.64/26'

@description('Subnet 2 start address, 1 consecutive private IPs are required')
param subnet2StartAddress string = '172.16.136.68'

@description('Subnet 3 Name')
param subnet3Name string = 'ProtectedASubnet'

@description('Subnet 3 Prefix')
param subnet3Prefix string = '172.16.137.0/24'

@description('Enable Serial Console')
@allowed([
  'yes'
  'no'
])
param serialConsole string = 'yes'

@description('Connect to FortiManager')
@allowed([
  'yes'
  'no'
])
param fortiManager string = 'no'

@description('FortiManager IP or DNS name to connect to on port TCP/541')
param fortiManagerIP string = ''

@description('FortiManager serial number to add the deployed FortiGate into the FortiManager')
param fortiManagerSerial string = ''

@description('FortiGate BYOL license content')
param fortiGateLicenseBYOL string = ''

@description('FortiGate BYOL FortiFlex license token')
param fortiGateLicenseFortiFlex string = ''

@description('By default, the deployment will use Azure Marketplace images. In specific cases, using BYOL custom FortiGate images can be deployed from support.fortinet.com.')
param customImageReference string = ''

@description('Location for all resources.')
param location string = resourceGroup().location
param tagsByResource object = {}
param fortinetTags object = {
  publisher: 'Fortinet'
  template: 'A-Single-VM'
  provider: '6EB3B02F-50E5-4A3E-8CB8-2E12925831VM'
}

var imagePublisher = 'fortinet'
var imageOffer = 'fortinet_fortigate-vm_v5'
var availabilitySetName = ((existingAvailabilitySetName == '')
  ? '${fortiGateNamePrefix}-availabilityset'
  : existingAvailabilitySetName)
var availabilitySetId = {
  id: availabilitySet.id
}
var useAS = (availabilityOptions == 'Availability set')
var useAZ = ((!empty(pickZones('Microsoft.Compute', 'virtualMachines', location))) && (availabilityOptions == 'Availability zone'))
var pipZones = (useAZ ? pickZones('Microsoft.Network', 'publicIPAddresses', location, 3) : null)
var zone1 = ((availabilityZoneNumber == '')
  ? pickZones('Microsoft.Compute', 'virtualMachines', location)
  : array(availabilityZoneNumber))
var var_vnetName = ((vnetName == '') ? '${fortiGateNamePrefix}-vnet' : vnetName)
var subnet1Id = ((vnetNewOrExisting == 'new')
  ? resourceId('Microsoft.Network/virtualNetworks/subnets', var_vnetName, subnet1Name)
  : resourceId(vnetResourceGroup, 'Microsoft.Network/virtualNetworks/subnets', var_vnetName, subnet1Name))
var subnet2Id = ((vnetNewOrExisting == 'new')
  ? resourceId('Microsoft.Network/virtualNetworks/subnets', var_vnetName, subnet2Name)
  : resourceId(vnetResourceGroup, 'Microsoft.Network/virtualNetworks/subnets', var_vnetName, subnet2Name))
var fgtVmName = ((fortiGateName == '') ? '${fortiGateNamePrefix}-fgt' : fortiGateName)
var fmgCustomData = ((fortiManager == 'yes')
  ? '\nconfig system central-management\nset type fortimanager\n set fmg ${fortiManagerIP}\nset serial-number ${fortiManagerSerial}\nend\n config system interface\n edit port1\n append allowaccess fgfm\n end\n config system interface\n edit port2\n append allowaccess fgfm\n end\n'
  : '')
var customDataHeader = 'Content-Type: multipart/mixed; boundary="12345"\nMIME-Version: 1.0\n\n--12345\nContent-Type: text/plain; charset="us-ascii"\nMIME-Version: 1.0\nContent-Transfer-Encoding: 7bit\nContent-Disposition: attachment; filename="config"\n\n'
var customDataBody = 'config system global\nset hostname ${fgtVmName}\nend\nconfig system sdn-connector\nedit AzureSDN\nset type azure\nnext\nend\nconfig router static\nedit 1\nset gateway ${sn1GatewayIP}\nset device port1\nnext\nedit 2\nset dst ${vnetAddressPrefix}\nset gateway ${sn2GatewayIP}\nset device port2\nnext\nend\nconfig system interface\nedit port1\nset mode static\nset ip ${sn1IPfgt}/${sn1CIDRmask}\nset description external\nset allowaccess ping ssh https\nnext\nedit port2\nset mode static\nset ip ${sn2IPfgt}/${sn2CIDRmask}\nset description internal\nset allowaccess ping ssh https\nnext\nend\n${fmgCustomData}${fortiGateAdditionalCustomData}${configurationFile}\n'
var customDataLicenseHeader = '--12345\nContent-Type: text/plain; charset="us-ascii"\nMIME-Version: 1.0\nContent-Transfer-Encoding: 7bit\nContent-Disposition: attachment; filename="license"\n\n'
var customDataFooter = '\n--12345--\n'
var customDataFortiFlex = ((fortiGateLicenseFortiFlex == '') ? '' : 'LICENSE-TOKEN:${fortiGateLicenseFortiFlex}\n')
var customDataCombined = '${customDataHeader}${customDataBody}${customDataLicenseHeader}${configurationFile}${customDataFortiFlex}${fortiGateLicenseBYOL}${customDataFooter}'
var fgtCustomData = base64((((fortiGateLicenseBYOL == '') && (fortiGateLicenseFortiFlex == '')) ? customDataBody : customDataCombined))
var configurationFile = loadTextContent('configurationFile.txt')
var routeTableProtectedName = '${fortiGateNamePrefix}-routetable-${subnet3Name}'
var routeTableProtectedId = routeTableProtected.id
var fgtNic1Name = '${fgtVmName}-nic1'
var fgtNic1Id = fgtNic1.id
var fgtNic2Name = '${fgtVmName}-nic2'
var fgtNic2Id = fgtNic2.id
var serialConsoleEnabled = ((serialConsole == 'yes') ? true : false)
var var_publicIP1Name = ((publicIP1Name == '') ? '${fortiGateNamePrefix}-fgt-pip' : publicIP1Name)
var publicIP1Id = ((publicIP1NewOrExisting == 'new')
  ? publicIP1.id
  : resourceId(publicIP1ResourceGroup, 'Microsoft.Network/publicIPAddresses', var_publicIP1Name))
var publicIP1AddressId = {
  id: publicIP1Id
}
var nsgName = '${fortiGateNamePrefix}-nsg'
var nsgId = nsg.id
var sn1IPArray = split(subnet1Prefix, '.')
var sn1IPArray2ndString = string(sn1IPArray[3])
var sn1IPArray2nd = split(sn1IPArray2ndString, '/')
var sn1CIDRmask = string(int(sn1IPArray2nd[1]))
var sn1IPArray3 = string((int(sn1IPArray2nd[0]) + 1))
var sn1IPArray2 = string(int(sn1IPArray[2]))
var sn1IPArray1 = string(int(sn1IPArray[1]))
var sn1IPArray0 = string(int(sn1IPArray[0]))
var sn1GatewayIP = '${sn1IPArray0}.${sn1IPArray1}.${sn1IPArray2}.${sn1IPArray3}'
var sn1IPStartAddress = split(subnet1StartAddress, '.')
var sn1IPfgt = '${sn1IPArray0}.${sn1IPArray1}.${sn1IPArray2}.${int(sn1IPStartAddress[3])}'
var sn2IPArray = split(subnet2Prefix, '.')
var sn2IPArray2ndString = string(sn2IPArray[3])
var sn2IPArray2nd = split(sn2IPArray2ndString, '/')
var sn2CIDRmask = string(int(sn2IPArray2nd[1]))
var sn2IPArray3 = string((int(sn2IPArray2nd[0]) + 1))
var sn2IPArray2 = string(int(sn2IPArray[2]))
var sn2IPArray1 = string(int(sn2IPArray[1]))
var sn2IPArray0 = string(int(sn2IPArray[0]))
var sn2GatewayIP = '${sn2IPArray0}.${sn2IPArray1}.${sn2IPArray2}.${sn2IPArray3}'
var sn2IPStartAddress = split(subnet2StartAddress, '.')
var sn2IPfgt = '${sn2IPArray0}.${sn2IPArray1}.${sn2IPArray2}.${int(sn2IPStartAddress[3])}'
var imageReferenceMarketplace = {
  publisher: imagePublisher
  offer: imageOffer
  sku: fortiGateImageSKU
  version: fortiGateImageVersion
}
var imageReferenceCustomImage = {
  id: customImageReference
}
var virtualMachinePlan = {
  name: fortiGateImageSKU
  publisher: imagePublisher
  product: imageOffer
}
var fastpathtag = {
  fastpathenabled: (((acceleratedNetworking == 'true') && acceleratedConnections) ? 'true' : 'false')
}
var auxiliaryMode = (((acceleratedNetworking == 'true') && acceleratedConnections) ? 'AcceleratedConnections' : 'None')
var auxiliarySku = (((acceleratedNetworking == 'true') && acceleratedConnections) ? acceleratedConnectionsSku : 'None')

resource availabilitySet 'Microsoft.Compute/availabilitySets@2023-03-01' = if (useAS && (existingAvailabilitySetName == '')) {
  name: availabilitySetName
  location: location
  tags: (contains(tagsByResource, 'Microsoft.Compute/availabilitySets')
    ? union(fortinetTags, tagsByResource['Microsoft.Compute/availabilitySets'])
    : fortinetTags)
  properties: {
    platformFaultDomainCount: 2
    platformUpdateDomainCount: 2
  }
  sku: {
    name: 'Aligned'
  }
}

resource vnet 'Microsoft.Network/virtualNetworks@2023-04-01' = if (vnetNewOrExisting == 'new') {
  name: var_vnetName
  location: location
  tags: (contains(tagsByResource, 'Microsoft.Network/virtualNetworks')
    ? union(fortinetTags, tagsByResource['Microsoft.Network/virtualNetworks'])
    : fortinetTags)
  properties: {
    addressSpace: {
      addressPrefixes: [
        vnetAddressPrefix
      ]
    }
    subnets: [
      {
        name: subnet1Name
        properties: {
          addressPrefix: subnet1Prefix
        }
      }
      {
        name: subnet2Name
        properties: {
          addressPrefix: subnet2Prefix
        }
      }
      {
        name: subnet3Name
        properties: {
          addressPrefix: subnet3Prefix
          routeTable: {
            id: routeTableProtectedId
          }
        }
      }
    ]
  }
}

resource routeTableProtected 'Microsoft.Network/routeTables@2023-04-01' = if (vnetNewOrExisting == 'new') {
  name: routeTableProtectedName
  location: location
  tags: (contains(tagsByResource, 'Microsoft.Network/routeTables')
    ? union(fortinetTags, tagsByResource['Microsoft.Network/routeTables'])
    : fortinetTags)
  properties: {
    routes: [
      {
        name: 'VirtualNetwork'
        properties: {
          addressPrefix: vnetAddressPrefix
          nextHopType: 'VirtualAppliance'
          nextHopIpAddress: sn2IPfgt
        }
      }
      {
        name: 'Subnet'
        properties: {
          addressPrefix: subnet3Prefix
          nextHopType: 'VnetLocal'
        }
      }
      {
        name: 'Default'
        properties: {
          addressPrefix: '0.0.0.0/0'
          nextHopType: 'VirtualAppliance'
          nextHopIpAddress: sn2IPfgt
        }
      }
    ]
  }
}

resource nsg 'Microsoft.Network/networkSecurityGroups@2023-04-01' = {
  name: nsgName
  location: location
  tags: (contains(tagsByResource, 'Microsoft.Network/networkSecurityGroups')
    ? union(fortinetTags, tagsByResource['Microsoft.Network/networkSecurityGroups'])
    : fortinetTags)
  properties: {
    securityRules: [
      {
        name: 'AllowAllInbound'
        properties: {
          description: 'Allow all in'
          protocol: '*'
          sourcePortRange: '*'
          destinationPortRange: '*'
          sourceAddressPrefix: '*'
          destinationAddressPrefix: '*'
          access: 'Allow'
          priority: 100
          direction: 'Inbound'
        }
      }
      {
        name: 'AllowAllOutbound'
        properties: {
          description: 'Allow all out'
          protocol: '*'
          sourcePortRange: '*'
          destinationPortRange: '*'
          sourceAddressPrefix: '*'
          destinationAddressPrefix: '*'
          access: 'Allow'
          priority: 105
          direction: 'Outbound'
        }
      }
    ]
  }
}

resource publicIP1 'Microsoft.Network/publicIPAddresses@2023-04-01' = if (publicIP1NewOrExisting == 'new') {
  name: var_publicIP1Name
  location: location
  tags: (contains(tagsByResource, 'Microsoft.Network/publicIPAddresses')
    ? union(fortinetTags, tagsByResource['Microsoft.Network/publicIPAddresses'])
    : fortinetTags)
  sku: {
    name: publicIP1SKU
  }
  zones: pipZones
  properties: {
    publicIPAllocationMethod: publicIP1AddressType
    dnsSettings: {
      domainNameLabel: '${toLower(fgtVmName)}-${uniqueString(resourceGroup().id)}'
    }
  }
}

resource fgtNic1 'Microsoft.Network/networkInterfaces@2023-04-01' = {
  name: fgtNic1Name
  location: location
  tags: (contains(tagsByResource, 'Microsoft.Network/networkInterfaces')
    ? union(fortinetTags, tagsByResource['Microsoft.Network/networkInterfaces'], fastpathtag)
    : union(fortinetTags, fastpathtag))
  properties: {
    ipConfigurations: [
      {
        name: 'ipconfig1'
        properties: {
          privateIPAddress: sn1IPfgt
          privateIPAllocationMethod: 'Static'
          publicIPAddress: ((publicIP1NewOrExisting != 'none') ? publicIP1AddressId : null)
          subnet: {
            id: subnet1Id
          }
        }
      }
    ]
    enableIPForwarding: true
    enableAcceleratedNetworking: acceleratedNetworking
    auxiliaryMode: auxiliaryMode
    auxiliarySku: auxiliarySku
    networkSecurityGroup: {
      id: nsgId
    }
  }
  dependsOn: [
    vnet
  ]
}

resource fgtNic2 'Microsoft.Network/networkInterfaces@2023-04-01' = {
  name: fgtNic2Name
  location: location
  tags: (contains(tagsByResource, 'Microsoft.Network/networkInterfaces')
    ? union(fortinetTags, tagsByResource['Microsoft.Network/networkInterfaces'], fastpathtag)
    : union(fortinetTags, fastpathtag))
  properties: {
    ipConfigurations: [
      {
        name: 'ipconfig1'
        properties: {
          privateIPAllocationMethod: 'Static'
          privateIPAddress: sn2IPfgt
          subnet: {
            id: subnet2Id
          }
        }
      }
    ]
    enableIPForwarding: true
    enableAcceleratedNetworking: acceleratedNetworking
    auxiliaryMode: auxiliaryMode
    auxiliarySku: auxiliarySku
    networkSecurityGroup: {
      id: nsgId
    }
  }
  dependsOn: [
    vnet
  ]
}

resource fgtVm 'Microsoft.Compute/virtualMachines@2022-03-01' = {
  name: fgtVmName
  tags: (contains(tagsByResource, 'Microsoft.Compute/virtualMachines')
    ? union(fortinetTags, tagsByResource['Microsoft.Compute/virtualMachines'])
    : fortinetTags)
  location: location
  identity: {
    type: 'SystemAssigned'
  }
  zones: (useAZ ? zone1 : null)
  plan: (((fortiGateImageSKU == 'fortinet_fg-vm') && (customImageReference != '')) ? null : virtualMachinePlan)
  properties: {
    hardwareProfile: {
      vmSize: instanceType
    }
    availabilitySet: (useAS ? availabilitySetId : null)
    osProfile: {
      computerName: fgtVmName
      adminUsername: adminUsername
      adminPassword: adminPassword
      customData: fgtCustomData
    }
    storageProfile: {
      imageReference: (((fortiGateImageSKU == 'fortinet_fg-vm') && (customImageReference != ''))
        ? imageReferenceCustomImage
        : imageReferenceMarketplace)
      osDisk: {
        createOption: 'FromImage'
      }
      dataDisks: [
        {
          diskSizeGB: 30
          lun: 0
          createOption: 'Empty'
        }
      ]
    }
    networkProfile: {
      networkInterfaces: [
        {
          properties: {
            primary: true
          }
          id: fgtNic1Id
        }
        {
          properties: {
            primary: false
          }
          id: fgtNic2Id
        }
      ]
    }
    diagnosticsProfile: {
      bootDiagnostics: {
        enabled: serialConsoleEnabled
      }
    }
  }
}

output fortiGatePublicIP string = (((publicIP1NewOrExisting == 'new') && (publicIP1AddressType == 'Standard'))
  ? reference(publicIP1Id).ipAddress
  : '')
output fortiGateFQDN string = ((publicIP1NewOrExisting == 'new') ? reference(publicIP1Id).dnsSettings.fqdn : '')
