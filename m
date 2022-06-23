Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A2C343E4
	for <loongarch@lists.linux.dev>; Thu, 23 Jun 2022 07:16:33 +0000 (UTC)
Received: from mail-yw1-f170.google.com ([209.85.128.170]) by
 mrelayeu.kundenserver.de (mreue010 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MK3BO-1oNbPq0OSc-00LZ1p for <loongarch@lists.linux.dev>; Thu, 23 Jun 2022
 09:16:32 +0200
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-3176d94c236so185576887b3.3
        for <loongarch@lists.linux.dev>; Thu, 23 Jun 2022 00:16:31 -0700 (PDT)
X-Gm-Message-State: AJIora8mq8ifJ4QHvn7stL3mSfFhUCe1gybebnqmhinNow18sh9ZkJe3
	9CU9HD4y+d2cc2q5Y/aXMp2XD9xARiRKwRQEiow=
X-Google-Smtp-Source: AGRyM1v3K64weei10Dq+jkC+TjAoXGUuY8pU5spc3/vrhIwWzmQ9dEdLhsgO1uNzSsDcRPd9iYeWBkq4oZjx7KI3a5E=
X-Received: by 2002:a81:c08:0:b0:317:8131:2b21 with SMTP id
 8-20020a810c08000000b0031781312b21mr9167858ywm.249.1655968590884; Thu, 23 Jun
 2022 00:16:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220623025200.1824399-1-chenhuacai@loongson.cn>
In-Reply-To: <20220623025200.1824399-1-chenhuacai@loongson.cn>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 23 Jun 2022 09:16:12 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0hf8sSXqu14WkYO0yy7hSOn3y6FaE3vqDW7J1JPVcZWA@mail.gmail.com>
Message-ID: <CAK8P3a0hf8sSXqu14WkYO0yy7hSOn3y6FaE3vqDW7J1JPVcZWA@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: Fix the !THP build
To: Huacai Chen <chenhuacai@loongson.cn>
Cc: Arnd Bergmann <arnd@arndb.de>, Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, 
	linux-arch <linux-arch@vger.kernel.org>, Xuefeng Li <lixuefeng@loongson.cn>, 
	Guo Ren <guoren@kernel.org>, Xuerui Wang <kernel@xen0n.name>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:UtiuX5NsHKEFwTnrtYJvDc7EGuGW6nNQ0K8dwaqkcxiJsJAYpPc
 Cm8E/HgQjb0AsdAKe8vv2bwU8+pTcF/n4Rl6RlclHEwAqKgjnz0GbVEIAi4v7kdnFH2eVJO
 nOpvw9xXWnkOPovsupA4TYhlSfaCkjFP6KW2SLp6XcwwTiNUBk3Mby6TNZiwCy1o2j7x7Xo
 A8BoB43vxIG4GDYRWzQMQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Xad93n/i+pc=:Zfrp1vMOetoZaEWtocPhvL
 GYoc76swMzjxnHlPM/SXn1bNCphPtyD9yJZ/r6QOI/7h2Ab15opFt8FjFzKY9t/JL4OOeRXbr
 S0oDC2+JyMttJtSPbuDL93a/C/r4JITQjX8es1O42VHWE4gexuUVP7NAhW1ByJ1Gt7wJ+XQ7D
 YIqA28hKxQy/qv28pcDKUwVTsrzhQJs4+PZ5HsPw6ai+89A80bNNb9RW9nmJtPkfECQh2eT8K
 0NM5N9bEt0iOmc4U1mYWf6hnrenN0gMCSJibs4quog15f7N8tEHrpAmyPRhcdPBdY+/nXAllF
 M1cGJd9EUl3Nm0ABIj32/0JSVjOu9yrbjIa0o+oSyswo09ENdbad9F4/I7yoE0Np+5FlZzzjK
 tBgka1iacRv2tr/smxNLaEZ1fOiFCS8BBfdRIjSm+T+nN2+gEIsq5HYJ2vszMVHM4/v5u90HW
 1DJxAbqpRKN4bkjHH0vp9kVckQrVSaKR1ZhINvNlXpweuPaQAopg5ei94j1kNlLFVljNpxkVZ
 /xk/+IQn5izXIj8K/a+xnlqkaaJRJAblrLwBGq7KiNPiqKRvaKPTNzHOy4LD4G5j4388RGnZr
 wPQiR25dD4cxmJhCmKWDqayYNC0vuxz6G9Nh0udTdatzllGgEGNxVceU68uSALiVubqpM7L1B
 AY4h2qpiUhy79f0WFbuVhVi7LauydnzANhinw1z71lpM4JyTyLJ2MYp7fuDdsJJTzO/FYXue1
 6AIRzZaSdefOoSVDwZ4jRmEAYAWUVrrvyQKWXAPLUPTIRacSx8IdFOUGN3b72uEYJd6O9WHco
 XRNFe98+3/Bs7FO+7IOT0WGWTOQG9pskbt6F6BUztWjX+kLXIbg0Jdn+zmby8Gq6pAG6BuN76
 92LBdAvZhiSf/znqdX3w==

On Thu, Jun 23, 2022 at 4:52 AM Huacai Chen <chenhuacai@loongson.cn> wrote:
>
> Fix the !THP build by making pmd_pfn() available in all configurations.
> Because pmd_pfn() is used in mm/page_vma_mapped.c whether or not THP is
> configured.
>
> Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>

Both bugfix patches look good to me. I assume you'll just send a pull request
to Linus from your kernel.org account, rather than going through the asm-generic
tree for follow-up patches. Let me know if you need me to put it into my tree
instead.

         Arnd
