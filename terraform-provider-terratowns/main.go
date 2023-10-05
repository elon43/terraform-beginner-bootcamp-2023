// package main: Declares the package name.
// The main package is special in Go, it'w where the execution of the program starts.
package main

// import "fmt": Imports the fmt package, which contains functions for formatted I/O including functions
// for printing to the console
import (
  "fmt"
 // "log"
  "github.com/hashicorp/terraform-plugin-sdk/v2/plugin"
  "github.com/hashicorp/terraform-plugin-sdk/v2/helper/schema"

)
// func main(): The entry point of the Go executable program.  The execution of the program starts here.
func main() {
  plugin.Serve(&plugin.ServeOpts{
    ProviderFunc: Provider,


  })
  // Format.PrintLine
  // Prints to standard output, and prints a new line character at the end
  fmt.Println("Hello, World!")
}

//in golang, a title case function will get exported
func Provider() *schema.Provider {
  var p *schema.Provider
  p = &schema.Provider{
    ResourcesMap: map[string]*schema.Resource{

	},
	DataSourcesMap: map[string]*schema.Resource{

	},
	Schema: map[string]*schema.Schema{
	  "endpoint": {
		Type: schema.TypeString,
		Required: true,
		Description: "The endpoint of the eternal service",
	  },
	  "token": {
		Type: schema.TypeString,
		Sensitive: true, //make the token as sensitive to hide it in the logs
		Required: true,
		Description: "The bearer token for authorization",
	  },
	  "user_uuid": {
		Type: schema.TypeString,
		Required: true,
		Description: "UUID for configuration",
		//ValidateFunc: validateUUID,
	  },

	},
  }
  //p.ConfigureContextFunc = providerConfigure(p)
  return p
}

// func validateUUID(v interface{}, k string) (ws []string, []error) {
//   log.Print('validateUUID:start')
//   value := v.(string)
//   if _,err = uuid.Parse(value); err != nil {
// 	errors = append(error, fmt.Errorf("invalid UUID format"))
//   }
//   log.Print('validateUUID:end')
// }