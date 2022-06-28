Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5387624
	for <loongarch@lists.linux.dev>; Tue, 28 Jun 2022 07:29:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 860B8C341CB
	for <loongarch@lists.linux.dev>; Tue, 28 Jun 2022 07:29:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656401376;
	bh=gajtv8igkxsalepIVsDrLsd6ac/KAzU/0AKP3t/oWm8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=NWIhdzsLkx/fuKi2CbKB7Gp774a+W5f5NwfOLFGwf3z90rhbsxTMinAkxh8jcakiU
	 nFrPTKtgbDMuLxRd0Xdx9bpR4/QBGWpd0POhws/XpGi/1wmu5e9nUW4kKHPnhwWig+
	 UpCnnLlJfykJj/VcFNhWGS/FtmJs2xj1Ddrm8eyloOPYBdU4uGQotjTtPKa/4Oma91
	 tdCSm41+p768sEEUMv99WiRf6/XE0MVqmyprGMYjISm2T7Kh/9UemWgRYdSs6YkrsO
	 Pup2m93l3AuJc/2Dy1Av+NVS1WtGQb0E3uSL+iHvLYbPguARV2hzBVt14ZdapXvH74
	 mGf2sF2D/D3vg==
Received: by mail-vs1-f42.google.com with SMTP id k25so11186451vso.6
        for <loongarch@lists.linux.dev>; Tue, 28 Jun 2022 00:29:36 -0700 (PDT)
X-Gm-Message-State: AJIora/xGb2OqoB1p2p0+gHE3kUeydpZk42njoCwyYf3jIwiHB5FPLwY
	p9u4WG/P+H7FBmTZWpJO6vVOYNVGcccnWh0u6iA=
X-Google-Smtp-Source: AGRyM1v78quckxzZ1EVy8zY1GzwUlah3HJmvB0SJzL+HccAA+AcvunAA4R7teXMtlllIWtG3ET26bvghE23c1jGqAhM=
X-Received: by 2002:a67:f588:0:b0:354:35de:4329 with SMTP id
 i8-20020a67f588000000b0035435de4329mr690432vso.84.1656401375514; Tue, 28 Jun
 2022 00:29:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <1656313055-547-1-git-send-email-yangtiezhu@loongson.cn> <4a4bce7b-cc75-6035-9ce2-1727d97a458d@loongson.cn>
In-Reply-To: <4a4bce7b-cc75-6035-9ce2-1727d97a458d@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Tue, 28 Jun 2022 15:29:24 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5W2TL9Vg7Zk+JV+9hQgnH9FPJJGFz+W0Y7fx2_FsphKw@mail.gmail.com>
Message-ID: <CAAhV-H5W2TL9Vg7Zk+JV+9hQgnH9FPJJGFz+W0Y7fx2_FsphKw@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: Fix section mismatch warning
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>, WANG Xuerui <kernel@xen0n.name>, 
	LKML <linux-kernel@vger.kernel.org>, Li Xuefeng <lixuefeng@loongson.cn>, 
	loongarch@lists.linux.dev, Masahiro Yamada <masahiroy@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Applied to loongarch-fixes, thanks.

Huacai

On Tue, Jun 28, 2022 at 8:18 AM Tiezhu Yang <yangtiezhu@loongson.cn> wrote:
>
> Cc Masahiro Yamada <masahiroy@kernel.org>
>
> Hi Masahiro,
>
> Please review this patch.
>
> https://lore.kernel.org/lkml/1656313055-547-1-git-send-email-yangtiezhu@loongson.cn/
>
> I think it is related with the following issue, thank you.
>
> https://lore.kernel.org/lkml/CAHk-=wgcsUU-TNoLS7Q6YF3RCSVAKwNM7gFOwqnPQTiU_oGEWA@mail.gmail.com/
>
> Thanks,
> Tiezhu
>
