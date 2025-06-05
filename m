Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E821428EB
	for <loongarch@lists.linux.dev>; Thu,  5 Jun 2025 01:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749088016; cv=none; b=DDXrrQ6JK3e4/izubO3bL121bQKjEtobjxFkUMF3ovXPFhyZOnfscSf5CVXBpEVEV8fMTDsOXi3DioDtTaRs3IwITCrK5bPV3atv/ccY+QpGFv0MJSWaq27VM5sHyyBNIx+hRvBYHa+wXeoF/MDYKcVeHmkF4bU4V1RutvR6S0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749088016; c=relaxed/simple;
	bh=94nMS3JarJ3RynIvCSJN4m8zMw7ZNwIHwU+zmrukaDY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eP4VDPbEjKupgMx/RLxum6UqCy5cFQCKQrukHpA7E92ICQyTuv4n2Zbvm7rA/jwEEf5mwpOf+1UA8w8sO5+6QTMbKZKOjGWo7KsR3QbogufSE6hIE+P0qdkc+Lqx7x+RDVO2kn4nD4nrtGNhDCDnHGc7hdIr7F7b2sqGM5ERsPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ma3FV6ha; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ma3FV6ha"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66FF3C4CEEF
	for <loongarch@lists.linux.dev>; Thu,  5 Jun 2025 01:46:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749088015;
	bh=94nMS3JarJ3RynIvCSJN4m8zMw7ZNwIHwU+zmrukaDY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Ma3FV6ha7mVUtwJQRoKzY2uA+tHW5AXUx4qx1ow/fuZxwTmIwINnQPRF1NWVFRkOR
	 u8FcIJt182IUnTMxu2w8CS0hHvky8kUcagXkXcYEm3X9LaDGAeGJCWeom+Fziwliyn
	 YIFf2iX1tGwsPaWmj3nXMacahIsjs+0x8D8ZPA+9/SXi1jje9MVJqOIWxBb+DRberM
	 QzHKhmjYTQyRLVwj5bbCdfmX9e0kbwlcHyPcBtatWtTANmjL6egXpJ4xBgJPjNUWw8
	 wYNBrh5yEPJpwikvDDyOgcwqC6qVttjYHRwNs6nBUPBi7gbHZ75FWDJniOF8y9XSK1
	 jUGNblzZF8lAw==
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-606741e8e7cso680494a12.1
        for <loongarch@lists.linux.dev>; Wed, 04 Jun 2025 18:46:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXKJvGXpUjnFcDAGEQZUILcVRgH3185V2A8z7E1NYdh/iwDXl7YsOGJA99G/cPVIRN3NHjmVHXyUDw=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx4HdgUen0THgNNpihK6ZcUU2/dNzluSFGX+aeZ/TPIT/+9Qrsw
	fPM+Otl4xlNv/eQPG3AVZDMO7v4rwzPPBQI9P51df4WDLXmgk/SpxetUB+CHZA6uof7TzDXqN0n
	EyHLO6sur5yVLZSZL+Hwu6texoxdSUgg=
X-Google-Smtp-Source: AGHT+IGNOiblaZb0M/ess3SjuV53T29mUvH+/DnewE5AeFfZuPCi1Dezw79YjuWl4l7kX86qi9VZafB3M4ss+Xa7Gxw=
X-Received: by 2002:a05:6402:d0d:b0:602:1216:fdde with SMTP id
 4fb4d7f45d1cf-606ea16bc44mr4659033a12.14.1749088014010; Wed, 04 Jun 2025
 18:46:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250604065647.113148-1-lijun01@kylinos.cn> <CAAhV-H5dmh8_rNNRAaFeFvjCtt0CCsqTxOujWFakU=RYakrpAA@mail.gmail.com>
 <d6ef1b813bb63504adf34d28d61c6848b9a76221.camel@kylinos.cn>
In-Reply-To: <d6ef1b813bb63504adf34d28d61c6848b9a76221.camel@kylinos.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Thu, 5 Jun 2025 09:46:43 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6KVY=g4Q+_rvB_dyVhfxo9v8sfb3cCJF7qsj0sLNe7Hg@mail.gmail.com>
X-Gm-Features: AX0GCFs726xwoOSeN77IVhyGIeBeNUjl_1MuidielWd8EG60-2Xts_kYpKzpDtM
Message-ID: <CAAhV-H6KVY=g4Q+_rvB_dyVhfxo9v8sfb3cCJF7qsj0sLNe7Hg@mail.gmail.com>
Subject: Re: [PATCH v2] loongarch: kgdb: remove unnecessary init variable
To: lijun <lijun01@kylinos.cn>
Cc: si.yanteng@linux.dev, kernel@xen0n.name, loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 5, 2025 at 9:41=E2=80=AFAM lijun <lijun01@kylinos.cn> wrote:
>
>
> //test2.c
> #include<stdio.h>
>
> int main(int argc, const char *argv[])
> {
>     int
> i=3D0;
>     i =3D 3;
>     printf("i =3D %d\n", i);
>     return 0;
> }
> push   %rbp
> mov    %rsp,%rbp
> sub    $0x20,%rsp
> mov    %edi,-0x14(%rbp)
> mov    %rsi,-0x20(%rbp)
> movl   $0x0,-0x4(%rbp)
> movl   $0x3,-0x4(%rbp)
> mov    -0x4(%rbp),%eax
> mov    %eax,%esi
> mov    $0x402004,%edi
> mov    $0x0,%eax
> callq  401040 <printf@plt>
> //test.c
> #include<stdio.h>
>
> int main(int argc, const char *argv[])
> {
>     int i;
>     i =3D 3;
>     printf("i =3D %d\n", i);
>     return 0;
> }
> endbr64
> push   %rbp
> mov    %rsp,%rbp
> sub    $0x20,%rsp
> mov    %edi,-0x14(%rbp)
> mov    %rsi,-0x20(%rbp)
> movl   $0x3,-0x4(%rbp)
> mov    -0x4(%rbp),%eax
> mov    %eax,%esi
> mov    $0x402004,%edi
> mov    $0x0,%eax
> callq  401040 <printf@plt>
>
> It is possible that the initialization is optimized by assigning values
> immediately after initialization
> if gcc -O3 test2.c -o ao3.out
> endbr64
> sub    $0x8,%rsp
> mov    $0x3,%edx
> mov    $0x402004,%esi
> xor    %eax,%eax
> mov    $0x1,%edi
> callq  401040 <__printf_chk@plt>
Still a user program of x86, not the kernel of LoongArch.

And top posting is strictly forbidden in the kernel community which
Yanteng has already pointed out. Don't do it again and again, and
don't always only answer part of reviewers comments.

Huacai

>
>
>
> ----------------------------------->
> Why do you think the compiler generates initialization instructions,
> have you found any difference in the binary after your patch?
>
> Huacai
>
