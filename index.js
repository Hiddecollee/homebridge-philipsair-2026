/**
 * v1 - Hiddecollee fork
 * Fix: require is not defined (Node 18+ / ES modules)
 *
 * @url https://github.com/Hiddecollee/homebridge-philipsair-2026
 * Based on https://github.com/jmasarweh/homebridge-philipsair-2024
 **/

import { createRequire } from 'module';
const require = createRequire(import.meta.url);

export default (homebridge) => {
  const PhilipsAirPlatform2024 = require('./src/platform')(homebridge);
  homebridge.registerPlatform('homebridge-philipsair-2026', 'PhilipsAirPlatform2024', PhilipsAirPlatform2024, true);
};
