Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C66B1363
	for <loongarch@lists.linux.dev>; Sat,  2 Jul 2022 03:35:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6EE3C341CA
	for <loongarch@lists.linux.dev>; Sat,  2 Jul 2022 03:35:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656732911;
	bh=cr+pl9WXz8AfqvA6EUHll+681tdUpcUa3Wq5zN4bllM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=CuodT9iDQyFYwBDo7CIHJPz+zH3F+URJ+LyYtp6rpPZYoiJFIN3Isgybb+Bwzd9wG
	 w8N/pUG8EMh6gDFGelW/RuBlRbZ0gdrvqzQRhCPs8ReaN6JWQf3pyjLM8A8yZ/Avw7
	 HjkdR7dxY4AxsGMpenGEDOM3ysbkFTZcttX4+GiD7oQM9guqmVintDUNnPgf1wrDGw
	 xbAQTg/iXnGdQEaNTs128Ytc+VihPdhRF4JDZbUDYBggm8eBXk+65FeFYG7Er+eR9I
	 RdlqPndK+50bFbC8HBywWG5ArVsP7VlyIVmP/seX3XfgQJU+t8J54pT26CAwS3aq8n
	 21BfOnLOxNAZQ==
Received: by mail-vs1-f49.google.com with SMTP id j6so4043293vsi.0
        for <loongarch@lists.linux.dev>; Fri, 01 Jul 2022 20:35:11 -0700 (PDT)
X-Gm-Message-State: AJIora8vtl7wAFXhX9veGPgpZVCrM/CjQxa3+1UFKksTxCm0jU77HI53
	7/WQMLMrP3QkV8v7O0vwQaOLXvMmyZo7lOk80o0=
X-Google-Smtp-Source: AGRyM1uIvtdoLeVzTh0ozSY1rfVTd2hvkORArGgiPetinY3NPXClaAXqHKeJ25xrBhiAnVC0pUG0ltxZat3Gf5RtjWw=
X-Received: by 2002:a67:6fc3:0:b0:356:18:32ba with SMTP id k186-20020a676fc3000000b00356001832bamr13047716vsc.43.1656732910679;
 Fri, 01 Jul 2022 20:35:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220701144946.2528972-1-linux@roeck-us.net>
In-Reply-To: <20220701144946.2528972-1-linux@roeck-us.net>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sat, 2 Jul 2022 11:34:59 +0800
X-Gmail-Original-Message-ID: <CAAhV-H60k06-JO1jEwbOkW2O+QUaF7vCbGXO0EPjJ81kdU14FQ@mail.gmail.com>
Message-ID: <CAAhV-H60k06-JO1jEwbOkW2O+QUaF7vCbGXO0EPjJ81kdU14FQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] LoongArch: Fix build errors
To: Guenter Roeck <linux@roeck-us.net>
Cc: WANG Xuerui <kernel@xen0n.name>, Guo Ren <guoren@kernel.org>, loongarch@lists.linux.dev, 
	LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi, Guenter,

On Fri, Jul 1, 2022 at 10:49 PM Guenter Roeck <linux@roeck-us.net> wrote:
>
> A number of build errors is seen when trying to build loongarch:allnoconfig
> or loongarch:tinyconfig. This patch series tries to fix the observed
> errors.
Thank you very much for your patches. From my point of view, the first
patch is good, but we usually include <linux/xxx> before <asm/yyy>;
the second patch is not so good, and I think the correct way is modify
the cflags for vdso [1]; and the third patch can be dropped at this
time, until our kernel is bootable.

[1] https://lore.kernel.org/loongarch/20220623044715.2072428-1-chenhuacai@loongson.cn/T/#u

Huacai
>
> ----------------------------------------------------------------
> Guenter Roeck (3):
>       LoongArch: page.h: Add missing include file
>       LoongArch: Do not include file from toolchain
>       LoongArch: Always select EFI
>
>  arch/loongarch/Kconfig                 |  6 ++----
>  arch/loongarch/include/asm/loongarch.h | 23 +++++++++++------------
>  arch/loongarch/include/asm/page.h      |  1 +
>  3 files changed, 14 insertions(+), 16 deletions(-)
