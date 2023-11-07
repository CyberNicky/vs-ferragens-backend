import { PrismaClient } from '@prisma/client';
const prisma = new PrismaClient();
async function main() {
  const window = await prisma.product.upsert({
    where: { id: 1 },
    update: {},
    create: {
      name: 'Janela',
      description: 'Janela de alumínio',
      imageUrl:
        'https://images.cws.digital/produtos/gg/39/68/janela-de-aluminio-100x100-canelado-2-folhas-sem-basculante-10126839-1686606586648.jpg',
      inputs: {
        create: {
          name: 'Nome do cliente',
          type: 'TEXT',
          options: {
            create: {
              name: 'Branco',
            },
          },
        },
      },
    },
  });
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
