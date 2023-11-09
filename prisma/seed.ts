import { PrismaClient } from '@prisma/client';
import { inputOptionsData } from './data-source/inputOptions';
import { gateInputs } from './data-source/inputs';
import { productsSeed } from './data-source/products';
const prisma = new PrismaClient();

const inputs = [...gateInputs];

async function main() {
  const inputOptions = await prisma.inputOption.createMany({
    data: inputOptionsData.map((name) => ({ name })),
  });

  const products = await prisma.product.createMany({
    data: productsSeed.map((product) => ({
      name: product.name,
      description: product.description,
      imageUrl: product.imageUrl,
    })),
  });

  const inputs = await prisma.input.createMany({
    data: gateInputs.map((input) => ({ name: input.name, type: input.type })),
  });

  await Promise.all(
    gateInputs.map((input, index) => {
      if (input.options?.length > 0) {
        return prisma.input.update({
          where: { id: index + 1 },
          data: {
            options: {
              connect: input.options.map((optionId) => ({ id: optionId })),
            },
          },
        });
      }
    }),
  );

  await Promise.all(
    productsSeed.map((product, index) =>
      prisma.product.update({
        where: { id: index + 1 },
        data: {
          inputs: {
            connect: product.inputs.map((inputId) => ({ id: inputId })),
          },
        },
      }),
    ),
  );
  // prisma.input.update({})

  // const products = await prisma.product.create({
  //   data: {
  //     ...productsSeed[0],
  //     inputs: {
  //       create: {
  //         name: 'Nome do cliente',
  //         type: 'TEXT',
  //       },
  //     },
  //   },
  // });

  // const inputs = await Promise.all(
  //   gateInputs.map((input) => {
  //     const inputProducts = input.products ?? [1];

  //     return prisma.input.create({
  //       data: {
  //         ...input,
  //         options: {
  //           connect: input.options?.map((id) => ({
  //             id,
  //           })),
  //         },
  //         products: {
  //           connect: inputProducts?.map((id) => ({
  //             id,
  //           })),
  //         },
  //       },
  //     });
  //   }),
  // );

  // await Promise.all(
  //   productsSeed.map((product) =>
  //     prisma.product.update({
  //       where: { id: products.find((p) => p.name === product.name).id },
  //       data: {
  //         inputs: { connect: product.inputs.map((id) => ({ id })) },
  //       },
  //     }),
  //   ),
  // );

  // const window = await prisma.product.createMany({
  //   data: [
  //     {
  //       name: 'Janela',
  //       description: 'Janela de alumínio',
  //       imageUrl:
  //         'https://images.cws.digital/produtos/gg/39/68/janela-de-aluminio-100x100-canelado-2-folhas-sem-basculante-10126839-1686606586648.jpg',
  //       inputss: {
  //         create: {
  //           name: 'Nome do cliente',
  //           type: 'TEXT',
  //           options: {
  //             create: {
  //               name: 'Branco',
  //             },
  //           },
  //         },
  //       },
  //     },
  //   ],
  // });
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
