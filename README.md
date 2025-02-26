# Decentralized Market Trends Analyzer (DMTA)

## Overview
The **Decentralized Market Trends Analyzer (DMTA)** is a Clarity smart contract designed for secure and efficient market trend analysis. This contract enables users to submit, retrieve, and analyze market data while setting custom alerts for price movements.

## Features
- **Submit Market Data**: Users can submit market price and volume data.
- **Retrieve Market Data**: Query the latest market data for a given asset.
- **Set Alerts**: Users can configure threshold-based alerts for assets.
- **Check Alerts**: Validate if the market conditions meet alert thresholds.
- **Remove Alerts**: Users can remove their previously set alerts.
- **Clear Market Data**: Admin-level functionality to remove outdated market data.

## Smart Contract Functions
### Public Functions
1. **`(submit-market-data asset price volume timestamp)`**
   - Stores market data including price, volume, and timestamp.
2. **`(set-alert asset threshold direction)`**
   - Allows users to set price alerts for an asset.
3. **`(check-alert asset)`**
   - Checks if the current market data meets a user’s alert threshold.
4. **`(remove-alert asset)`**
   - Deletes an existing alert for a user.
5. **`(clear-market-data asset)`**
   - Removes the stored market data for an asset.

### Read-Only Functions
1. **`(get-market-data asset)`**
   - Retrieves stored market data for an asset.
2. **`(get-user-alert user asset)`**
   - Retrieves a specific user's alert configuration.
3. **`(validate-user user)`**
   - Checks if the user is authorized.

## Error Codes
- **`ERR_UNAUTHORIZED (u100)`**: Unauthorized access.
- **`ERR_INVALID_INPUT (u101)`**: Invalid function inputs.
- **`ERR_ASSET_NOT_FOUND (u102)`**: Requested asset does not exist.
- **`ERR_ALERT_NOT_FOUND (u103)`**: No alert found for the asset.
- **`ERR_NO_MARKET_DATA (u104)`**: No market data available.
- **`ERR_THRESHOLD_NOT_MET (u105)`**: Alert conditions not met.

## Security Enhancements
- Input validation to prevent incorrect data submissions.
- Access control mechanisms to ensure users can only manage their own alerts.
- Consistent error handling for reliable debugging.

## Installation and Deployment
To deploy this contract on the **Stacks blockchain**, use the Clarity CLI or deploy via **Stacks Explorer**:
```sh
clarity-cli launch contract.clar
```
Ensure you have the necessary permissions and sufficient funds in your wallet.

## Future Improvements
- Integration with external price oracles for real-time accuracy.
- Automated notification system for alerts.
- Enhanced analytics with machine learning models.

## License
This project is open-source and available under the **MIT License**.

## Contact
For support or contributions, reach out via GitHub or the Stacks community forums.