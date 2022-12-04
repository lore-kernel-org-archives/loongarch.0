Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA10B2560
	for <loongarch@lists.linux.dev>; Sun,  4 Dec 2022 08:33:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B1BEC433D7
	for <loongarch@lists.linux.dev>; Sun,  4 Dec 2022 08:33:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670142783;
	bh=cmjY5oszLL7IRjxDpwx8/GqvDU1hN+fhIgQ9aF+UIUw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Uvd5hYbtk/8v0q44tA1WFnaaNVso30QVka3cc23N+E6jBeX49qGYiC0mrGX+MjVP6
	 DsnDfEUHCU1m3kf6+IZTU5Wglymllf4ayCV37NuJurBpdJjnRliAMihMXL0vPGkV8E
	 ttwJBz1t5Fh8HVicTs+cwrl6Q2PGR/7UruWTgEjUe7rGmjULJUNSSd6or4HnyY24Tj
	 lLHswewTYPdFw6n6orP4N+L0fl8HtbiEclZPGXreKThgj4I52cYB4w22KXhibiLsDW
	 rAk0CFgKhdeFpfn5zisCNQr1Bac5Mr4OIzN8E2DrsKfvnmy8Pnl71n9p4t1GjzzsN2
	 BViO+4oXvjvXg==
Received: by mail-ej1-f50.google.com with SMTP id ml11so21053912ejb.6
        for <loongarch@lists.linux.dev>; Sun, 04 Dec 2022 00:33:03 -0800 (PST)
X-Gm-Message-State: ANoB5pnWGphXVr4YqFoc7HusImdo4E8SQ83AAc2qFXlWKr3RWS18xr78
	q931UMAxdXs9dJbLhkFj+F0402jsqb1IAMRpl7c=
X-Google-Smtp-Source: AA0mqf58+X/wXxb7q0m22yo39wScLYrmU5UKy4nZGHPlOQ3YaxDJRvaVlpR6W95uXnCBzLHd2MBQsXtg/OUIRuKl0Mk=
X-Received: by 2002:a17:907:9951:b0:7b2:7e7a:11c1 with SMTP id
 kl17-20020a170907995100b007b27e7a11c1mr49182169ejc.684.1670142781798; Sun, 04
 Dec 2022 00:33:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <1669892345-7763-1-git-send-email-yangtiezhu@loongson.cn>
In-Reply-To: <1669892345-7763-1-git-send-email-yangtiezhu@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sun, 4 Dec 2022 16:32:46 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6ayYzo-khc3ephhw2jAcjtdyckdTXahjS8twpHxQQNAg@mail.gmail.com>
Message-ID: <CAAhV-H6ayYzo-khc3ephhw2jAcjtdyckdTXahjS8twpHxQQNAg@mail.gmail.com>
Subject: Re: [PATCH 0/2] Update links of LoongArch ISA Vol1 and ELF psABI
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: WANG Xuerui <kernel@xen0n.name>, Jonathan Corbet <corbet@lwn.net>, loongarch@lists.linux.dev, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

For the whole series,
Acked-by: Huacai Chen <chenhuacai@loongson.cn>

On Thu, Dec 1, 2022 at 6:59 PM Tiezhu Yang <yangtiezhu@loongson.cn> wrote:
>
> Tiezhu Yang (2):
>   docs/LoongArch: Update links of LoongArch ISA Vol1 and ELF psABI
>   docs/zh_CN/LoongArch: Update links of LoongArch ISA Vol1 and ELF psABI
>
>  Documentation/loongarch/introduction.rst                    | 8 ++++----
>  Documentation/translations/zh_CN/loongarch/introduction.rst | 8 ++++----
>  2 files changed, 8 insertions(+), 8 deletions(-)
>
> --
> 2.1.0
>
