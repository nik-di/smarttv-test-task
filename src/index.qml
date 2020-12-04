ActivityManager {
	width: 100%;
	height: 100%;
    id: manager;

	//@using { src.pages.MainMenu }
	LazyActivity { name: "main-menu"; component: "src.pages.MainMenu"; }
	
	//@using { src.pages.FilmsMenu }
    LazyActivity {
        name: "films-menu"; 
        component: "src.pages.FilmsMenu";
        
    }

	onCompleted: { this.push("main-menu") }
}