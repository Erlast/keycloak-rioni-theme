import { h } from 'vue';
import type { IconSet, IconProps } from 'vuetify';
import checkOn from './checkOn.vue';
import checkOff from './checkOff.vue';
import arrowRightWhite from './arrowRightWhite.vue';
import arrowRightWhiteB from './arrowRightWhiteB.vue';
import formCheckOff from './formCheckOff.vue';
import formCheckOn from './formCheckOn.vue';
import topUp from './topUp.vue';
import wallet from './wallet.vue';
import balance from './balance.vue';
import nickel from './nickel.vue';
import coin from './coin.vue';

const customSvgNameToComponent: any = {
  checkOn,
  checkOff,
  arrowRightWhite,
  arrowRightWhiteB,
  formCheckOff,
  formCheckOn,
  topUp,
  wallet,
  balance,
  nickel,
  coin
};

const rioniIcons: IconSet = {
  component: (props: IconProps) => h(customSvgNameToComponent[props.icon as string]),
};

export { rioniIcons /* aliases */ };
