# angular 5.0 stable

## quickstart

https://angular.io/guide/quickstart

+ ```npm install -g @angular/cli```
+ ```ng new my-app```
+ ```ng serve --open```
+ example on kill by port
  
  ```bash
   sudo kill $(sudo lsof -t -i:4200)
  ```

## generate a component inside a project

+ ```ng generate component <component-name>```

## two way data binding

```html
<input [(ngModel)]="username">

<p>Hello {{username}}!</p>
```

## for

+ ```<li *ngFor="let hero of heroes">```
+ with index ```*ngFor="let product of productsSelected; let i = index"```
+ with ngModel

  ```html
  <div *ngFor="let item of items;let index = index;trackBy:trackByIndex;">
    <input [(ngModel)]="items[index]" placeholder="item">
  </div>
  ```

## switch

```html
<td [ngSwitch]="item.done">
    <span *ngSwitchCase="true">Yes</span>
    <span *ngSwithDefault>No</span>
</td>
```

## on event

+ ```<li *ngFor="let hero of heroes" (click)="onSelect(hero)">```

## if

+ ```<div *ngIf="selectedHero">```

### else

```html
<div *ngIf="isValid;else other_content">
    content here ...
</div>

<ng-template #other_content>other content here...</ng-template>
```

## services

+ ```ng generate service <service-name>```

### examples

```typescript
this.myService.method().subscribe(returnedObject => {
    // response with no errors
}, (err) => {
    // response with errors
}, () => {
    // on complete
});
```

```typescript
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs/Observable';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { of } from 'rxjs/observable/of';
import { catchError } from 'rxjs/operators';

@Injectable()
export class MyService {

    private readonly API_MINE = environment.apiMine;

    constructor(private http: HttpClient) { }

    public getPDFonPOST( ): Observable<any> {
        const httpHeader: HttpHeaders = new HttpHeaders()
        .set("Content-type", "application/json")
        .set("Response.ContentType", "application/pdf");

        const url = this.API_MINE + '/' + id;
        return this.http.post(url, payloadObject, {
            headers: httpHeader,
            responseType : "blob"
        }).pipe(
            catchError(this.handleError('getPDFonPOST'))
        );
    }

    private handleError<T> (operation = 'operation', result?: T) {
        return (error: any): Observable<T> => {
            console.error("MyService error:", error);
            return of(result as T);
        };
    }
}

```

## routing

+ convention: ```ng generate module app-routing --flat --module=app```
+ es html
  ```html
  <div routerLink="/other-page"> click to navigate </div>
  ```
+ es typescript
  ```typescript
  goHome() {
    this.router.navigate(['']); 
  }
  ```

## Elvis's operator

```html
  {{ user?.account?.service?.joined?.dateFormatted }}
```

## normal jQuery and Bootstrap inside components view

+ ```npm install --save bootstrap```
+ ```npm install --save jquery```
+ inside ```angular-cli.json``` put

  ```json
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

### example 1

html: ```[ngClass]="{'this-is-a-class': roba == 1, 'this-is-another-class': roba == 2 }"```

ts: ```this.roba=1;```

### example 2

html: ```<div ngClass="{{getClass()}}"></div>```

ts: ```private getClass(): string { return 'class-name'; }```

### example 3

Adding class on click to a carousel single slide (slick carousel)

html:

```html
<div class="" data-slick='{"slidesToShow": 4, "slidesToScroll": 4, "infinite": false}'>
    <div *ngFor="let p of highlightedProducts;let i=index" class=""
     [ngClass]="{'this-is-a-class': selectedIndex === i}"
     (click)="setSelected(i)">
```

ts:

```typescript
public selectedIndex = -1;

public setSelected(id: number) {
    this.selectedIndex = id;
}
```

## add style

  ```html
  <div [ngStyle]="{'background-color': '#30c171'}" class="pallino"></div>
  ```

## typescript 2.0+ constant var

```private static readonly color0 : String = "#00D2DE";```

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
private selPerformancePeriodFilter: number = 0;//="Last year"

private changePerformancePeriod(period) : void {
  console.log('period -> ' + period);
}
```
## common runtime error

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
## bootstrap accordion with variable data-target

```html
<div *ngFor="let client of clients; let i=index">
    <div class="row">
        <div class="col-sm-12 acc-header collapsed" data-toggle="collapse" [attr.data-target]="'#collapse' + i">
            <div class="pull-left">
                <div>{{client.name}}</div>
            </div>
            <div class="pull-right">
                <span class="accordion-control ico-down"></span>
            </div>
         </div>
    </div>
    <div id="collapse{{i}}" class="collapse"></div>
</div>
```

