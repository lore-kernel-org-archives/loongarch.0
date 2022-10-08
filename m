Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDF8FEDE
	for <loongarch@lists.linux.dev>; Sat,  8 Oct 2022 14:58:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92011C433B5
	for <loongarch@lists.linux.dev>; Sat,  8 Oct 2022 14:58:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665241104;
	bh=aPQLhQqDhgqtTeKKu7I6BgunfElRN0VLe4/LVpiJj8Q=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=SJ2U+BG/re37qpGCtt3ylT+on4KjrFXyfCEuFahc5V7IeLfifDA0XOELAlPeDySsJ
	 3AsHED0Kcw3KLM0Ey2pDyesh5MYq1/DSgeMUceEf+7gi8InvmRem8uCuvT3yel+g+y
	 X/ctAd9i3bWuByZjqvZMGibtLBNGuHOf512C/GGzlxbt1JbonmV3ik4f+6VWeTK9xu
	 ORy8ieAJUrf5XMk9S07lgEzGb39APA3k1VAmNNoLaGpcIqGQnX3X6EKb5pM7As8vcG
	 Q+dcRO8RIWq1knxSL2smEIUPSObaTJMjGyyQonuCTEmgy65yEks2BQXS2XY2nD3U3F
	 m3zp/Q7kO6h0A==
Received: by mail-ed1-f42.google.com with SMTP id w10so10551982edd.4
        for <loongarch@lists.linux.dev>; Sat, 08 Oct 2022 07:58:24 -0700 (PDT)
X-Gm-Message-State: ACrzQf0QdMwqhaACzFHLXD7hrGyDGb7IBw9ZizRZRQ43a7z3fMC/cG9l
	o9cVH/TZfNqmcQDUCvQ8b9f2pdYSVN5rGLXwDO0=
X-Google-Smtp-Source: AMsMyM6tc39Kmj/GVcBx0J/xlI1xhKO7ntaFXB97jjzs9fTFqPC4XA07V2UJbpEf5LTfC+yYAolkU1xA83SO+5Ypajc=
X-Received: by 2002:a05:6402:c81:b0:458:c428:173a with SMTP id
 cm1-20020a0564020c8100b00458c428173amr9336461edb.298.1665241102794; Sat, 08
 Oct 2022 07:58:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221007201939.2755407-1-colin.i.king@gmail.com>
In-Reply-To: <20221007201939.2755407-1-colin.i.king@gmail.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sat, 8 Oct 2022 22:58:10 +0800
X-Gmail-Original-Message-ID: <CAAhV-H721Wfkam+_+evNRXyuaio9oGqQQaDO6t-T31UdNp8gSQ@mail.gmail.com>
Message-ID: <CAAhV-H721Wfkam+_+evNRXyuaio9oGqQQaDO6t-T31UdNp8gSQ@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: Kconfig: Fix spelling mistake "delibrately" -> "deliberately"
To: Colin Ian King <colin.i.king@gmail.com>
Cc: WANG Xuerui <kernel@xen0n.name>, loongarch@lists.linux.dev, 
	kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Queued for loongarch-next, thank you.

Huacai

On Sat, Oct 8, 2022 at 4:19 AM Colin Ian King <colin.i.king@gmail.com> wrote:
>
> There is a spelling mistake in a commented section. Fix it.
>
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
>  arch/loongarch/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
> index 898263224bbc..903096bd87f8 100644
> --- a/arch/loongarch/Kconfig
> +++ b/arch/loongarch/Kconfig
> @@ -171,7 +171,7 @@ config STACKTRACE_SUPPORT
>         bool
>         default y
>
> -# MACH_LOONGSON32 and MACH_LOONGSON64 are delibrately carried over from the
> +# MACH_LOONGSON32 and MACH_LOONGSON64 are deliberately carried over from the
>  # MIPS Loongson code, to preserve Loongson-specific code paths in drivers that
>  # are shared between architectures, and specifically expecting the symbols.
>  config MACH_LOONGSON32
> --
> 2.37.3
>
