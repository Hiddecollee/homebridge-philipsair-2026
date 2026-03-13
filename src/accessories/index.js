'use-strict';

import { createRequire } from 'module';
const require = createRequire(import.meta.url);

export const AccessoriesHandler = require('./accessories.handler').default;
export const AccessoriesConfig = require('./accessories.config').default;
export const AccessoriesService = require('./accessories.service');
export const AccessoriesSetup = require('./accessories.setup');
