import i18n from 'i18n-js';
import memoize from 'lodash.memoize'; // Use for caching/memoize for better performance

import en from './en';
import si from './si';
import ta from './ta';

i18n.translations = {
  en,
  si,
  ta
};

i18n.fallbacks = true;
export default i18n;
