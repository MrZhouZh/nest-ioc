import { Controller, Get, Headers, Inject } from '@nestjs/common';
import { AppService } from './app.service';

@Controller()
export class AppController {
  // constructor(private readonly appService: AppService) {}
  // 属性注入
  @Inject('app_service')
  private readonly appService: AppService;
  @Inject('person')
  private readonly person: { name: string; age: number };
  @Inject('person2')
  private readonly person2: { name: string; desc: string };
  @Inject('person3')
  private readonly person3: { name: string };
  @Inject('person4')
  private readonly person4: { name: string; desc: string };
  @Inject('person5')
  private readonly person5: { name: string; age: number };
  // 或者构造器注入
  // constructor(
  //   @Inject('app_service') private readonly appService: AppService,
  //   @Inject('person') private readonly person: { name: string; age: number },
  //   @Inject('person2') private readonly person2: { name: string; desc: string },
  //   @Inject('person3') private readonly person3: { name: string },
  //   @Inject('person4') private readonly person4: { name: string; desc: string },
  //   @Inject('person5') private readonly person5: { name: string; age: number },
  // ) {}

  @Get()
  getHello(@Headers() headers): string {
    console.log('access');
    // console.log(headers);
    // console.log(this.person);
    // console.log(this.person2);
    // console.log(this.person3);
    // console.log(this.person4);
    // console.log(this.person5);

    return this.appService.getHello();
  }
}
