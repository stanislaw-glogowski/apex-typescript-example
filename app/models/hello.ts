export interface IHello {
  message: string;
  asyncMessage: Promise<string>;
}

export class Hello implements IHello {
  constructor(protected name: string) {
    //
  }

  get message(): string {
    return `Hello ${this.name}!`;
  }

  get asyncMessage(): Promise<string> {
    return Promise.resolve(this.message);
  }
}
