Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793779004;
	b=ZxwgvEEYOodz1tWPeUm2mCD5tXmkfKs8/AT5sNcVEZiHk9YArUQHGO8gjHKmFrsUoOyi
	 rLZISPkuoX14eZd1nWTeP2Z7Hi7Um8jY1kYa5t5nuZy2Xmi4NTDbbHbG03iH5U0QHxrC7
	 IOPatzZm6i6ah2R8hCkCn5p9YA5AspNbN89JY9HMZewQ3QocOA+D0BGXIAEkvraUIomPp
	 j6zvm/xvQA31Zt1mRRNEc1Njay53h/sYdBauOGGxtrg08/yt/+GqwNkEfqTweqiCwP+A8
	 Is7WMHQrdcRQHcWZoQZYl/6SHYtBOp35nuLVddgVB966RwA3nFf3pAuMi1iecXGkVnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793779004;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=HNu4ods6c1120leIpzJBlK6eHIivapUdba0o3Dpccdc=;
	b=bTF4Ip5LoXvs0avl6ifcf/x6eCm7un1zsE3LKOvoqlwiqaJbd8jqCbB+DJsisWTSlLzD
	 nYgVoxUGnRndcGXPEplEFQbxShsjsflj2NomCKVL0yhJbO9ij+/kpWI3oc5EogGBGrPVg
	 NUp1gPSrIZi7v/rUNfmJbKkhDngYydF+a+OqnMyUzH8qixEdv2YOUzfpl9qvkIhneRFZD
	 qdcyYi7COD+9wBD1SZd5KZJH0/jgN1BHD1upSVw9UCZ3Q9JTcR/jxFairIC7dUTk6kPH6
	 584ILismltCb0QGtqLkPNkd3jemnrdiu30rs1KIJ1uK+I1qy3C9SGI0VXOpWphRaT2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EIJoeGEx;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48578606A326
	for <loongarch@lists.linux.dev>; Wed,  4 Nov 2026 07:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EIJoeGEx
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA37C1F00A02
	for <loongarch@lists.linux.dev>; Wed,  4 Nov 2026 07:56:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793779003;
	bh=HNu4ods6c1120leIpzJBlK6eHIivapUdba0o3Dpccdc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=EIJoeGExgzZz1jBK0fbEdK0x0YUnVwYfC/LqbcFPSvjKhaUFrq2Naa2FnzUoL6xTF
	 IKMnljZKrx+GC74WRV9uv4ZXPZZPwfcqQrIXx/Lqegi6JdNQT6jFoNpmbK8mexTP+u
	 fw0ynpvCwbUP+mMpB8P0eBAzq7ZWI6sXmGQp8wAoD0hF0dOSo1q7T/vbpcOj0oMhjd
	 cVP/Y3KYlO6hDgTyaxBsxH2W/tOjDrbS53uFra842uTf2oc6XnAkxlgDOAKAvq/u7n
	 LRtNEd9cf0O/zufCsgMycNSO9un3rDfwSMwCDmUb7ujLOgUHTsjb/m3n3d0/jUZ3Xb
	 /i6HHgM6/6usQ==
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6b566cf56c1so31836a12.2
        for <loongarch@lists.linux.dev>; Tue, 03 Nov 2026 23:56:43 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBzL+s1wcGFdW9L7mIPlX0a59cJsHL1PRtvdLGMJ92Du/lHtW9ebphRdn0CzmwVO8niwB79Ye0PimVw=@lists.linux.dev
X-Gm-Message-State: APuU4Z9Jb+ROaWpXcN/ZS75nWoH71tV883sCbzY3IaJz6tq5cXaJomRO
	KfHIw1mSUyDqNXmy+Z9j8P7v3it1kRcNK1vXWZr7+te8W9lx1EPulDolupcZIb5hWKrWR8uAnhz
	YYR3ajWU5UjoAfw7DI5NcDjYqcRw6wCA=
