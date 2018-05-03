package main

import (
	_ "github.com/Lt0/sysmon/routers"
	"github.com/astaxie/beego"
)

func main() {
	initStaticDir()

	beego.Run()
}

func initStaticDir(){
	beego.BConfig.WebConfig.DirectoryIndex = true
	beego.BConfig.WebConfig.StaticDir["/web"] = "web"
	beego.BConfig.WebConfig.StaticDir["/static"] = "web/dist/static"
	if beego.BConfig.RunMode == "dev" {
		beego.BConfig.WebConfig.StaticDir["/swagger"] = "swagger"
	}
}