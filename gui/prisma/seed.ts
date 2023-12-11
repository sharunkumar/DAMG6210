import { PrismaClient } from "@prisma/client";
const prisma = new PrismaClient();
async function main() {
  let rng = Math.random();
  const locations = await prisma.location.findMany();
  const users = await prisma.user.findMany();
  const transports = await prisma.transport.findMany();
  const batches = await prisma.batch.findMany();
  const transactionTypes = await prisma.transactionType.findMany();

  // const parts = await prisma.part.findMany();

  // add stock for each location and batch id

  // for (let i = 0; i < locations.length; i++) {
  //   const location = locations[i];
  //   for (let j = 0; j < batches.length; j++) {
  //     const batch = batches[j];

  //     const quantity = 500 + rand(100);

  //     console.log({
  //       batch: batch.BatchID,
  //       location: location.LocationID,
  //       quantity,
  //     });

  //     await prisma.stock.create({
  //       data: {
  //         batch_id: batch.BatchID,
  //         location_id: location.LocationID,
  //         quantity,
  //       },
  //     });
  //   }
  // }

  const runningDate = new Date("2023-01-01");

  const today = new Date();

  while (runningDate < today) {
    console.log({ runningDate });
    // random 10 transactions per day
    for (let i = 0; i < 10; i++) {
      const transaction = await prisma.transaction.create({
        data: {
          from_location_id: needle(locations).LocationID,
          to_location_id: needle(locations).LocationID,
          transaction_type: needle(transactionTypes).transaction_code,
          created_user_id: needle(users).UserID,
          updated_user_id: needle(users).UserID,
          transported_by_id: needle(transports).TransportID,
          created_date: runningDate,
        },
      });
      for (let i = 0; i < 10; i++) {
        const batch = needle(batches);
        const quantity = rand(20);
        await prisma.transactionRow.createMany({
          data: {
            part_batch_id: batch.BatchID,
            quantity,
            transaction_id: transaction.TransactionID,
            unit_price: batch.cost,
          },
        });
      }
    }

    runningDate.setDate(runningDate.getDate() + 1);
  }
}
function rand(n: number): number {
  // Generate a random number between 1 and n (inclusive)
  return Math.floor(Math.random() * n) + 1;
}

function needle<T>(haystack: Array<T>): T {
  const n = haystack.length;
  return haystack[rand(n) - 1];
}

main()
  .then(async () => {
    await prisma.$disconnect();
  })
  .catch(async (e) => {
    console.error(e);
    await prisma.$disconnect();
    process.exit(1);
  });
