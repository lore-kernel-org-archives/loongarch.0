Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45909367B76
	for <loongarch@lists.linux.dev>; Fri, 17 Jul 2026 03:37:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784259433; cv=none; b=KFrDwy9PzoN/2I5/d/x2fP+q55hdSwPmPmeaZ3GXrgN2+V5Z6hSRPpT6xun4vavGnI0omAurWzvvKMOsi16dYOnXw3ogxzFYe3ws1yrmpH8DkWACQXueg7IGbXJSN2krPXxw7+LZks4nvvxyJL02xjPt+DmRcXly363KTzP4zmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784259433; c=relaxed/simple;
	bh=CohgAhinbcVRGa1Lr+V+8ReNkHLKFQOBP92/o3urdro=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X4FZRCRp3+1fr8SLCio2UhGftLDd4RsBvhIpR22AV3Wr90mTXhrTaABZs0x/mQl7JYBJcgi9XqaCxm8izTH/BopS/UFxtGjXOVyy5/qWBPwBr12ON4VpH4mgNfLzI1KZNdMyMDrpa2JBSVS1u6NidYHBWfdXkuMBrZXG0MbpV1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KEoIt8yJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KEoIt8yJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAD401F00A3D
	for <loongarch@lists.linux.dev>; Fri, 17 Jul 2026 03:37:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784259432;
	bh=q1R5sIjlPDMgDreiakrYm/qEo4dfoZuGx/RUwU6vr/I=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=KEoIt8yJ0NZqJN21F7xdkzemIDyODIi5Y81BSAECyXfKkfPpbs2Bl6RQKGkZLq4Ry
	 QKQAp/vZ5RIKa2IZBmS+ktdyF03Pn7cVodM6sqwlK6TGfWg5hOs5WtxjkOVIb+2WGZ
	 CsswdN/Fm3d1ha1u7WQKbCi8QwGEVOEThkYpRvtJZzdOluNk+rpDSVMkLicxh8Z4DU
	 j+bkgiaYOfJsnYkdQTcU81lbw6KU7dveybIwlFyq+BGDbrkEZeQvO1eJSUytg/ddH5
	 hybx4ZeNjL2AosXNvBy+2tMxHoYUif+StYjfHzHhzUvQFknVGY+aNhlIvJ7OUAZxs/
	 RR105dDGAkD9w==
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-69a50189d25so13115190a12.3
        for <loongarch@lists.linux.dev>; Thu, 16 Jul 2026 20:37:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rq+7mH6trXMNeLw8lG6TclIy1427p6pY03fMIMwq1xQfy5qyW5D1M8UGr3S1u74E7gegctp3UPwjkQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YzofoYalJIkURz32PwiTrMc7Ybp1olctTKr3KwreUeydN+AkaTs
	X50FuPc5OtlZxo0DFoNMv6j7gJzFN9XCzE1uflmS89D3RU1iw74C/dPJ1eQl/OtRWa2TCvA+TN7
	ODXfLCVlrF5lJLN3R6pkSByHIwGmlrho=
X-Received: by 2002:a05:6402:454a:b0:698:351c:97ae with SMTP id
 4fb4d7f45d1cf-69e652dd92dmr156305a12.23.1784259430581; Thu, 16 Jul 2026
 20:37:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260717032721.1993891-1-husong@kylinos.cn>
In-Reply-To: <20260717032721.1993891-1-husong@kylinos.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Fri, 17 Jul 2026 11:37:35 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4nOQAAZf3X4wcf_Kc0wtvV7YPBS_8F=T79RrNs9HEQZw@mail.gmail.com>
X-Gm-Features: AUfX_mwZ5y02yt-iMQKH_KhEwy1tRmiBR9vL3VvSeTkUBmJc-c-hF0iyGiTcQv0
Message-ID: <CAAhV-H4nOQAAZf3X4wcf_Kc0wtvV7YPBS_8F=T79RrNs9HEQZw@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: align range before sizing in local_flush_tlb_kernel_range
To: Song Hu <husong@kylinos.cn>
Cc: kernel@xen0n.name, yangtiezhu@loongson.cn, jiaxun.yang@flygoat.com, 
	arnd@arndb.de, loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Song,

On Fri, Jul 17, 2026 at 11:28=E2=80=AFAM Song Hu <husong@kylinos.cn> wrote:
>
> local_flush_tlb_kernel_range() sizes the flush from the unaligned caller
> range and aligns start/end only afterwards =E2=80=94 the opposite order o=
f its
> sibling local_flush_tlb_range(), which aligns first.  Align start/end
> first, then size, to match the sibling.
>
> The order matters for unaligned ranges: the original size is derived from
> the raw caller range, not the 2-page-aligned range the per-entry invtlb()
> loop actually iterates, so it can fall one entry short, and the
> tlbsize/8-vs-tlbsize/2 threshold may then pick the per-entry loop when a
> full local_flush_tlb_kernel() would be cheaper.
>
> Both strategies flush correctly; the change only makes the sizing heurist=
ic
> match the sibling and reflect the real flush count.
Don't fix fake bugs! You know both are correct, so don't change it.

Huacai

>
> Signed-off-by: Song Hu <husong@kylinos.cn>
> ---
>  arch/loongarch/mm/tlb.c | 11 ++++-------
>  1 file changed, 4 insertions(+), 7 deletions(-)
>
> diff --git a/arch/loongarch/mm/tlb.c b/arch/loongarch/mm/tlb.c
> index 4b3d7120da73..a3c90841edbd 100644
> --- a/arch/loongarch/mm/tlb.c
> +++ b/arch/loongarch/mm/tlb.c
> @@ -90,16 +90,13 @@ void local_flush_tlb_kernel_range(unsigned long start=
, unsigned long end)
>         unsigned long size, flags;
>
>         local_irq_save(flags);
> -       size =3D (end - start + (PAGE_SIZE - 1)) >> PAGE_SHIFT;
> -       size =3D (size + 1) >> 1;
> +       start &=3D (PAGE_MASK << 1);
> +       end +=3D ((PAGE_SIZE << 1) - 1);
> +       end &=3D (PAGE_MASK << 1);
> +       size =3D (end - start) >> (PAGE_SHIFT + 1);
>         if (size <=3D (current_cpu_data.tlbsizestlbsets ?
>                      current_cpu_data.tlbsize / 8 :
>                      current_cpu_data.tlbsize / 2)) {
> -
> -               start &=3D (PAGE_MASK << 1);
> -               end +=3D ((PAGE_SIZE << 1) - 1);
> -               end &=3D (PAGE_MASK << 1);
> -
>                 while (start < end) {
>                         invtlb_addr(INVTLB_ADDR_GTRUE_OR_ASID, 0, start);
>                         start +=3D (PAGE_SIZE << 1);
> --
> 2.43.0
>
