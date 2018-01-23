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

## on event

+ ```<li *ngFor="let hero of heroes" (click)="onSelect(hero)">```

## if

+ ```<div *ngIf="selectedHero">```

## services

+ ```ng generate service <service-name>```

## routing

+ convention: ```ng generate module app-routing --flat --module=app```

