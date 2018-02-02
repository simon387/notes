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

## add a css class to an html element

html: ```[ngClass]="{'this-is-a-class': roba == 1 }"```

ts: ```this.roba=1;```

## note on typescript 2.0+

+ constant var: ```private static readonly color0 : String = "#00D2DE";```

## select example

template:

```html
<select [(ngModel)]="selPerformancePeriodFilter" (ngModelChange)="changePerformancePeriod(selPerformancePeriodFilter)">
	<option value=0>Last year</option>
	<option value=1>Last 30 days</option>
</select>
```

component:

```typescript
public selPerformancePeriodFilter: number = 0;//="Last year"

public changePerformancePeriod(period) : void {
	console.log('period -> ' + period);
}
```
## common errors

+ error at runtime, while binding variables etc : typerror \[...\] $any is not a function
  + solved with a library downgrade in package.json
    from
    
    ```json
    "dependencies": {
    "@angular/animations": "^5.2.1",
    "@angular/common": "^5.2.1",
    "@angular/compiler": "^5.0.0",
    "@angular/core": "^5.2.1",
    "@angular/forms": "^5.2.1",
    "@angular/http": "^5.2.1",
    "@angular/platform-browser": "^5.2.1",
    "@angular/platform-browser-dynamic": "^5.0.0",
    "@angular/router": "^5.0.0",
    "@ng-bootstrap/ng-bootstrap": "^1.0.0-beta.9",
    "angular": "^1.6.8",
    "angular-in-memory-web-api": "^0.5.2",
    "angular2-highcharts": "^0.5.5",
    "bootstrap": "^3.3.7",
    "core-js": "^2.4.1",
    "font-awesome": "^4.7.0",
    "jquery": "^3.3.1",
    "moment": "^2.20.1",
    "ng2-carouselamos": "^3.2.0",
    "primeng": "^5.0.2",
    "rxjs": "^5.5.2",
    "zone.js": "^0.8.14"
    },
    ```
  
    to
    ```json
    "dependencies": {
    "@angular/animations": "5.0.0",
    "@angular/common": "5.0.0",
    "@angular/compiler": "5.0.0",
    "@angular/core": "5.0.0",
    "@angular/forms": "5.0.0",
    "@angular/http": "5.0.0",
    "@angular/platform-browser": "5.0.0",
    "@angular/platform-browser-dynamic": "5.0.0",
    "@angular/router": "5.0.0",
    "@ng-bootstrap/ng-bootstrap": "^1.0.0-beta.9",
    "bootstrap": "^3.3.7",
    "core-js": "^2.4.1",
    "font-awesome": "^4.7.0",
    "jquery": "^3.2.1",
    "primeng": "^5.0.2",
    "rxjs": "^5.5.2",
    "zone.js": "^0.8.14",
    "angular-in-memory-web-api": "^0.5.2",
    "angular2-highcharts": "^0.5.5",
    "moment": "^2.20.1",
    "ng2-carouselamos": "^3.2.0"
    },
    ```
