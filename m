Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64DE5645
	for <loongarch@lists.linux.dev>; Tue, 27 Sep 2022 05:00:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C2DFC433D6
	for <loongarch@lists.linux.dev>; Tue, 27 Sep 2022 05:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664254840;
	bh=sNQ9AX4FurSAQ4hdfgqH7sHUhUSNDrObqynEzjd1DZQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=XH5JtikL2Kk5S6OOwc9vTpu4Mp7Cu31EMMZirz5Yc2ap9pNWUXTG8TViIDvxlbCTt
	 ntfaE3Y8FeUN4g1CD4+hWZt4pLaGmMB38G2/rUUn4mMUvRo2Uq2uuOCzPuCEErvI5v
	 4VeAU1Ui5R7NDHEVuYK8SkbqywA21pqnnLeUNljpuKJyABkdSzCQxjaSSQf8kVT02S
	 LmkXBBAXukrbZW+BfjvBiIcFPEGHw7XUFiTHdlwjfaERbHer8zWxg9XuHgSQgRgBg/
	 RCYbxtk6p9Bwhp04XRXpAATbVY2M8zAWIxkv6dc/wHtoA+7JfvK1m8KQm18nLykq3h
	 xjcVK4MZwVhwg==
Received: by mail-vs1-f44.google.com with SMTP id u189so8630441vsb.4
        for <loongarch@lists.linux.dev>; Mon, 26 Sep 2022 22:00:40 -0700 (PDT)
X-Gm-Message-State: ACrzQf09u/63LlFNN3s8MEVyVWxKZPszH+fG4BL9VzdxcjKP6+V0+chq
	yMoSHEfh90KV474u2vuqpr8FkyRt9u25ifIpZnQ=
X-Google-Smtp-Source: AMsMyM5h3wYmLKaF5QRT/fFKOpEQ1J80XEQzQ4ezViLXbDrweugvcxvkosVcy/OUCqyOoAHz/pG0ESKXGe1LDDgbpm8=
X-Received: by 2002:a67:d59d:0:b0:398:211f:9a45 with SMTP id
 m29-20020a67d59d000000b00398211f9a45mr11575209vsj.78.1664254839204; Mon, 26
 Sep 2022 22:00:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220927043456.2706194-1-siyanteng@loongson.cn>
In-Reply-To: <20220927043456.2706194-1-siyanteng@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Tue, 27 Sep 2022 13:00:28 +0800
X-Gmail-Original-Message-ID: <CAAhV-H7zr2ZL91pQDr9LG=w7PTYM+rjvOXkX1irMHwM6O93RUg@mail.gmail.com>
Message-ID: <CAAhV-H7zr2ZL91pQDr9LG=w7PTYM+rjvOXkX1irMHwM6O93RUg@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: Clean up loongson3_smp_ops extern
To: Yanteng Si <siyanteng@loongson.cn>
Cc: kernel@xen0n.name, jiaxun.yang@flygoat.com, maobibo@loongson.cn, 
	loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Queued for loongarch-fixes, thanks.

Huacai

On Tue, Sep 27, 2022 at 12:36 PM Yanteng Si <siyanteng@loongson.cn> wrote:
>
> loongson3_smp_ops is not used in LoongArch anymore,
> let's remove it.
>
> Fixes: f2ac457a6138 ("LoongArch: Add CPU definition headers")
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
> ---
>  arch/loongarch/include/asm/loongson.h | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/arch/loongarch/include/asm/loongson.h b/arch/loongarch/include/asm/loongson.h
> index 6e8f6972ceb6..00db93edae1b 100644
> --- a/arch/loongarch/include/asm/loongson.h
> +++ b/arch/loongarch/include/asm/loongson.h
> @@ -14,8 +14,6 @@
>  #include <asm/addrspace.h>
>  #include <asm/bootinfo.h>
>
> -extern const struct plat_smp_ops loongson3_smp_ops;
> -
>  #define LOONGSON_REG(x) \
>         (*(volatile u32 *)((char *)TO_UNCACHE(LOONGSON_REG_BASE) + (x)))
>
> --
> 2.31.1
>
>
