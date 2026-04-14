-- AlterTable: Stripe -> Polar 필드 변경
ALTER TABLE "Payment" DROP COLUMN IF EXISTS "stripePaymentIntentId";
ALTER TABLE "Payment" DROP COLUMN IF EXISTS "stripeCheckoutSessionId";
ALTER TABLE "Payment" ADD COLUMN IF NOT EXISTS "polarOrderId" TEXT;
ALTER TABLE "Payment" ADD COLUMN IF NOT EXISTS "polarProductId" TEXT;
ALTER TABLE "Payment" ADD COLUMN IF NOT EXISTS "customerEmail" TEXT;
ALTER TABLE "Payment" ALTER COLUMN "currency" SET DEFAULT 'usd';

-- CreateIndex
CREATE UNIQUE INDEX IF NOT EXISTS "Payment_polarOrderId_key" ON "Payment"("polarOrderId");
