Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 825F57F
	for <loongarch@lists.linux.dev>; Mon,  1 Aug 2022 15:34:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38B66C43140
	for <loongarch@lists.linux.dev>; Mon,  1 Aug 2022 15:34:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1659368080;
	bh=SopU2Dx9+Fogun8+HI+zMadE4kKBX3Mq9vYrcuV465k=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=b2Cxruv739bbgE7iFITXxWHDVNzUDFsNvBnlGt8iYgq2Ek0u5x+UnoDg09uzpNgE9
	 H3z7is4LZKFG3DgbrOL3bDYCsTGswqZVegnpUgYfGKs96HspM15wzKgFJkXhRDDzHa
	 VhE23gCvbdV1HCRw1abmnfo9sYmEWG0IDFy1ZyQu0rBOmuYxBxIyVs+oPVGekXx+tZ
	 gExj9O940PgOHX98GtqLbW2ObwwZPtnTDS0QklHBc8b1wydr/5IIKBe9lII/YB0UdU
	 1OF9O5yXRgZUhZcLLqQVyyw/VlYDIeYN8BP+JBvmES0625aVBdtvRlNcnYjUbKNlf0
	 MtXb7cCyNcAIg==
Received: by mail-vs1-f42.google.com with SMTP id l68so11667310vsc.0
        for <loongarch@lists.linux.dev>; Mon, 01 Aug 2022 08:34:40 -0700 (PDT)
X-Gm-Message-State: ACgBeo0sULLaOPtrc0Sadd634FjXBjKs+0CwbJPcSYans+bw7Sw92mfW
	YVBssQrcWz6velLCrwfW7hNJtfIYDj6yvAiPk4E=
X-Google-Smtp-Source: AA6agR7Qrsp+h8Ya+oRX+sMvc1vsXjXlxEd9rU8clHuJTbjfM3u9QDVn/4iabqscndTjm5fWadzbymScnQlqIw0+PtE=
X-Received: by 2002:a05:6102:390d:b0:387:78b9:bf9c with SMTP id
 e13-20020a056102390d00b0038778b9bf9cmr352221vsu.43.1659368079127; Mon, 01 Aug
 2022 08:34:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220801121726.9681-1-zhangqing@loongson.cn>
In-Reply-To: <20220801121726.9681-1-zhangqing@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Mon, 1 Aug 2022 23:34:26 +0800
X-Gmail-Original-Message-ID: <CAAhV-H61DOGHXeVmZif7e04jpYBZNja-wPyLFhAtECZkZSQScA@mail.gmail.com>
Message-ID: <CAAhV-H61DOGHXeVmZif7e04jpYBZNja-wPyLFhAtECZkZSQScA@mail.gmail.com>
Subject: Re: [PATCH 0/4] LoongArch: Add unwinder support
To: Qing Zhang <zhangqing@loongson.cn>
Cc: WANG Xuerui <kernel@xen0n.name>, loongarch@lists.linux.dev, 
	LKML <linux-kernel@vger.kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
	Jinyang He <hejinyang@loongson.cn>
Content-Type: text/plain; charset="UTF-8"

Hi, Qing,

I think we don't need to CC linux-kernel; on the other hand, CC
linux-arch and Arnd is worthy.
BTW, it seems you are missing V2 in the title.

Huacai

On Mon, Aug 1, 2022 at 8:17 PM Qing Zhang <zhangqing@loongson.cn> wrote:
>
> This series in order to add stacktrace suport, Some upcoming features require
> these changes, like trace, divide unwinder into guess unwinder and prologue
> unwinder is to add new unwinders in the future, eg:unwind_frame, unwind_orc .etc.
> Three stages when we do unwind,
>   1) unwind_start(), the prapare of unwinding, fill unwind_state.
>   2) unwind_done(), judge whether the unwind process is finished or not.
>   3) unwind_next_frame(), unwind the next frame.
>
> you can test them by:
>   1) echo t > /proc/sysrq-trigger
>   2) cat /proc/*/stack
>   4) ftrace: function graph
>   5) uprobe: echo 1 > ./options/userstacktrace
>
> Changes from v1 to v2:
>
> - Add the judgment of the offset value of ra in the prologue.
>   (Suggested by Youling).
> - Create an inline function to check the sign bit, which is convenient
>   for extending other types of immediates.  (Suggested by Jinyang).
> - Fix sparse warning :
>     arch/loongarch/include/asm/uaccess.h:232:32: sparse: sparse: incorrect
>     type in argument 2 (different address spaces) @@     expected void const
>     *from @@     got void const [noderef] __user *from @@
> - Add USER_STACKTRACE support as a series.
>
> Qing Zhang (4):
>   LoongArch: Add guess unwinder support
>   LoongArch: Add prologue unwinder support
>   LoongArch: Add stacktrace support
>   LoongArch: Add USER_STACKTRACE support
>
>  arch/loongarch/Kconfig                  |   6 +
>  arch/loongarch/Kconfig.debug            |  28 ++++
>  arch/loongarch/include/asm/inst.h       |  52 +++++++
>  arch/loongarch/include/asm/processor.h  |   9 ++
>  arch/loongarch/include/asm/stacktrace.h |  22 +++
>  arch/loongarch/include/asm/switch_to.h  |  14 +-
>  arch/loongarch/include/asm/uaccess.h    |   4 +-
>  arch/loongarch/include/asm/unwind.h     |  45 +++++++
>  arch/loongarch/kernel/Makefile          |   4 +
>  arch/loongarch/kernel/asm-offsets.c     |   2 +
>  arch/loongarch/kernel/process.c         |  64 +++++++++
>  arch/loongarch/kernel/stacktrace.c      |  79 +++++++++++
>  arch/loongarch/kernel/switch.S          |   2 +
>  arch/loongarch/kernel/traps.c           |  27 ++--
>  arch/loongarch/kernel/unwind_guess.c    |  65 +++++++++
>  arch/loongarch/kernel/unwind_prologue.c | 172 ++++++++++++++++++++++++
>  16 files changed, 577 insertions(+), 18 deletions(-)
>  create mode 100644 arch/loongarch/include/asm/unwind.h
>  create mode 100644 arch/loongarch/kernel/stacktrace.c
>  create mode 100644 arch/loongarch/kernel/unwind_guess.c
>  create mode 100644 arch/loongarch/kernel/unwind_prologue.c
>
> --
> 2.20.1
>
>
