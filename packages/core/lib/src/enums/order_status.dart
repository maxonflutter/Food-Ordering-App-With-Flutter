enum OrderStatus {
  pending(
    'Pending',
    'The order has been placed but not yet processed.',
  ),
  processing(
    'Processing',
    'The order is being processed by the platform.',
  ),
  shipped(
    'Shipped',
    'The order has been shipped to the customer.',
  ),
  delivered(
    'Delivered',
    'The order has been delivered to the customer.',
  ),
  cancelled(
    'Cancelled',
    'The order has been cancelled.',
  ),
  waitingForPaymentConfirmation(
    'Waiting for payment confirmation',
    'The order is waiting for payment.',
  ),
  paymentFailed(
    'Payment failed',
    'The payment failed.',
  );

  const OrderStatus(
    this.label,
    this.description,
  );

  final String label;
  final String description;
}


// Pending: Indicates the order has been placed but not yet acknowledged by the restaurant. This status is critical for customers waiting for confirmation that their order will be processed.

// Confirmed: Signifies that the restaurant has accepted the order. This status gives customers assurance that their order is being taken care of.

// Preparing: The order is being prepared by the restaurant. This status informs customers that their meal is actively being worked on.

// Ready for Pickup: Indicates that the order is ready and waiting for the delivery personnel to pick it up. This status is essential for coordinating between the restaurant and the delivery staff.

// On the Way: The delivery person is en route to the customer with the order. This status is crucial for customers to know when to expect their delivery.

// Delivered: The order has successfully reached the customer. This marks the completion of the transaction from the perspective of order fulfillment.

// Cancelled by Customer: Reflects that the customer has cancelled the order, which is important for managing restaurant resources and logistics.

// Cancelled by Restaurant: Indicates the restaurant has cancelled the order, often due to issues like ingredient shortages or overwhelming demand. This status is important for transparency and customer communication.

// Failed to Deliver: The order could not be delivered. This status is vital for troubleshooting and customer service to address and resolve the issue.

// Refunded: Applies when an order has been cancelled and a refund issued to the customer. This status is critical for financial transactions and customer satisfaction.