class ApiPath {
  static const googleLogin = '/auth/google';
  static const upload = '/upload/p-image';
  static const getBankList = '/bank/list';
  static const validateBankAccount = '/bank/validate-account';
  static const merchantCreate = '/merchants/create';
  static const enterpriseCreate = '/enterprise/create';
  static const getStats = '/merchants/stats';
  static const getListMerchant = '/merchants/list';
  static const getMerchantInfo = '/merchants/detail';
  static const updateMerchant = '/merchants/update';
  static const updateEnterprise = '/enterprise/update';
  static const addBankAccount = '/merchants/add-bank-account';
  static const activeMerchant = '/merchants/active';
  static const inActiveMerchant = '/merchants/inactive';
  static const activeStore = '/store/active';
  static const inActiveStore = '/store/inactive';

  ///Store
  static const getStoreCategories = '/store/categories';
  static const createNewStore = '/store/create';
  static const linkVaToTheStore = '/store/link-va';
  static const getStores = '/store/list';
  static const getStoreDetail = '/store/detail';
  static const updateStore = '/store/update';

  ///Common
  static const getProvinceList = '/common/provinces';
  static const getDistrictList = '/common/districts/';
  static const getWardList = '/common/wards/';
  static const getBDList = '/common/list-bd';

  ///Virtual Account
  static const getAvailableVirtualAccounts = '/virtual-account/available-vas';
  static const getVirtualAccountsDetail = '/virtual-account/info';
  static const changeVaName = '/virtual-account/update-name';
  static const getVaDetail = '/virtual-account/detail';
  static const changeVaDevice = '/virtual-account/change-va-device';
  static const searchVas = '/virtual-account/search';
  static const linkDevice = '/virtual-account/link-device';
  static const linkDevice2 = '/virtual-account/link-device-v2';
  static const editNameVa = '/virtual-account/update-name';

  ///Subscription
  static const getSubscriptionInfoByVA = '/subscription/info-by-va/';
  static const getSubList = '/subscription/list';
  static const getListExpire = '/merchants/list-expire';
  static const changeDevice = '/subscription/change-device';

  /// Device
  static const getDevices = '/device/search';
  static const getDeviceInfo = '/device/info';
  static const getDeviceList = '/device/list';
  static const detailDevice = '/device/detail';
  static const attachDeviceToStore = '/store/link-device';
  static const unLinkVa = '/device/unlink-va';

  ///
  static const listVaViettin = '/device/list-by-user';

  ///location
  static const autoComplete = '/maps/autocomplete';
  static const placeDetail = '/maps/place-detail';

}
