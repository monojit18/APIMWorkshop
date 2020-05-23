Test-AzResourceGroupDeployment -ResourceGroupName "workshopsgroups" `
-TemplateFile "../Standard/apim-master-deploy.json" `
-TemplateParameterFile "../Standard/apim-master-deploy.parameters.json"

New-AzResourceGroupDeployment -ResourceGroupName "workshopsgroups" `
-TemplateFile "../Standard/apim-master-deploy.json" `
-TemplateParameterFile "../Standard/apim-master-deploy.parameters.json"