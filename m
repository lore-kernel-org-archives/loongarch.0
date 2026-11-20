Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795162817;
	b=uFiTaODEURIyL9VekHuDCMKeTn7eMFOpUVIzVha8bUuJtpyx2LDCo8lvG0UjGOM8YKoF
	 ZN11Ro/fK6Q1HtfKjhP1vbwHSZJ4WwjeSqiXJ5b7mDi1DTXETILDqJF4VyhwAnwmpBuHy
	 by7x0HM+KApdM3P3sbY6/YSu1YzIzV5EQpbum9HpEMLE4se/j5h4CXxpVV07dwasmtN+8
	 Y2HkVTtM+P1AOyKvL7161giLFYxio/o7g35zOIXC8amaI0qP5vfUdYGTi+EdJiGwAOKxu
	 5KadxcfnypgDa0DW/DdCYzVjHAjf99LmczuoZZkozccIUgeNXi9kzwPcmkfTYqiBB0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795162817;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=YrezAQ7e02vT8+Swx+rmAAedFzytCEs8zwyhSyPMrmg=;
	b=1/7DZTLHrLBk8IyuL182u5VUV7k9DFcjOapu24/ncQP64uPES5YD56KRSK2cg79hh3WT
	 zWVdhcsqrd6IuDd8mjUHVbWty/n1EXhTlz9g3HzRatn4qEH/JKb9iiYU81fHNLZC2rc+K
	 7xFcAdZFYLuXah/Yc3J9YXhsq8LHx7sTDAU1907G+gpFqh/Fauur4/iM7QE1eFceTb0Yo
	 goKt++KY/90NoDvFHlsduqOx9jgWwm8imcUsK+r5iRT6aOmzIEGYVup3j/pKabqsMNI8W
	 hvHGMKKuZHnT8K4ylNLxThbfB6GAAnDE6sSAPtJiyNFNxL5sQabVR4d2A2gSX1OEyYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LrXi9y8X;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ACB2606A32A
	for <loongarch@lists.linux.dev>; Fri, 20 Nov 2026 08:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LrXi9y8X
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D32531F000D2
	for <loongarch@lists.linux.dev>; Fri, 20 Nov 2026 08:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795162816;
	bh=YrezAQ7e02vT8+Swx+rmAAedFzytCEs8zwyhSyPMrmg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=LrXi9y8X8jjdE6yEgzJwcgu1p/UOdN7422Y+PduJ7Jxvv8AvYxo/zOir+iF8nLXpQ
	 Bkrxa51bADXUuwK97jo82FLdKcYZFq6ZEoQhKTFyk5X91tOkJVoTpv55aLahVARV2M
	 PntYTTvtYpKL5EuTFZcOPrcPN2rAAf4XaT9BkfVbTJYXcE8oizzpzG+3jxR4jK1OWq
	 4X7Lk5xyXAQpx2QJAsfnQ8EsjYD7UeZT3q0CAkm/gotPlAiEmkqkU0GWN2Y1e0sYSv
	 wF9XcfoLYPsKIXJ3jDeZpiAeQ0xvv0ZwDgkmv9diOYcxRviZNkwgSG3OmhFI7p30fC
	 pv7pwvkf3GnGQ==
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6ba1e22ff4dso704390a12.2
        for <loongarch@lists.linux.dev>; Fri, 20 Nov 2026 00:20:16 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFB4PDC6pZtn9P2eccMCIk3ruBX4mO5S+b1L3SqfpAIFQ6QEJyGUNejuQHyujnUqNZj8/YtIj1xSRs=@lists.linux.dev
X-Gm-Message-State: APuU4Z/NrqSU23RzXQZE51RWT+EFlwGOyOnRFM7iHk+4yqhc1hs+0byC
	yvzTv70f6Y6O212x1+UeSl8/mf5O9wC9Sma7Zw9UaY2QW00wvOQGSJy5yjw+GEF5R+5Knf/dlNS
	ba1s98m5ihiyLXR1N2GeYiOaa8Z49Jes=
X-Received: by 2002:a05:6402:3608:b0:6b8:77ad:62e8 with SMTP id
 4fb4d7f45d1cf-6ba37ee17c3mr1286897a12.44.1795162815520; Fri, 20 Nov 2026
 00:20:15 -0800 (PST)
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261029172956.20791-1-dongtai.guo@linux.dev> <20261029172956.20791-4-dongtai.guo@linux.dev>
In-Reply-To: <20261029172956.20791-4-dongtai.guo@linux.dev>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Fri, 20 Nov 2026 16:20:06 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4A8gYGEMkbPk6MEkjLtdEe4OFwBUkERvdpXjiXfriuZw@mail.gmail.com>
X-Gm-Features: AclHuK-h6bybNetTU_MMXuMJwO3eew7bSt_laDSgKQt1od1cbyCQa8XfhqZT6Vs
Message-ID: <CAAhV-H4A8gYGEMkbPk6MEkjLtdEe4OFwBUkERvdpXjiXfriuZw@mail.gmail.com>
Subject: Re: [PATCH v6 3/8] kho: Include linux/mm.h in kho_block.c
To: George Guo <dongtai.guo@linux.dev>
Cc: rppt@kernel.org, pasha.tatashin@soleen.com, pratyush@kernel.org, 
	ardb@kernel.org, shuah@kernel.org, ilias.apalodimas@linaro.org, 
	akpm@linux-foundation.org, baoquan.he@linux.dev, ruirui.yang@linux.dev, 
	guodongtai@kylinos.cn, kernel@xen0n.name, graf@amazon.com, 
	liukexin@kylinos.cn, loongarch@lists.linux.dev, linux-kernel@vger.kernel.org, 
	kexec@lists.infradead.org, linux-mm@kvack.org, 
	linux-kselftest@vger.kernel.org, linux-efi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I have applied this one as a preparation for others.

Huacai

On Fri, Oct 30, 2026 at 1:30=E2=80=AFAM George Guo <dongtai.guo@linux.dev> =
wrote:
>
> From: George Guo <guodongtai@kylinos.cn>
>
> kho_block.c calls virt_to_phys() and phys_to_virt(). With CONFIG_KFENCE=
=3Dy,
> the LoongArch implementations use offset_in_page() and page_address(),
> which are provided by <linux/mm.h>.
>
> Include <linux/mm.h> explicitly to avoid implicit-declaration build
> errors for these helpers.
>
> Co-developed-by: Kexin Liu <liukexin@kylinos.cn>
> Signed-off-by: Kexin Liu <liukexin@kylinos.cn>
> Signed-off-by: George Guo <guodongtai@kylinos.cn>
> ---
>  kernel/liveupdate/kho_block.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/kernel/liveupdate/kho_block.c b/kernel/liveupdate/kho_block.=
c
> index 0d2a342ef422..0d56891b2f4c 100644
> --- a/kernel/liveupdate/kho_block.c
> +++ b/kernel/liveupdate/kho_block.c
> @@ -25,6 +25,7 @@
>  #include <linux/kho/abi/block.h>
>  #include <linux/kho_block.h>
>  #include <linux/slab.h>
> +#include <linux/mm.h>
>
>  /*
>   * Safeguard limit for the number of serialization blocks. This is used =
to
> --
> 2.53.0
>
