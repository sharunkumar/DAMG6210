import { PrismaClient } from "@prisma/client";
const prisma = new PrismaClient();
async function main() {
  let rng = Math.random();
  const locations = await prisma.location.findMany();
  const users = await prisma.user.findMany();
  const transports = await prisma.transport.findMany();

  // const parts = await prisma.part.findMany();

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
          transaction_type: "S",
          created_user_id: needle(users).UserID,
          updated_user_id: needle(users).UserID,
          transported_by_id: needle(transports).TransportID,
          created_date: runningDate,
        },
      });
      const batches = await prisma.batch.findMany();
      for (let i = 0; i < 10; i++) {
        const batch = needle(batches);
        const quantity = rand(20);
        await prisma.stock.upsert({
          where: {
            batch_id_location_id: {
              batch_id: batch.BatchID,
              location_id: transaction.from_location_id,
            },
          },
          create: {
            quantity: quantity + rand(20),
            batch_id: batch.BatchID,
            location_id: transaction.from_location_id,
          },
          update: {
            quantity: quantity + rand(20),
          },
        });
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
