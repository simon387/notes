# angular 5.2 stable

## quickstart

https://angular.io/guide/quickstart

+ ```npm install -g @angular/cli```
+ ```ng new my-app```
+ ```ng serve --open```

## generate a component inside a project

+ ```ng generate component <component-name>```

## for

+ ```<li *ngFor="let hero of heroes">```
+ with index ```*ngFor="let product of productsSelected; let i = index"```

## on event

+ ```<li *ngFor="let hero of heroes" (click)="onSelect(hero)">```

## if

+ ```<div *ngIf="selectedHero">```

## services

+ ```ng generate service <service-name>```

## routing

+ convention: ```ng generate module app-routing --flat --module=app```

## normal jQuery e Bootstrap inside components view

+ ```npm install --save bootstrap```
+ ```npm install --save jquery```
+ inside ```angular-cli.json``` put 
  ```
  "scripts": [
		"../node_modules/jquery/dist/jquery.js",
		"../node_modules/bootstrap/dist/js/bootstrap.min.js"
		],
  ```
+ same with styles/css
+ in the typescript component:
  ```
  import { Component, OnInit, Input, ElementRef, AfterViewInit } from '@angular/core';
  ...
  declare var $ : any;
  ```
## primeng

https://www.primefaces.org/primeng/
