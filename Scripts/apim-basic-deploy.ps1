Test-AzResourceGroupDeployment -ResourceGroupName "workshopsgroups" `
-TemplateFile "../Basic/apim-master-deploy.json" `
-TemplateParameterFile "../Basic/apim-master-deploy.parameters.json"

New-AzResourceGroupDeployment -ResourceGroupName "workshopsgroups" `
-TemplateFile "../Basic/apim-master-deploy.json" `
-TemplateParameterFile "../Basic/apim-master-deploy.parameters.json"