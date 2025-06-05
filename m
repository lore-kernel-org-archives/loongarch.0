Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C80243209
	for <loongarch@lists.linux.dev>; Thu,  5 Jun 2025 01:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749087438; cv=none; b=aZyMzIqlU+A39GMaQVnoYkESB0tFwcjIMtx4s1MTnB138PKgORRipPJHzaoRqPCO70hqxHlcp401jrZIOQffb8GVSeSO3pECdnqQyMnSkSRZNfCVrCWCuWWf1vEvJpu50pLL8ESCYuhwYRZbCxgLMR5RE0wEXEUlbKEtIjOWBwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749087438; c=relaxed/simple;
	bh=4ZINMyfoynZgpDjLlLLOSRRxWAs88FOaBVuLZX7UPSQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Mx5d1xl5QpYHP+wQOl4QjqCK3uUbGD/Eyz5SHuYNq08HUmzeFlrfViSnAiwdO+cJKoymWIDIwyCdnfQZ/qrPU90XBUbnmnldesJ6DHT6/HRkwB/WZtW2WHWDwPV4FJjUBo87zhJnYhCjfB8v3tgubJd7lVB3unyOU/J2wbUaH3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c3PzM1dg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c3PzM1dg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3908BC4CEE4
	for <loongarch@lists.linux.dev>; Thu,  5 Jun 2025 01:37:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749087435;
	bh=4ZINMyfoynZgpDjLlLLOSRRxWAs88FOaBVuLZX7UPSQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=c3PzM1dg3pSa790kU18VDGSyIo6kbSsCrVHyBxAsufL+BwVmV+rxlH/UZFhjMV2xR
	 i+nxeyvmuzWAQLtjsxCLAGcTkXLd1XC4n3o1Fc70WQAxCikbFwsvJe8XjCg9b19zNQ
	 Dz0AFmtVz86UUtyp2PBhz4QdAkbBS9dwNg1xZMhZn5IAWhCZumBJ3xIjEScUilahbX
	 vpRQQzLfSNax7unhPlKYt0rID1DGy/3jmRMf5lO+CpPoim6NHSe9+jKv/uQinirMEW
	 8D4rlzFQYk9ETU9HmT6+nm4vQMalkEIqxTXHldaFjsmG5QPQZJYRUu1mYjN5keRV5K
	 IKQ56TF5qwdjQ==
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-602039559d8so825285a12.1
        for <loongarch@lists.linux.dev>; Wed, 04 Jun 2025 18:37:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUEGnnMKv/FR+Deb2Lya3ya4vq8a8f5VdPkvCeUHcnzYO4rt8aVRnTGM4NzB/GF0vNAk7/xn+Yg2wE=@lists.linux.dev
X-Gm-Message-State: AOJu0YzXt0Geo83YthjBgabtq5duyPT6IBbvGZVyEvLIxhxk1wUwWGwt
	/Dj8QuGZKw733cP1fg0yjuCpq4pLRyjs+xl+fXxprZhwk+FtZCgGv335p0msqCbFiqFc69Zzd/l
	baH+96NPl6CTncnXGf4DysIgMWVe/fJ8=
X-Google-Smtp-Source: AGHT+IE0N8hzMr5k75/QQB3ko3ZNdAkatF2Jn8k/FqsN1FvEOXjmdGfcJAm5rxVrjVFgeKQaRLlS9Li9eReF5mcLa5g=
X-Received: by 2002:a05:6402:27d0:b0:604:df97:7c2 with SMTP id
 4fb4d7f45d1cf-606e99a63c9mr4548616a12.2.1749087433803; Wed, 04 Jun 2025
 18:37:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250604065647.113148-1-lijun01@kylinos.cn> <CAAhV-H5dmh8_rNNRAaFeFvjCtt0CCsqTxOujWFakU=RYakrpAA@mail.gmail.com>
 <b20179452023419872c5c7e4a85f13dd530b7928.camel@kylinos.cn>
In-Reply-To: <b20179452023419872c5c7e4a85f13dd530b7928.camel@kylinos.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Thu, 5 Jun 2025 09:37:03 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6QGoQSQGqpHyB_btMUXKsUMsWoM5NtMpjfYoGGjZ23_Q@mail.gmail.com>
X-Gm-Features: AX0GCFsl3XRB_dck0SaDfxwCJAMeCtYKylqfgRTnDfEpGQHd-7XBVkCbZ4-Unx8
Message-ID: <CAAhV-H6QGoQSQGqpHyB_btMUXKsUMsWoM5NtMpjfYoGGjZ23_Q@mail.gmail.com>
Subject: Re: [PATCH v2] loongarch: kgdb: remove unnecessary init variable
To: lijun <lijun01@kylinos.cn>
Cc: kernel@xen0n.name, loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 5, 2025 at 9:31=E2=80=AFAM lijun <lijun01@kylinos.cn> wrote:
>
>
>
> #include<stdio.h>                                              #include
> <stdio.h>
>
> int main(int argc, const char *argv[])     int main(int argc, const
> char *argv[])
> {
>                {
>     int
> i=3D0;
>   int i;
>
>
>     i =3D
> 3;
>     i =3D 3;
>     printf("i =3D %d\n",
> i);                                       printf("i =3D %d\n", i);
>     return
> 0;                                                              return
> 0;
> }
>               }
>  endbr64
>    endbr64
> push   %rbp                                                           p
> ush   %rbp
> mov    %rsp,%rbp                                              mov    %r
> sp,%rbp
> sub    $0x20,%rsp                                                sub
>  $0x20,%rsp
> mov    %edi,-0x14(%rbp)                               mov    %edi,-
> 0x14(%rbp)
> mov    %rsi,-0x20(%rbp)                                mov    %rsi,-
> 0x20(%rbp)
> movl   $0x0,-0x4(%rbp)                                  movl   $0x3,-
> 0x4(%rbp)
> movl   $0x3,-0x4(%rbp)                                  mov    -
> 0x4(%rbp),%eax
> mov    -0x4(%rbp),%eax                                mov    %eax,%esi
> mov    %eax,%esi                                              mov    $0
> x402004,%edi
> mov    $0x402004,%edi                                  mov    $0x0,%eax
> mov    $0x0,%eax                                               callq  4
> 01040 <printf@plt>
> callq  401040 <printf@plt>
>
> if  gcc   -O3   test2.c -o a2.out, It is possible that the
> initialization is optimized by
> assigning values immediately after initialization
> endbr64
> sub    $0x8,%rsp
> mov    $0x3,%edx
> mov    $0x402004,%esi
> xor    %eax,%eax
> mov    $0x1,%edi
> callq  401040 <__printf_chk@plt>
The format is completely unreadable here:
https://lore.kernel.org/loongarch/CAAhV-H5dmh8_rNNRAaFeFvjCtt0CCsqTxOujWFak=
U=3DRYakrpAA@mail.gmail.com/T/#t

And we are talking about the kernel of LoongArch, you provide a user
program of x86?

Huacai

>
> ----------------------------------------------->
> Why do you think the compiler generates initialization instructions,
> have you found any difference in the binary after your patch?
>
> Huacai
>
>
>
>
