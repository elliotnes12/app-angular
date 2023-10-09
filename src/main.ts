import { platformBrowserDynamic } from '@angular/platform-browser-dynamic';

import { AppModule } from './app/app.module';
import { environment } from './enviroments/enviroments';


// Cambia la URL de la configuración según la variable de entorno
fetch(environment.CUSTOM_ENV_FILE)
  .then(response => response.json())
  .then(config => {
   
    platformBrowserDynamic()
      .bootstrapModule(AppModule)
      .catch(err => console.error(err));
  });
  
platformBrowserDynamic().bootstrapModule(AppModule)
  .catch(err => console.error(err));
