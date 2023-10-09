import { Component, OnInit } from '@angular/core';
import { environment } from 'src/enviroments/enviroments';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})

export class AppComponent implements OnInit{
  url:any = environment.args;

  ngOnInit(): void {
    throw new Error('Method not implemented.');
  }





}
