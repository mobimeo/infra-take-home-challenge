package test

import (
	"testing"

	"github.com/gruntwork-io/terratest/modules/logger"
	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

func TestTerraformLokiStack(t *testing.T) {
	logger.Log(t, "Starting terratest logger")

	// Construct the terraform options with default to handle the most common retryable errors
	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		TerraformDir: "./../../../../",
		Targets:      []string{"module.loki_stack"},
		Lock:         true,
		LockTimeout:  "5m",
	})

	// Run "terraform init" and "terraform apply". Fail the test if there are any errors.
	terraform.InitAndApply(t, terraformOptions)

	// Run `terraform output` to get the values of output variables
    release := terraform.Output(t, terraformOptions, "app_helm_release_status")

	// Check the terraform outputs had the expected values.
	assert.Equal(t, "deployed", release)
}
