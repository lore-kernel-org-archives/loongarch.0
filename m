Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E51277C
	for <loongarch@lists.linux.dev>; Sat,  6 Aug 2022 10:43:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81461C433B5
	for <loongarch@lists.linux.dev>; Sat,  6 Aug 2022 10:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1659782637;
	bh=x21kK6AqekRaMQvAZCd0dX5zUj5OkDS6YythMycasWI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=e9dsJuYFIf5g2eRjNiMDUt4K/TuSlMUxAhU4oIW6QJDB2EJAGUnFpIS/AFs/KDTQW
	 4aqhotZqSISCyvzD/fqY3b3MR3UmYnDiKdxzzRwx2aelVgN1ajFA9sW2am68SpBW/B
	 CIMBFuy3ikZRS5VgPebzbw9Bg1e2cu1L2/tI/19TkfCioeLWFsLsp+i9D2/CSoWkTW
	 CBdWMtt3QjhL5yOj3Jd6GpOrJ2D2Ch5Zd59/7G/l2L5JOZ8IyOjZGzDsoRtkDblPqv
	 819abIRUp/G6nqBvUqM/mr8LO83HCDUjRAwQiP4wcd44l/u5nosDNtgpty9Ksq07GK
	 0btDm6MwoD3Cg==
Received: by mail-vs1-f54.google.com with SMTP id q190so4682226vsb.7
        for <loongarch@lists.linux.dev>; Sat, 06 Aug 2022 03:43:57 -0700 (PDT)
X-Gm-Message-State: ACgBeo0XxEm+KMC2cjri7hMuUuS1tG4y7xYjjGlEZknK+BClmKDmtx5l
	RaRh5Unyfs/boP+StmbGQoOPzzdwr1UOgpN2mPo=
X-Google-Smtp-Source: AA6agR4QNCp1y2aVFCbrFa/6CdS2PkEc+oLgNWnDop4v+Vr4w5W2737BevBF5J5RzajBWFfnKQ407aZF3su4cI3gPQE=
X-Received: by 2002:a67:d595:0:b0:388:4392:e067 with SMTP id
 m21-20020a67d595000000b003884392e067mr5060201vsj.78.1659782636384; Sat, 06
 Aug 2022 03:43:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220806081005.332-1-zhangqing@loongson.cn>
In-Reply-To: <20220806081005.332-1-zhangqing@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sat, 6 Aug 2022 18:43:41 +0800
X-Gmail-Original-Message-ID: <CAAhV-H7pNE5Aab1xfxQcLubT_wJtk-f4Mxu6r0uQrKHXZiLEaQ@mail.gmail.com>
Message-ID: <CAAhV-H7pNE5Aab1xfxQcLubT_wJtk-f4Mxu6r0uQrKHXZiLEaQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/4] Add unwinder support
To: Qing Zhang <zhangqing@loongson.cn>
Cc: WANG Xuerui <kernel@xen0n.name>, loongarch@lists.linux.dev, 
	LKML <linux-kernel@vger.kernel.org>, linux-arch <linux-arch@vger.kernel.org>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, Arnd Bergmann <arnd@arndb.de>, 
	Jinyang He <hejinyang@loongson.cn>, Youling Tang <tangyouling@loongson.cn>
Content-Type: text/plain; charset="UTF-8"

Queued for 5.20,thanks.

Huacai

On Sat, Aug 6, 2022 at 4:10 PM Qing Zhang <zhangqing@loongson.cn> wrote:
>
> This series in order to add stacktrace support, Some upcoming features require
> these changes, like trace, divide unwinder into guess unwinder and prologue
> unwinder is to add new unwinders in the future.
> eg:unwinder_frame, unwinder_orc .etc.
>
> Three stages when we do unwind,
>   1) unwind_start(), the prapare of unwinding, fill unwind_state.
>   2) unwind_done(), judge whether the unwind process is finished or not.
>   3) unwind_next_frame(), unwind the next frame.
>
> you can test them by:
>   1) echo t > /proc/sysrq-trigger
>   2) cat /proc/*/stack
>   3) ftrace: function graph
>   4) uprobe: echo 1 > ./options/userstacktrace
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
> Changes from v2 to v3:
>
> - Move unwind_start definition and use location, remove #ifdef in unwind_state
>   and use type instead of enable. (Suggested by Huacai).
> - Separated fixes for uaccess.h. (Suggested by Huacai).
>
> Changes from v3 to v4:
>
> - Add get wchan implement. (Suggested by Huacai).
>
> Qing Zhang (4):
>   LoongArch: Add guess unwinder support
>   LoongArch: Add prologue unwinder support
>   LoongArch: Add stacktrace and get_wchan support
>   LoongArch: Add USER_STACKTRACE support
>
>  arch/loongarch/Kconfig                  |   6 +
>  arch/loongarch/Kconfig.debug            |  28 ++++
>  arch/loongarch/include/asm/inst.h       |  52 +++++++
>  arch/loongarch/include/asm/processor.h  |   9 ++
>  arch/loongarch/include/asm/stacktrace.h |  22 +++
>  arch/loongarch/include/asm/switch_to.h  |  14 +-
>  arch/loongarch/include/asm/unwind.h     |  47 +++++++
>  arch/loongarch/kernel/Makefile          |   4 +
>  arch/loongarch/kernel/asm-offsets.c     |   2 +
>  arch/loongarch/kernel/process.c         |  91 ++++++++++++-
>  arch/loongarch/kernel/stacktrace.c      |  78 +++++++++++
>  arch/loongarch/kernel/switch.S          |   2 +
>  arch/loongarch/kernel/traps.c           |  24 ++--
>  arch/loongarch/kernel/unwind_guess.c    |  67 +++++++++
>  arch/loongarch/kernel/unwind_prologue.c | 173 ++++++++++++++++++++++++
>  15 files changed, 602 insertions(+), 17 deletions(-)
>  create mode 100644 arch/loongarch/include/asm/unwind.h
>  create mode 100644 arch/loongarch/kernel/stacktrace.c
>  create mode 100644 arch/loongarch/kernel/unwind_guess.c
>  create mode 100644 arch/loongarch/kernel/unwind_prologue.c
>
> --
> 2.20.1
>