```javascript
// Toggle plus minus icon on show hide of collapse element
$('.collapse').on('show.bs.collapse', function() {
    $(this).parent().find('.accordion-control').removeClass('ico-down').addClass('ico-up');
}).on('hide.bs.collapse', function() {
    $(this).parent().find('.accordion-control').removeClass('ico-up').addClass('ico-down');
});
```

## example: ngFor with sliders and input numbers

Example of managing binded sliders and input numbers, with min and max auto validation check

template

```html
<div *ngFor="let item of items; let i=index" class="row" [ngClass]="{'bk-white': i%2!=0, 'bk-grey': i%2==0}">
  <div class="col-sm-8">
    <input type="range" min="{{item.min}}" max="{{item.max}}" step=0.01 value="{{item.defaultValue}}" [(ngModel)]="currentValues[i]">
  </div>
  <div class="col-sm-4">
    <input value="{{item.defaultValue}}" type="number" min="{{item.min}}" max="{{item.max}}" step=0.01 [(ngModel)]="currentValues[i]" (change)="manageItemLimit(i)" />
  </div>
</div>
```

ts
```typescript
private currentValues: number[];
private items: Object[];

ngOnInit() {
  this.currentValues = new Array();
  // currentValues.push(...)
}

private manageItemLimit(i: number): void {
  if (this.items[i].min < this.currentValues[i] || this.currentValues[i] < this.items[i].max) {
    this.currentValues[i] = this.items[i].defaultValue;
  }
}
```

style
```css
.bk-white {
  background-color: white;
}

.bk-grey {
  background-color: grey;
}
```

## enum example

html
```html
  <div *ngIf="0 === currentStatus"/>
```

typescript
```typescript
enum GenerationStatus {
	initial,
	secondPage,
	final,
}

@Component({
	selector: 'app-example',
	templateUrl: './example.component.html',
	styleUrls: ['./example.component.css']
})
export class ExampleComponent implements OnInit {

	private currentStatus: GenerationStatus;
	private readonly statusesCount: number = this.getStatusesCount();

	constructor(
	) { }

	ngOnInit() {
		this.currentStatus = GenerationStatus.initial;
	}

	private getStatusesCount(): number {
		return Object.keys(GenerationStatus).length / 2 - 1;
	}

	private backClicked() {
		if (this.currentStatus > 0) {
			this.currentStatus--;
		}
	}

	private nextClicked() {
		if (this.currentStatus !== this.statusesCount) {
			this.currentStatus++;
		}
	}
}
```
## enabling style override of external component

for example ones from primeng

```typescript
@Component({
	selector: '',
	templateUrl: '.',
	styleUrls: ['.'],
	encapsulation: ViewEncapsulation.None
})
```

## conditional import @NgModule example


```typescript
const ENV = 'prod'; // your global ENV variable;
-----

@NgModule({
  imports: [
    ...
    HttpModule,
    ENV !== 'prod' ? InMemoryWebApiModule.forRoot(DataMockService) : [],
  ],
  ...
})
export class AppModule {}
```

## redirect to any page if url path doesn't exists

```typescript
export class AppRoutingModule {
  constructor(private router: Router) {
     this.router.errorHandler = (error: any) => {
       this.router.navigate(['dashboard']); // or redirect to default route
     };
  }
}
```

## input validation example (without form)

```html
<div>
    <input validationOnBlur [pattern]="lastnamePattern" class="text-input"
        #ulastName="ngModel" [(ngModel)]="lastname" type="text"
        required [ngClass]="{'text-input-error': !checkErrorLastname()}">
</div>
<div class="error" *ngIf="ulastName.errors?.pattern">
    incorrect input message!
</div>
```

```typescript
public lastname = '';
public readonly lastnamePattern = '^.{3,}$';

public checkErrorLastname(): boolean {
    return new RegExp(this.lastnamePattern).test(this.lastname);
}
```

## highcharts (angular2-highcharts): get istance example

```html
<chart [options]="options" (load)="saveInstance($event.context)"></chart>
```

```typescript
chart: Object;

saveInstance(chartInstance): void {
     this.chart = chartInstance;
}

updateSeries(data: Array<any>): void {
   this.chart.series[0].setData(data);
}
```

## highchars: exporting

enabling export module:

```typescript
@NgModule({
    ...
    imports: [
    BrowserModule,
    ChartModule.forRoot(
            require('highcharts'),
            require('highcharts/modules/exporting')
        )
    ],
})
```

export to svg:

```typescript
const svg = window.btoa(this.chart.getSVG());
```

export to base64:

```typescript
const options = {
    "logging": false
};

html2canvas(document.getElementById("element_id"), options).then((canvas) => {
    const image64 = canvas.toDataURL();
});
```
