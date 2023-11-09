import { CreateProductDto } from 'src/modules/product/dtos/create-product.dto';

export const productsSeed: CreateProductDto[] = [
  {
    name: 'Portão',
    description:
      'Esse modelo se trata de um portão deslizante com detalhes em vidro na lateral que chamamos de bandeira, perfeitos para adicionar um toque moderno e sofisticado à sua entrada, mantendo a transparência e a luminosidade com um vidro incolor, ou ainda mantendo a privacidade com um vidro fumê e entre outras cores.',
    imageUrl:
      'https://aaxesquadrias.com.br/wp-content/uploads/2021/07/WhatsApp-Image-2022-04-26-at-16.12.10-1.jpeg',
    inputs: [1, 2, 3, 4, 5, 6, 8, 7, 12],
  },
  {
    name: 'Motor de portão',
    description:
      'Este é o Dz Condominium Jetflex, o automatizador para portões deslizantes residenciais e condomínios, realizando até 80 ciclos (abertura e fechamento) por hora. Com engrenagem externa Z12 ou Z17 (ambas em alumínio), o automatizador suporta portões de até 1000 Kg',
    imageUrl:
      'https://mediah.ppa.com.br/images/full/PPA_DZ_1500Ind_2022_03_1679938848876.webp',
    inputs: [1, 2, 9, 12],
  },
  {
    name: 'Janela',
    description:
      'Esta janela de alumínio com vidro comum, oferece uma solução prática e funcional para iluminação e visibilidade. O vidro comum é uma escolha clássica, proporcionando claridade e permitindo a entrada de luz natural nos ambientes.',
    imageUrl:
      'https://images.tcdn.com.br/img/img_prod/1195269/janela_para_sala_cozinha_vitro_4_folhas_aluminio_branco_linha_modular_205_1_f6b3452a55ec7b4659f12a0d465ee18b.jpg',
    inputs: [1, 2, 3, 4, 10, 11, 8, 12],
  },
  {
    name: 'Box',
    description:
      'Este modelo se trata de um box com alumínio branco complementa perfeitamente o vidro incolor que proporciona uma sensação de amplitude e luminosidade ao seu banheiro, criando uma aparência limpa e moderna.',
    imageUrl:
      'https://cdn.awsli.com.br/600x700/1224/1224098/produto/73381229/5f743d2aa3.jpg',
    inputs: [1, 2, 4, 8, 12],
  },
];
