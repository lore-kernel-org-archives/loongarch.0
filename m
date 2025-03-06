Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5327A1917D4
	for <loongarch@lists.linux.dev>; Thu,  6 Mar 2025 03:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741230811; cv=none; b=Ub+pNFZN3E63xLaE0v8/D5NBwisM+19P0kfaYxLp3GK7lawC/zb/JruRxD/8POfa9QRsUdpdwyWnitmQXPVDCor3Gvc1jRQdJ1f9gmJJ9h1MaDV4URxJvU87hZjWRuPq173PFEfT6FZxR3Rn29cdtwJ+dC9hPo4sqMvKUFY+PEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741230811; c=relaxed/simple;
	bh=vZiXJZYz5VOguDB3FmA3CU8GRapNcDNmbvbD+S81jhw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M5wc4QrZmOMnN00dfDKlGSQ79FtJKoBb56iYsmZIuNnvZQPpc6DI9LlURCziTeo/Bg8bwPyNoCvmFSOqbtEUMQfDoOgIFo15VRu1WPM/npEnOBnbJF/we1eIA1egpctBbS0dW9uj0POFu9UFszIjcnzKhsUQ11bEEK68wUMmUAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=heyctpO/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="heyctpO/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C99ABC4CED1
	for <loongarch@lists.linux.dev>; Thu,  6 Mar 2025 03:13:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741230810;
	bh=vZiXJZYz5VOguDB3FmA3CU8GRapNcDNmbvbD+S81jhw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=heyctpO/WoovY7yxJivzLKAnmH3No+yx45K1cdGct1iI61obNVllO7NpoH5Dsd60p
	 TeSWFxaPQUBTjVUMiPmHQlmA0IXrjCpB1K1EZabS68w7emKGx87GUjJ2TCFo7R775C
	 r8DqexKLIMr1BIuJPNuwPzeIHR7WLPDLfzyg5InM96YwgmS8Bry+9UKp4N3KRIZGXO
	 N4c+DY4+s05IDTqAkIp8Pbqw4ysRHwfDKSRFzV249I/XYcSIYNzHu3epKPQFDKkoZC
	 Ie1DY1LI9hNxLYawyVQ00VRWiNWFKbDxxuwyuNN8rTn+xN2lB9pmGBAyTbQXpAtAnY
	 OtMVfDAkvtiLQ==
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5e04064af07so285754a12.0
        for <loongarch@lists.linux.dev>; Wed, 05 Mar 2025 19:13:30 -0800 (PST)
X-Gm-Message-State: AOJu0YyyoS67OKU7IXaMIY6pSkG6bkYbIGZ/Il50siHAGW9m57tGQsbs
	oZ/QVRGzrNz3RcnYBZXjxSZMuNQO6w9B1gu0xO2caCPhzH9kK6MMX7XEgClljJ1SVKvcGL8PdZ+
	mT22wEDHmcWnrEG4TqgkGZm3RX9M=
X-Google-Smtp-Source: AGHT+IGSuohl41ES0lU8gjnqW1i5CgOhKn32yEJvoIMCmQEeDdp5F2gdxU5er0hFvMEEM7MCJDf9rX+pOH/zTCWyvpo=
X-Received: by 2002:a17:907:6d19:b0:ac1:e1a7:9445 with SMTP id
 a640c23a62f3a-ac20d849e4amr509259566b.12.1741230809287; Wed, 05 Mar 2025
 19:13:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAK3+h2w6WESdBN3UCr3WKHByD7D6Q_Ve1EDAjotVrnx6Or_c8g@mail.gmail.com>
In-Reply-To: <CAK3+h2w6WESdBN3UCr3WKHByD7D6Q_Ve1EDAjotVrnx6Or_c8g@mail.gmail.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Thu, 6 Mar 2025 11:13:18 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6x=0rq2H++7Uu_O4-ZCSir54qbDcTL6S3J1-W+55isPg@mail.gmail.com>
X-Gm-Features: AQ5f1JpyL2XCXzQ6KAoK9B_eU07dzNDX5SRFQT3qm36n3my6vd0SDjR5W_zRwtw
Message-ID: <CAAhV-H6x=0rq2H++7Uu_O4-ZCSir54qbDcTL6S3J1-W+55isPg@mail.gmail.com>
Subject: Re: [BUG?] loxilb tc BPF program cause Loongarch kernel hard lockup
To: Vincent Li <vincent.mc.li@gmail.com>, Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Cc Tiezhu.

Huacai

On Thu, Mar 6, 2025 at 8:53=E2=80=AFAM Vincent Li <vincent.mc.li@gmail.com>=
 wrote:
>
> Hi,
>
> I have an issue recorded here [0] with kernel call trace  when I start
> loxilb, the loxilb tc BPF program seems to be loaded and attached to
> the network interface, but immediately it causes a loongarch kernel
> hard lockup, no keyboard response. Sometimes the panic call trace
> shows up in the monitor screen after I disabled kernel panic reboot
> (echo 0 > /proc/sys/kernel/panic) and started loxilb.
>
> Background: I ported open source IPFire [1] to Loongarch CPU
> architecture and enabled kernel BPF features, added loxilb as LFS
> (Linux from scratch) addon software, loxilb 0.9.8.3 has libbpf 1.5.0
> which has loongarch support [2]. The same loxilb addon runs fine on
> x86 architecture. Any clue on this?
>
> [0]: https://github.com/vincentmli/BPFire/issues/76
> [1]: https://github.com/ipfire/ipfire-2.x
> [2]: https://github.com/loxilb-io/loxilb/issues/972
>
> Vincent
>
