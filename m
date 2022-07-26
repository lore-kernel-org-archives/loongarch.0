Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E114653
	for <loongarch@lists.linux.dev>; Tue, 26 Jul 2022 12:40:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5331C341C0
	for <loongarch@lists.linux.dev>; Tue, 26 Jul 2022 12:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1658839209;
	bh=bCYD9vRu/AfAajj4LHEbqZFnMrA7xpqr3VuMRvzz5WU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=tfMNZ0iJYAwwkkgv8UcM1eGZIQ/ut9shOmA0ai6zEqK+eU/Am7+s0Grhl/dn/v6UZ
	 lMGJKOcZ5hXKoSu72TMo6POFQk1XG+V116MhVgz+Ww1zWbcnp6MQIAyQuvWq23VD1B
	 Ls7475lhmI2pv8zZOpNoMD6VcBePcAotqBBERRElz39HdRiP1CKisEvnPdIVKZawHk
	 By6lzuvR/aad0G/qFjq98mXn6nWvZHnYaXJBEYgmvy9HR9UMMXL9FNotbDJywngtfe
	 ROfbu8337FQyMzyLsymHQckTl1k/G24AeVul77a/KVBh9HjxkIHVnV/Y1LAQ/p6AEe
	 8hvccjCkp1rPQ==
Received: by mail-vs1-f42.google.com with SMTP id 129so5927618vsq.8
        for <loongarch@lists.linux.dev>; Tue, 26 Jul 2022 05:40:09 -0700 (PDT)
X-Gm-Message-State: AJIora8K5mqqrY6s84Xo/Vpb9NgBxAvCMMLlZsk1Sbh5zR8RB3uQclJm
	9Zykp6YMvRhn7nyyHf4skCsetHQie1Mst4JQTKg=
X-Google-Smtp-Source: AGRyM1tx5Tw3iO0yxDhPS3tWZUQuQDn096FgFl8b+O6W/sLCOLcZj7S+xUlsOYKAYZd5g65v0vMXLwpZty52IqrMUQQ=
X-Received: by 2002:a05:6102:3d3:b0:358:8a04:30cb with SMTP id
 n19-20020a05610203d300b003588a0430cbmr598915vsq.43.1658839208858; Tue, 26 Jul
 2022 05:40:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220726122920.2291947-1-kernel@xen0n.name> <20220726122920.2291947-4-kernel@xen0n.name>
In-Reply-To: <20220726122920.2291947-4-kernel@xen0n.name>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Tue, 26 Jul 2022 20:39:56 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6Q9VNWBevwA-ekv6KfZ5okck+Q9XONNCv3THTwSAhGUw@mail.gmail.com>
Message-ID: <CAAhV-H6Q9VNWBevwA-ekv6KfZ5okck+Q9XONNCv3THTwSAhGUw@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] LoongArch: Remove several syntactic sugar macros
 for branches
To: WANG Xuerui <kernel@xen0n.name>
Cc: loongarch@lists.linux.dev, WANG Xuerui <git@xen0n.name>
Content-Type: text/plain; charset="UTF-8"

Hi, Xuerui,

This patch should be the first one or the last one, why it is in the middle?

Huacai

On Tue, Jul 26, 2022 at 8:29 PM WANG Xuerui <kernel@xen0n.name> wrote:
>
> From: WANG Xuerui <git@xen0n.name>
>
> These syntactic sugars have been supported by upstream binutils from the
> beginning, so no need to patch them locally.
>
> Signed-off-by: WANG Xuerui <git@xen0n.name>
> ---
>  arch/loongarch/include/asm/asmmacro.h | 12 ------------
>  1 file changed, 12 deletions(-)
>
> diff --git a/arch/loongarch/include/asm/asmmacro.h b/arch/loongarch/include/asm/asmmacro.h
> index a1a04083bd67..be037a40580d 100644
> --- a/arch/loongarch/include/asm/asmmacro.h
> +++ b/arch/loongarch/include/asm/asmmacro.h
> @@ -274,16 +274,4 @@
>         nor     \dst, \src, zero
>  .endm
>
> -.macro bgt r0 r1 label
> -       blt     \r1, \r0, \label
> -.endm
> -
> -.macro bltz r0 label
> -       blt     \r0, zero, \label
> -.endm
> -
> -.macro bgez r0 label
> -       bge     \r0, zero, \label
> -.endm
> -
>  #endif /* _ASM_ASMMACRO_H */
> --
> 2.35.1
>
