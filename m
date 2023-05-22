Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25053AD4C
	for <loongarch@lists.linux.dev>; Mon, 22 May 2023 13:48:17 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1ae875bf125so21360335ad.1
        for <loongarch@lists.linux.dev>; Mon, 22 May 2023 06:48:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684763296; x=1687355296;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jGz08OQyeCqnxoLIdSWq6+vL4UPq3XQv2QFGyx1tKg0=;
        b=qjgTLN5ERjKFpuEJDSYNk4vi4w+YGsguhc3ja5gz5WGB5Yf6W8P14biSciYvbMBtS1
         uzmhoCmwR5WeSgVlFxYLxU3KwfmoQDyDtPJqB+A1+gBSsMhWP2DBAkayAeSyySIMn9Wy
         hVkG6/sVX353mDAMcCpBKRMGHZgt3Wt/K1CYOUPxVAYJfGrrPywwf/pi5RQbnPfg+6ke
         WdynKBvc5b9g9roZ4+9VUwGPq5pqfDrJWtGInWRSoipySMQA09QEXjFnoG+EaTB38oB/
         lM0YhEIU+73uu7yZkd5zf933iEcZ9WEqAXq1P9BtD53vhuz0vw4TGHD6hAuZZDH27ZVP
         VjrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684763296; x=1687355296;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jGz08OQyeCqnxoLIdSWq6+vL4UPq3XQv2QFGyx1tKg0=;
        b=UG2A0LCngjjYjtGafjxJk5totJ0zW8TXlHo9faIkVjCedXOhGnBswM9U1VXqUzJa58
         jojbfnFJYBPUMkab4gVQxV3vfgUUgylbzmWjMqwIySYZQZkQriSIVVmtJoYPUk/OSWNp
         mu6u4ljWX3SanUNYFViXIjHd/qs3G85Bk0o1G+Yg+2SB9QiQ+HTPMFZiM81DqRx2N1z1
         2YeWq28hVg63QLYMd7Ra1XH4hWTrj7CqHNJS14vZlh7XSehFLBsXHRiIoOW3MfCg5wAI
         Tj9WF85sUMvVjVMBl3DNLiXiKvznl2SB4J7QFB/6UOwcDu28UhpgUrJLISpQLtRj9Bia
         PQBQ==
X-Gm-Message-State: AC+VfDysjwueF27nznZj5P7LIi+7HWDkIHT6JbIy/z+bQSRCjzC1VGrH
	/l+9+jxUpHqb0T17niRcl8OZ/noLx+pekQee4Ac=
X-Google-Smtp-Source: ACHHUZ6IS5JmJ+ZDTz9QQZzHRGh7k7Pl91xxM/bsmLz/eNgRZwjR4aYBIugPczwz3Y9QlmRcmk40BVDGa6k/Iq/KC0Q=
X-Received: by 2002:a17:902:8508:b0:1af:b2d3:c6f4 with SMTP id
 bj8-20020a170902850800b001afb2d3c6f4mr2949506plb.14.1684763295850; Mon, 22
 May 2023 06:48:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <1683792372-29338-1-git-send-email-yangtiezhu@loongson.cn>
In-Reply-To: <1683792372-29338-1-git-send-email-yangtiezhu@loongson.cn>
From: Jeff Xie <xiehuan09@gmail.com>
Date: Mon, 22 May 2023 21:48:03 +0800
Message-ID: <CAEr6+EBU+Uon8rMvuEhLU0nADUMDEOSVZGSkAZvtuXJCEndzMg@mail.gmail.com>
Subject: Re: [PATCH v4 0/6] Add uprobes support for LoongArch
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org, loongson-kernel@lists.loongnix.cn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 11, 2023 at 4:06=E2=80=AFPM Tiezhu Yang <yangtiezhu@loongson.cn=
> wrote:
>
> v4:
>   -- Rebased on 6.4rc1
>   -- Fix problem about "perf probe -x /lib64/libc.so.6 malloc"
>
> v3:
>   -- Check atomic instructions in insns_not_supported()
>   -- Remove five DIE_* definitions in kdebug.h
>
> v2:
>   -- Move the functions to inst.c in patch #1
>   -- Pass around union for insns_not_supported(),
>      insns_need_simulation() and arch_simulate_insn()
>
> v1:
>   -- Split the RFC patch #2 into two patches
>   -- Use larch_insn_gen_break() to generate break insns
>      for kprobes and uprobes
>   -- Pass around instruction word instead of union for
>      insns_not_supported(), insns_need_simulation() and
>      arch_simulate_insn() to avoid type conversion for callers
>   -- Add a simple test case for uprobes in the commit message
>
> Tiezhu Yang (6):
>   LoongArch: Move three functions from kprobes.c to inst.c
>   LoongArch: Add larch_insn_gen_break() to generate break insns
>   LoongArch: Use larch_insn_gen_break() for kprobes
>   LoongArch: Add uprobes support
>   LoongArch: Check atomic instructions in insns_not_supported()
>   LoongArch: Remove five DIE_* definitions in kdebug.h
>
>  arch/loongarch/Kconfig               |   3 +
>  arch/loongarch/include/asm/inst.h    |  42 ++++++++++
>  arch/loongarch/include/asm/kdebug.h  |   5 --
>  arch/loongarch/include/asm/kprobes.h |   2 +-
>  arch/loongarch/include/asm/uprobes.h |  35 +++++++++
>  arch/loongarch/kernel/Makefile       |   1 +
>  arch/loongarch/kernel/inst.c         |  54 +++++++++++++
>  arch/loongarch/kernel/kprobes.c      |  75 ++++--------------
>  arch/loongarch/kernel/traps.c        |   9 +--
>  arch/loongarch/kernel/uprobes.c      | 148 +++++++++++++++++++++++++++++=
++++++
>  10 files changed, 302 insertions(+), 72 deletions(-)
>  create mode 100644 arch/loongarch/include/asm/uprobes.h
>  create mode 100644 arch/loongarch/kernel/uprobes.c
>
> --
> 2.1.0
>
>

It looks good to me for the patchset.

Tested-by: Jeff Xie <xiehuan09@gmail.com>

--=20
Thanks,
JeffXie
