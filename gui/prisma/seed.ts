import { PrismaClient } from '@prisma/client'
const prisma = new PrismaClient()
async function main() {
  const locations = await prisma.location.findMany()
  const users = await prisma.user.findMany()
  const transports = await prisma.transport.findMany()
  const transaction = await prisma.transaction.create({
    data: {
      from_location_id: locations[0].LocationID,
      to_location_id: locations[0].LocationID,
      transaction_type: "S",
      created_user_id: users[0].UserID,
      updated_user_id: users[0].UserID,
      transported_by_id: transports[0].TransportID,
    }
  })

  const batches = await prisma.batch.findMany()

  for (let i = 0; i < 10; i++) {
    await prisma.transactionRow.createMany({
      data: {
        part_batch_id:batches[0].BatchID,
         quantity: 1,transaction_id: transaction.TransactionID,
         unit_price: 100
      }
    })
  }

}
main()
  .then(async () => {
    await prisma.$disconnect()
  })
  .catch(async (e) => {
    console.error(e)
    await prisma.$disconnect()
    process.exit(1)
  })