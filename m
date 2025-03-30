Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35FA378F29
	for <loongarch@lists.linux.dev>; Sun, 30 Mar 2025 09:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743327841; cv=none; b=n8yTBQtEWg/S/hMq3A3aqxucQmYX9FlMpwO3jIi48QvHiYAXOfB5WKN/y1JZHdLlIDL/jWV3YYK+6jU3f/hGSHv6E3CTPnGWCfMxIknu4MsfRlsksbMjBEW22ModUXI2a78LRAAoZJiIw5fO9uLj50Wdj20aet0d+Mijweukbkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743327841; c=relaxed/simple;
	bh=0YXluHFZq6Z9vSO7L1Xh83iHulVfnNR6llaVWJByH0I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YwL9JoTH245jmI2wRMmb/wN9MXHUkabSD+bEkwYmHYMqPumicDT2smcA/b/umABV3FeiS79Ld0Bgh4Vrdx4H59tYd3lN2ts3ZMVq06/HGdF4cWHu9Xrp1xfEGt2jZmxfPJHZvzD0TGYnOGLSreX4Kf05Y+6BAuc7Bda7+ARPq78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S45ZTCwq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S45ZTCwq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14C7FC4CEE8
	for <loongarch@lists.linux.dev>; Sun, 30 Mar 2025 09:44:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743327841;
	bh=0YXluHFZq6Z9vSO7L1Xh83iHulVfnNR6llaVWJByH0I=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=S45ZTCwq2kHVpFq/y3lL/UzaEcOgqEFfNnoj0RgYBW0yzxe6NdD/WLYSasBzr+ClB
	 N0p2TVTk2JNC1ouiQJGH+obGWPPbglZwU6Idz8zrBaACJeGP+9sFbsQEUDGn58ibkf
	 ot1nNui2w7Nome/adQMqGebl+LSBGf9QY6G7rZDomD0e5ifdpw0SOWYuwpVJHV0PJC
	 LM0U6F4jpQPQufX+Pjo6ua/cCQMeVRKaLBH9xemK+kbzw3G8e/NuZBDfHzFpXQBet7
	 3OE4PD0Bwsci5SObKYd089ggNUv2gTooG3GFRvRj8O4BRqOmBTba7yfUcAz8c1t33v
	 Ib7S+4kUC/96A==
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-aaee2c5ee6eso536522566b.1
        for <loongarch@lists.linux.dev>; Sun, 30 Mar 2025 02:44:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU1X/sWDV71TGPgcjnl946KRw7Ryq8a0dDrH2A7O9npHOQKvo5t2n3qRjldv070XNVHGOj+4/ge97Y=@lists.linux.dev
X-Gm-Message-State: AOJu0YwVQ/5SBD9bolvGk0xi43afwtMONLGSTmVdAuAO7iH+jsbSkZgH
	gwLlKBsOS9Esavk/N36pw87YJwOrkucujLv5i4lHu7HS82icWl3x8+18LsHeTLKK4tVYVv0BYQK
	LijjrC7vUr5O+8AEZYdrGs2emmYA=
X-Google-Smtp-Source: AGHT+IFNzj5RgPbZFTwtEoDlkVrQD7AFWQB2HR/KFzTHpsjuJk7kAi+3yG6WGzLSjp8vJaxh9TNURuFlgBvLCOVFDDQ=
X-Received: by 2002:a17:907:9693:b0:ac6:ff34:d046 with SMTP id
 a640c23a62f3a-ac7389ea430mr489833366b.2.1743327839602; Sun, 30 Mar 2025
 02:43:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250319025413.67014-1-linmq006@gmail.com>
In-Reply-To: <20250319025413.67014-1-linmq006@gmail.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sun, 30 Mar 2025 17:43:47 +0800
X-Gmail-Original-Message-ID: <CAAhV-H77Y2aCWd678KOABZ+yEkXVZWr2ZLMzLQKKs23EWGPPuw@mail.gmail.com>
X-Gm-Features: AQ5f1JovyJXUWpxNRcfdKpHq0uOXu1s-LbigB0Ck1IzFHnj9mnOzVtoQC_UVERY
Message-ID: <CAAhV-H77Y2aCWd678KOABZ+yEkXVZWr2ZLMzLQKKs23EWGPPuw@mail.gmail.com>
Subject: Re: [PATCH] Loongarch: Fix device node refcount leak in fdt_cpu_clk_init
To: Miaoqian Lin <linmq006@gmail.com>
Cc: WANG Xuerui <kernel@xen0n.name>, Binbin Zhou <zhoubinbin@loongson.cn>, 
	Hongliang Wang <wanghongliang@loongson.cn>, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Applied, thanks.

Huacai

On Wed, Mar 19, 2025 at 10:54=E2=80=AFAM Miaoqian Lin <linmq006@gmail.com> =
wrote:
>
> Add missing of_node_put() to properly handle the reference count of the
> device node obtained from of_get_cpu_node().
>
> Fixes: 44a01f1f726a ("LoongArch: Parsing CPU-related information from DTS=
")
> Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
> ---
>  arch/loongarch/kernel/env.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/loongarch/kernel/env.c b/arch/loongarch/kernel/env.c
> index 2f1f5b08638f..01aea44cf4b0 100644
> --- a/arch/loongarch/kernel/env.c
> +++ b/arch/loongarch/kernel/env.c
> @@ -68,6 +68,7 @@ static int __init fdt_cpu_clk_init(void)
>                 return -ENODEV;
>
>         clk =3D of_clk_get(np, 0);
> +       of_node_put(np);
>         if (IS_ERR(clk))
>                 return -ENODEV;
>
> --
> 2.39.5 (Apple Git-154)
>
