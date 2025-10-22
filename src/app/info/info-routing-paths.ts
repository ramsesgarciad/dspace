import { getInfoModulePath } from '../app-routing-paths';

export const END_USER_AGREEMENT_PATH = 'end-user-agreement';
export const PRIVACY_PATH = 'privacy';
export const FEEDBACK_PATH = 'feedback';
export const COAR_NOTIFY_SUPPORT = 'coar-notify-support';
export const ACCESSIBILITY_SETTINGS_PATH = 'accessibility';
export const POLICIES_PATH = 'policies';
export const REQUIREMENTS_PATH = 'requirements';
export const AWARD_PATH = 'award';

export function getEndUserAgreementPath() {
  return getSubPath(END_USER_AGREEMENT_PATH);
}

export function getPrivacyPath() {
  return getSubPath(PRIVACY_PATH);
}

export function getFeedbackPath() {
  return getSubPath(FEEDBACK_PATH);
}

export function getCOARNotifySupportPath(): string {
  return getSubPath(COAR_NOTIFY_SUPPORT);
}

export function getAccessibilitySettingsPath() {
  return getSubPath(ACCESSIBILITY_SETTINGS_PATH);
}

export function getPoliciesPath() {
  return getSubPath(POLICIES_PATH);
}

export function getRequirementsPath() {
  return getSubPath(REQUIREMENTS_PATH);
}

export function getAwardPath() {
  return getSubPath(AWARD_PATH);
}

function getSubPath(path: string) {
  return `${getInfoModulePath()}/${path}`;
}
