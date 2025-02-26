(define-constant ERR_UNAUTHORIZED (err u100))
(define-constant ERR_INVALID_INPUT (err u101))
(define-constant ERR_ASSET_NOT_FOUND (err u102))
(define-constant ERR_ALERT_NOT_FOUND (err u103))
(define-constant ERR_NO_MARKET_DATA (err u104))
(define-constant ERR_THRESHOLD_NOT_MET (err u105))

(define-map market-trends
    { asset: (string-ascii 10) }
    { price: uint, volume: uint, timestamp: uint })

(define-map user-alerts
    { user: principal, asset: (string-ascii 10) }
    { threshold: uint, direction: (string-ascii 4) })

(define-public (submit-market-data (asset (string-ascii 10)) (price uint) (volume uint) (timestamp uint))
    (begin
        (asserts! (> price u0) ERR_INVALID_INPUT)
        (asserts! (> volume u0) ERR_INVALID_INPUT)
        (map-set market-trends { asset: asset } { price: price, volume: volume, timestamp: timestamp })
        (ok "Market data updated")))

(define-read-only (get-market-data (asset (string-ascii 10)))
    (default-to ERR_ASSET_NOT_FOUND (map-get? market-trends { asset: asset })))

    (define-public (set-alert (asset (string-ascii 10)) (threshold uint) (direction (string-ascii 4)))
    (begin
        (asserts! (or (is-eq direction "up") (is-eq direction "down")) ERR_INVALID_INPUT)
        (asserts! (> threshold u0) ERR_INVALID_INPUT)
        (map-set user-alerts { user: tx-sender, asset: asset } { threshold: threshold, direction: direction })
        (ok "Alert set")))

(define-public (remove-alert (asset (string-ascii 10)))
    (begin
        (asserts! (map-get? user-alerts { user: tx-sender, asset: asset }) ERR_ALERT_NOT_FOUND)
        (map-delete user-alerts { user: tx-sender, asset: asset })
        (ok "Alert removed")))

(define-public (clear-market-data (asset (string-ascii 10)))
    (begin
        (asserts! (map-get? market-trends { asset: asset }) ERR_ASSET_NOT_FOUND)
        (map-delete market-trends { asset: asset })
        (ok "Market data removed")))