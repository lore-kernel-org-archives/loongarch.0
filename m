Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59EAF37BE9A
	for <loongarch@lists.linux.dev>; Mon, 18 May 2026 02:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779073112; cv=none; b=VgjXCmVfTIcNc0c19wN1IkiJjCdfUZU9kJvul7zi04VydhyyV/u6Q/IeMeXQxq7IiWb8xQjA41hcp3RaprL4CDRZQUy8Du8t6gNRSdyCD0jcsPlWXDgy2gNoWkpQHqnxM+H+juyg8HGQs4iYSaFQIKkh9b9dzvMtEiEJDamCpV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779073112; c=relaxed/simple;
	bh=vWvEcAPRpUrI5RQk5fEbio9KQQHm1uMZbGz43aBrKdY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UeOSkowteX3gOwiZUKN2K83i3l4MEFuUHooRQZT2voy6pz2Aj9RRRsZBMN89ixKvnx875C6WdNdDBYNNZqT5AGFUTZHzcf6V0nzd4/K+MM2oFYeAHrMGIbY6vCizcj7CJ+SDAXZxsH72oDp4lNMzr6m3fB/MGmYDjSVtRxdXxBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Rp+HOm4S; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Rp+HOm4S"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08FC5C2BCC9
	for <loongarch@lists.linux.dev>; Mon, 18 May 2026 02:58:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779073112;
	bh=vWvEcAPRpUrI5RQk5fEbio9KQQHm1uMZbGz43aBrKdY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Rp+HOm4SOKROhuwDRqFqNGajLMF7ovpI15zTzxBD1xnwduCPv4zPzCcBZkLqCyI4A
	 qIKV+biW+SdTmKgtBjpYUTmPyDSIqjei7oLKIPoFi0atAX+3jRrRPwJUY2kkrSQxmL
	 zpVg0ShhUpyPzPONr9P9YA7gja/jNYlVp4DE29cFWY4OiZjvxe3vqv6GPUCYEVO1V5
	 vREf8mZwGOlznA/9f85vJZbmvjwQctfGhmWlM9WmKYUwSkNRksWvT0iyO+xK7dxdMc
	 IuGilp+8W8f6k66rQVxl3A3DByrP9VK2Oy1Z5Wp0CZF18dE6hmiC0kv1I2CY3MUsKi
	 OUDKkucpGa5XQ==
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6763cc8775cso6250353a12.0
        for <loongarch@lists.linux.dev>; Sun, 17 May 2026 19:58:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9w+X21sc7sISa6xEtwb4ltVu2IAxRd0kqADYmH81+toTHTHc4fl0t9OtpVA0NY6449v66LflJRnzo=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywo+nOwaGlT21Hl61ReU97ofl42rtt0JHotAjpXffNIo4zcw3DX
	TGizvxJEdhRxPG0OKiiAV2HycOttv4SaIqC9LmRoUxT8RJlZfByf5tszqgj7fcZgQc9gH3iSPtH
	Br5R6XIdW4emHiBRGFpsr9Mjvpmr+1Ik=
X-Received: by 2002:a17:907:940d:b0:bd4:f2c7:25e2 with SMTP id
 a640c23a62f3a-bd51534c830mr562537066b.5.1779073110685; Sun, 17 May 2026
 19:58:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260517092432.1025008-1-chenhuacai@loongson.cn> <CAJF2gTSn-44So=SdVYxvF5ihJjWs9R7vFAyuPNpeLBwBpJrY9Q@mail.gmail.com>
In-Reply-To: <CAJF2gTSn-44So=SdVYxvF5ihJjWs9R7vFAyuPNpeLBwBpJrY9Q@mail.gmail.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Mon, 18 May 2026 10:58:50 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4Zvqvb_Crx-cpunZV8tGcFu=2T6x0aG9iV31BPcO5xng@mail.gmail.com>
X-Gm-Features: AVHnY4LGjaT_QdnD3nKcKvz3-lg9nRWT0Y2Sjfi2bQJMcSLBogKzGmXduJtJea4
Message-ID: <CAAhV-H4Zvqvb_Crx-cpunZV8tGcFu=2T6x0aG9iV31BPcO5xng@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: Remove unused code to avoid build warning
To: Guo Ren <guoren@kernel.org>
Cc: Huacai Chen <chenhuacai@loongson.cn>, loongarch@lists.linux.dev, 
	Xuefeng Li <lixuefeng@loongson.cn>, Xuerui Wang <kernel@xen0n.name>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 18, 2026 at 9:42=E2=80=AFAM Guo Ren <guoren@kernel.org> wrote:
>
>
>
> On Sun, May 17, 2026 at 5:25=E2=80=AFPM Huacai Chen <chenhuacai@loongson.=
cn> wrote:
> >
> > After commit feee6b2989165631b1 ("mm/memory_hotplug: shrink zones when
> > offlining memory"), __remove_pages() doesn't need the "zone" parameter
> > so the "page" variable is also unused. Remove the unused code to avoid
> > such build warning:
> >
> > arch/loongarch/mm/init.c: In function 'arch_remove_memory':
> > arch/loongarch/mm/init.c:134:22: warning: variable 'page' set but not u=
sed [-Wunused-but-set-variable=3D]
> >   134 |         struct page *page =3D pfn_to_page(start_pfn);
> >
> > Cc: <stable@vger.kernel.org>
> > Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
> > ---
> >  arch/loongarch/mm/init.c | 4 ----
> >  1 file changed, 4 deletions(-)
> >
> > diff --git a/arch/loongarch/mm/init.c b/arch/loongarch/mm/init.c
> > index 3f9ab54114c5..031b39eb081c 100644
> > --- a/arch/loongarch/mm/init.c
> > +++ b/arch/loongarch/mm/init.c
> > @@ -123,11 +123,7 @@ void arch_remove_memory(u64 start, u64 size, struc=
t vmem_altmap *altmap)
> >  {
> >         unsigned long start_pfn =3D start >> PAGE_SHIFT;
> >         unsigned long nr_pages =3D size >> PAGE_SHIFT;
> > -       struct page *page =3D pfn_to_page(start_pfn);
> >
> > -       /* With altmap the first mapped page is offset from @start */
> > -       if (altmap)
> > -               page +=3D vmem_altmap_offset(altmap);
> >         __remove_pages(start_pfn, nr_pages, altmap);
>
> Good cleanup, but does LoongArch forget to remove the linear mapping? If =
the memory is unplugged, the mapping is still there. How does the core fetc=
h data from there?
LoongArch's linear mapping is based on DMW rather than TLB, so
removing linear mapping is unnecessary.


Huacai
>
> --
>
> Best Regards
>
>   GUO Ren
