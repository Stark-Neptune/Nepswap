struct txInfo {
    error: felt252,
    newSpotPrice: u128,
    newDelta: u128,
    value: u128,
    protocolFee: u128,
}

const ERRER_INDEX: usize = 0_usize;
const NEW_SPOT_PRICE_INDEX: usize = 1_usize;
const NEW_DELTA_INDEX: usize = 2_usize;
const VALUE_INDEX: usize = 3_usize;
const PROTOCOL_FEE_INDEX: usize = 4_usize;
