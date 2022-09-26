Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D67C4A14
	for <loongarch@lists.linux.dev>; Mon, 26 Sep 2022 23:41:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45692C433D6
	for <loongarch@lists.linux.dev>; Mon, 26 Sep 2022 23:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664235689;
	bh=6wNqUX/iaj9uUsoDs1oH5DIKGHbHydMuzqQ6tFjrpzo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=VRN5faFCTQRla4ho117TzoULktAE1emcXRD3+rTh9X8wHEA8ao+FkmkGcdhybEjab
	 o5KJoO4BaUKaWZE3QN9YH7rIG1ZTOz8pUonYvn7fCvB/EYcs2WEGJfb3eYJ3KedoY3
	 xdOJSFOnwCFz+dWbPrL/oFfm5e+mMU5DWRURd+48blW5hgG21mtRbRQIRAQ5/g2xWD
	 YQIgpOCKBQXVXKPeMDRUxTtSUBOPpFRjW3D33Ak+GVYnArCmXDrinUxitD664wMSNO
	 PBd0RdccXzbl1n9b1Ig05Tk2bklG5xdKEUOxh50q+MPG8+t0K/HQTsoDPpyWIiHhj2
	 74x6rOaUom2jw==
Received: by mail-ot1-f50.google.com with SMTP id cm7-20020a056830650700b006587fe87d1aso5416126otb.10
        for <loongarch@lists.linux.dev>; Mon, 26 Sep 2022 16:41:29 -0700 (PDT)
X-Gm-Message-State: ACrzQf0NInwm7bYc5iFaZiFoQCgimw1EMJTCQWRxUelsu/POIfK6x7qt
	G29UnZ8+hR7jA4x/7xOcQ5/1R4BIhKn2l98OfGY=
X-Google-Smtp-Source: AMsMyM6zFzxM3eN6t+1iO53bYPjOeh6NQ+Kjjm6uWtTDyY/6Beq6d0f5Vr/fEwB0lAQL9VRbhWTpDdJZfmUed7ItXL8=
X-Received: by 2002:a05:6830:34a4:b0:65a:b03:54cc with SMTP id
 c36-20020a05683034a400b0065a0b0354ccmr10832187otu.140.1664235688429; Mon, 26
 Sep 2022 16:41:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220926122727.2310118-1-yijun@loongson.cn>
In-Reply-To: <20220926122727.2310118-1-yijun@loongson.cn>
From: Guo Ren <guoren@kernel.org>
Date: Tue, 27 Sep 2022 07:41:12 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQR804AwU0up2-FyTciQZJY2M9xQ7JbiqjwMbkD=aLhCQ@mail.gmail.com>
Message-ID: <CAJF2gTQR804AwU0up2-FyTciQZJY2M9xQ7JbiqjwMbkD=aLhCQ@mail.gmail.com>
Subject: Re: [PATCH v3] LoongArch: Fixup do_ri csr_era
To: Jun Yi <yijun@loongson.cn>
Cc: Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Tiezhu Yang <yangtiezhu@loongson.cn>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
	Qing Zhang <zhangqing@loongson.cn>, Mao Bibo <maobibo@loongson.cn>, 
	Jianmin Lv <lvjianmin@loongson.cn>, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, Sep 26, 2022 at 8:27 PM Jun Yi <yijun@loongson.cn> wrote:
>
> csr_era of pt_regs in do_ri should not add 4 to point to the
> next instruction.
The comment does not make sense. I think it wants to skip some
instructions, but your patch broke that.

>
> Signed-off-by: Jun Yi <yijun@loongson.cn>
> ---
>  arch/loongarch/kernel/traps.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/arch/loongarch/kernel/traps.c b/arch/loongarch/kernel/traps.c
> index aa1c95aaf595..ec888eda3d45 100644
> --- a/arch/loongarch/kernel/traps.c
> +++ b/arch/loongarch/kernel/traps.c
> @@ -477,8 +477,6 @@ asmlinkage void noinstr do_ri(struct pt_regs *regs)
>
>         die_if_kernel("Reserved instruction in kernel code", regs);
>
> -       compute_return_era(regs);
> -
>         if (unlikely(get_user(opcode, era) < 0)) {
>                 status = SIGSEGV;
>                 current->thread.error_code = 1;
> --
> 2.31.1
>


-- 
Best Regards
 Guo Ren
