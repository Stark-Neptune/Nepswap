#[contract]
mod exponential_curve {
    use NepSwap::errors;

    use zeroable::Zeroable;
    use traits::Into;
    use traits::TryInto;
    use array::ArrayTrait;
    use option::OptionTrait;

    #[view]
    fn validateDelta(delta: u128) -> bool {
        // TODO: there is some checking need to complete
        true
    }

    #[view]
    fn validateSpotPrice(newSpotPrice: u128) -> bool {
        true
    }

    /// @notice 
    /// @dev 
    /// @param spotPrice The price of NFT before purchase.
    /// @param delta The price increment caused by purchasing an NFT.
    /// @param numItems Quantity of NFTs to purchase.
    /// @param feeMultiplier Fees for pool creator.
    /// @param protocolFeeMultiplier Fees for protocol.
    /// @return 
    #[view]
    fn getBuyInfo(
        spotPrice: u128,
        delta: u128,
        numItems: u128,
        feeMultiplier: u128,
        protocolFeeMultiplier: u128
    ) -> Array<u128> {
        // We only calculate changes for buying 1 or more NFTs
        if (numItems.into().is_zero()) {
            return resultToArr(errors::INVALID_NUMITEMS, 0_u128, 0_u128, 0_u128, 0_u128);
        }

        let deltaPowN = delta ^ numItems;

        let newSpotPrice: u128 = spotPrice * deltaPowN;

        // The first element (q^1)
        let buySpotPrice = spotPrice * delta;

        let mut inputValue = buySpotPrice * (deltaPowN - 1_u128) / (delta - 1_u128);

        let protocolFee = inputValue * protocolFeeMultiplier;
        inputValue = inputValue + inputValue * feeMultiplier;
        inputValue = inputValue + protocolFee;

        resultToArr(errors::SUCCESS, newSpotPrice, delta, inputValue, protocolFee)
    }

    

    /// @notice generate error array for getBuyInfo and getSellInfo
    /// @param error Error code from errors
    /// @param length Length of array
    #[internal]
    fn resultToArr(
        error: felt252, newSpotPrice: u128, newDelta: u128, inputValue: u128, protocolFee: u128, 
    ) -> Array<u128> {
        let mut a = ArrayTrait::<u128>::new();
        a.append(error.try_into().unwrap());
        a.append(newSpotPrice);
        a.append(newDelta);
        a.append(inputValue);
        a.append(protocolFee);

        a
    }
}
