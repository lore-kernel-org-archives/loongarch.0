Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4C6710F5
	for <loongarch@lists.linux.dev>; Mon, 15 Aug 2022 06:01:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F16BC433D6
	for <loongarch@lists.linux.dev>; Mon, 15 Aug 2022 06:01:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660543287;
	bh=XW8nwUdPudaWVo0dt//flSghPs1lU6OIRWxkvQWoIqw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=sv7j+aHvAi18BT6kivLOfUMxwCAhU73Lnc+1NP2Y2HDduxjbS0IGFnJrzSNVbe8WO
	 8BF/decj7HD7bJbSTWYjABQY497VJItPnpt9nNP+qvSQE9IhAY2yRwU/rcOczpTjtQ
	 vUli3bZEer7LMZrkeQx62rMRSVY8INYx6beFf2ITlmbhRnpxN7svYcaZmJDibQdr7o
	 FcfWM4L7/0WvYQLKJ/y3V8jLrxd7SNlbhmOveH3dBz6siU/y/GBgPlERQ+5wf3JPsc
	 CRAeSXdzjUBJ6vB0XOUtxeEaJcoesBIK1KR2brw4fQR2Du5EVaUyAlPV289sPQ38fl
	 qbN0gBGj0k+ww==
Received: by mail-oo1-f44.google.com with SMTP id j1-20020a4ab1c1000000b0043576bcb9b1so1196573ooo.10
        for <loongarch@lists.linux.dev>; Sun, 14 Aug 2022 23:01:27 -0700 (PDT)
X-Gm-Message-State: ACgBeo15xKbiOkFB7MFuepoYoHUdQVzgkXlASrq6jFVs8YdIk4aD/P/y
	1nDNUGZn25OJ1rMA7ZNCzIEhtP2CvifGgnLVyFY=
X-Google-Smtp-Source: AA6agR5iwPmXagsOQjUXh80oht6TfUGZOwhYiZqY+5DBc7JEirD/payJDDNA40HhHFxq8swN0i6THb+4pR707BXQto8=
X-Received: by 2002:a4a:434d:0:b0:441:9b4:ffad with SMTP id
 l13-20020a4a434d000000b0044109b4ffadmr4413232ooj.31.1660543286495; Sun, 14
 Aug 2022 23:01:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220815040554.1455722-1-chenhuacai@loongson.cn>
In-Reply-To: <20220815040554.1455722-1-chenhuacai@loongson.cn>
From: Guo Ren <guoren@kernel.org>
Date: Mon, 15 Aug 2022 14:01:13 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQjhyAp6bP3gu1JTFhOB4N63G3fWydNdFcQKUtYyvqDVg@mail.gmail.com>
Message-ID: <CAJF2gTQjhyAp6bP3gu1JTFhOB4N63G3fWydNdFcQKUtYyvqDVg@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: mm: avoid unnecessary page fault retires on
 shared memory types
To: Huacai Chen <chenhuacai@loongson.cn>
Cc: Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, 
	Xuefeng Li <lixuefeng@loongson.cn>, Xuerui Wang <kernel@xen0n.name>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

It's an optimization to shared memory types. Looks good.

Reviewed-by: Guo Ren <guoren@kernel.org>

On Mon, Aug 15, 2022 at 12:05 PM Huacai Chen <chenhuacai@loongson.cn> wrote:
>
> Commit d92725256b4f22d0 ("mm: avoid unnecessary page fault retires on
> shared memory types") modifies do_page_fault() to handle the VM_FAULT_
> COMPLETED case, but forget to change for LoongArch, so fix it as other
> architectures does.
>
> Fixes: d92725256b4f22d0 ("mm: avoid unnecessary page fault retires on shared memory types")
> Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
> ---
>  arch/loongarch/mm/fault.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/arch/loongarch/mm/fault.c b/arch/loongarch/mm/fault.c
> index 605579b19a00..1ccd53655cab 100644
> --- a/arch/loongarch/mm/fault.c
> +++ b/arch/loongarch/mm/fault.c
> @@ -216,6 +216,10 @@ static void __kprobes __do_page_fault(struct pt_regs *regs,
>                 return;
>         }
>
> +       /* The fault is fully completed (including releasing mmap lock) */
> +       if (fault & VM_FAULT_COMPLETED)
> +               return;
> +
>         if (unlikely(fault & VM_FAULT_RETRY)) {
>                 flags |= FAULT_FLAG_TRIED;
>
> --
> 2.31.1
>


-- 
Best Regards
 Guo Ren