X-Received: by 2002:aa7:d386:0:b0:6b3:c422:9257 with SMTP id
 4fb4d7f45d1cf-6b4d4d7c182mr7792710a12.25.1793779002538; Tue, 03 Nov 2026
 23:56:42 -0800 (PST)
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261104071858.757793-1-songmuchun@bytedance.com>
In-Reply-To: <20261104071858.757793-1-songmuchun@bytedance.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Wed, 4 Nov 2026 15:56:30 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5iiGZEqf_W2KmtfdqYaKY1HmeK+ZdSz1t+epAhY=X+0A@mail.gmail.com>
X-Gm-Features: AclHuK93_XxdZekUa7K7uSHByhrComWPKbTc4AurJlwH-qxA4RI5N514mVEKT4Y
Message-ID: <CAAhV-H5iiGZEqf_W2KmtfdqYaKY1HmeK+ZdSz1t+epAhY=X+0A@mail.gmail.com>
Subject: Re: [PATCH v2] mm/hugetlb: fix validation of unsupported HugeTLB orders
To: Muchun Song <songmuchun@bytedance.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Oscar Salvador <osalvador@suse.de>, 
	Muchun Song <muchun.song@linux.dev>, David Hildenbrand <david@kernel.org>, 
	Kiryl Shutsemau <kas@kernel.org>, Mike Rapoport <rppt@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Sashiko <sashiko-bot@kernel.org>, linux-mm@kvack.org, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 4, 2026 at 3:19=E2=80=AFPM Muchun Song <songmuchun@bytedance.co=
m> wrote:
>
> Commit 7ce6048d3a7d ("loongarch: drop ranges for definition of
> ARCH_FORCE_MAX_ORDER") removed the ARCH_FORCE_MAX_ORDER ranges for
> LoongArch. Besides dropping unreasonable upper limits, this allowed
> values below the architecture defaults.
>
> With 16KB pages, LoongArch defaults ARCH_FORCE_MAX_ORDER to 11,
> matching HUGETLB_PAGE_ORDER. Forcing it to 10 while enabling HugeTLB
> permits order-11 HugeTLB folios even though MAX_FOLIO_ORDER is 10.
> LoongArch does not select ARCH_HAS_GIGANTIC_PAGE, so this violates the
> generic MM assumption that folios cannot exceed MAX_PAGE_ORDER.
>
> This invalid configuration is accepted by Kconfig.
> BUILD_BUG_ON_INVALID() does not reject it either because it only checks
> whether the expression is valid and never evaluates the comparison.
> Detection is left to the runtime warning in hugetlb_add_hstate(), after
> earlier boot paths may already have used the invalid configuration.
>
> When an invalid HugeTLB order can be identified at build time, reject it
> there. Otherwise, reject it at runtime before the mismatch propagates
> further. Use MAYBE_BUILD_BUG_ON() so constant violations fail the build
> while dynamically determined orders are checked at runtime.
>
> Fixes: 7ce6048d3a7d ("loongarch: drop ranges for definition of ARCH_FORCE=
_MAX_ORDER")
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://lore.kernel.org/sashiko-outbox-192874@kernel.org/
> Signed-off-by: Muchun Song <songmuchun@bytedance.com>
> Suggested-by: Huacai Chen <chenhuacai@kernel.org>

Reviewed-by: Huacai Chen <chenhuacai@kernel.org>

> ---
> v2:
> - Move the order check after hugepages_supported() to avoid a false
>   PowerPC BUG_ON() (suggested by Sashiko)
> ---
>  mm/hugetlb.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/mm/hugetlb.c b/mm/hugetlb.c
> index 779b1de33c78..b49130eb7ad8 100644
> --- a/mm/hugetlb.c
> +++ b/mm/hugetlb.c
> @@ -4197,7 +4197,6 @@ static int __init hugetlb_init(void)
>
>         BUILD_BUG_ON(sizeof_field(struct page, private) * BITS_PER_BYTE <
>                         __NR_HPAGEFLAGS);
> -       BUILD_BUG_ON_INVALID(HUGETLB_PAGE_ORDER > MAX_FOLIO_ORDER);
>
>         if (!hugepages_supported()) {
>                 if (hugetlb_max_hstate || default_hstate_max_huge_pages)
> @@ -4205,6 +4204,8 @@ static int __init hugetlb_init(void)
>                 return 0;
>         }
>
> +       MAYBE_BUILD_BUG_ON(HUGETLB_PAGE_ORDER > MAX_FOLIO_ORDER);
> +
>         /*
>          * Make sure HPAGE_SIZE (HUGETLB_PAGE_ORDER) hstate exists.  Some
>          * architectures depend on setup being done here.
>
> base-commit: 74d73ffcffe03804f97e9fb82301dadf75671282
> --
> 2.54.0
>
