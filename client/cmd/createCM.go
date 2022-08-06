/*
Copyright © 2022 NAME HERE <EMAIL ADDRESS>

*/
package cmd

import (
	"fmt"

	"github.com/spf13/cobra"
)

// createCMCmd represents the createCM command
var createCMCmd = &cobra.Command{
	Use:   "createCM",
	Short: "Creates a Club Member",
	Long:  `Creates a Club Member by reading the createCM.json file, assembling, and issuing the gRPC call.`,
	Run: func(cmd *cobra.Command, args []string) {
		fmt.Println("createCM called")
	},
}

func init() {
	rootCmd.AddCommand(createCMCmd)

	// Here you will define your flags and configuration settings.

	// Cobra supports Persistent Flags which will work for this command
	// and all subcommands, e.g.:
	// createCMCmd.PersistentFlags().String("foo", "", "A help for foo")

	// Cobra supports local flags which will only run when this command
	// is called directly, e.g.:
	// createCMCmd.Flags().BoolP("toggle", "t", false, "Help message for toggle")
}
