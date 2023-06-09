Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65DEC10F9
	for <loongarch@lists.linux.dev>; Fri,  9 Jun 2023 02:05:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35FF3C4339B
	for <loongarch@lists.linux.dev>; Fri,  9 Jun 2023 02:05:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686276312;
	bh=KXYZnd2Dp+oBXwR3J88fqvQLX/aS78bYiYQ7cL2D2cg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ocWlxdA22HW5Y8nH8e5dpZ5DdeWgU7owemTJsWKdqs5G4xLVQjFrIn+u043uSTGuG
	 rJDAbiNcOb7SI3vZS/CewQ2Qv4dU32P9qMd2LUBvUapaVl5Px+DrX+UVncg5aEiXmU
	 SgIz/vRtWWy/kFdqyfSLq589GPYWQHOA+wuf2rcKw3DBYHYoRxoKSObMom4R37QdtV
	 IGaoyt+REzz3Q+rjg8punU00RDoBuc91eniDEzJ5va2/Y7m2VV+ZJvcZdmmoMPXHkF
	 xtda0mUHwvbdD26Tw8hX87KNImsg1sAybasEpl8K0uabvJEZRF5ZX8QaBdZJ+N5kRd
	 cYIbuBK+CrPVw==
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-97467e06511so224887466b.2
        for <loongarch@lists.linux.dev>; Thu, 08 Jun 2023 19:05:12 -0700 (PDT)
X-Gm-Message-State: AC+VfDyKIqY2RVYVz7A6Fi6bxUrfKvZfjGxOI+ZAi95oTcLr3jOU/Xr+
	nD7vjm6zDWkN44byyjWtOX6l2QAo68wieOV/3kI=
X-Google-Smtp-Source: ACHHUZ4zyM/rSM2b/SUwpwD733zbZ7T8VbxYv4UjXz0Yb8MS1FH4LzMcs4rZzh6/q+xpwBJh1+8Oqa504tsvbHAUGSc=
X-Received: by 2002:a17:907:2d11:b0:96f:905e:6117 with SMTP id
 gs17-20020a1709072d1100b0096f905e6117mr347987ejc.56.1686276310499; Thu, 08
 Jun 2023 19:05:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230608022738.1861729-1-huqi@loongson.cn>
In-Reply-To: <20230608022738.1861729-1-huqi@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Fri, 9 Jun 2023 10:04:58 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4ve4injzQJNp5=y0qkE7szy6EwxNOnPzzFn0+aAGZgdg@mail.gmail.com>
Message-ID: <CAAhV-H4ve4injzQJNp5=y0qkE7szy6EwxNOnPzzFn0+aAGZgdg@mail.gmail.com>
Subject: Re: [PATCH v2] LoongArch: Fix function write_fcsr
To: Qi Hu <huqi@loongson.cn>
Cc: WANG Xuerui <kernel@xen0n.name>, Qing Zhang <zhangqing@loongson.cn>, 
	Enze Li <lienze@kylinos.cn>, loongarch@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Miao HAO <haomiao19@mails.ucas.ac.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Queued, thanks.

Huacai

On Thu, Jun 8, 2023 at 10:27=E2=80=AFAM Qi Hu <huqi@loongson.cn> wrote:
>
> Function "write_fcsr" uses wrong asm dest. Fix it!
>
> Reported-by: Miao HAO <haomiao19@mails.ucas.ac.cn>
> Signed-off-by: Qi Hu <huqi@loongson.cn>
> ---
>  arch/loongarch/include/asm/loongarch.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/loongarch/include/asm/loongarch.h b/arch/loongarch/incl=
ude/asm/loongarch.h
> index b3323ab5b78d..35e8a52fea11 100644
> --- a/arch/loongarch/include/asm/loongarch.h
> +++ b/arch/loongarch/include/asm/loongarch.h
> @@ -1496,7 +1496,7 @@ __BUILD_CSR_OP(tlbidx)
>  #define write_fcsr(dest, val) \
>  do {   \
>         __asm__ __volatile__(   \
> -       "       movgr2fcsr      %0, "__stringify(dest)" \n"     \
> +       "       movgr2fcsr      "__stringify(dest)", %0 \n"     \
>         : : "r" (val)); \
>  } while (0)
>
> --
> 2.40.1
>
