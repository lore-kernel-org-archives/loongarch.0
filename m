Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C727F46BB
	for <loongarch@lists.linux.dev>; Mon, 12 Jun 2023 07:41:52 +0000 (UTC)
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-543c6a2aa07so2045249a12.0
        for <loongarch@lists.linux.dev>; Mon, 12 Jun 2023 00:41:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686555712; x=1689147712;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SSLtE9E0vmCcghH4dSd0lHHpsUifthyCoqFs6ZgaUaw=;
        b=VyxQ9Rkh3zhRrPa+z0VNWVV7eMuki71zijDBxYrRhKUGgtimiNX3HiYS6FpKUCj4V7
         jvqfGYSU4bpIVBu6Z3+0Wpd7dLv55JxUNffaaWbDJNms8B4wULR1DSrRpPscL1+kALCJ
         twvdd45qWfNMLXrP+b5tOD2Yv7TOrtIeNb6JZhBQnX3UnZ4ti6MJFEbVo2aN/kALrbE7
         NRjks+atUjin0MzJlKKPKnFO+mp1tZPkDMqu/K/R2uEfg4f7oxYjYVzoiPlX0IdTX7TM
         aql9L02SifdCsxsZpwuSEOn/RzegirjCtnyv/4aUni8UOXrz0rvCbjApviX19D9ZQcQv
         OBLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686555712; x=1689147712;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SSLtE9E0vmCcghH4dSd0lHHpsUifthyCoqFs6ZgaUaw=;
        b=NAg7HJBCkStHhnVSmpjF1Ove9Vid/LPtjL3oFwyGi0zZLJroeQtVElMkvxMAV+QYDG
         sq+kiJuqr02VN5TcfGMmIJJ5ewR6sQr7facKC3MoWu3aOz7V/SNDCmNIA7etrEmaXTLn
         o79yUrLC9lQCc5zJAhDLv6GWrAQU2Cq2jm4Y3nhUX+FplWIN8kXGNCJbI68JipTl1X8q
         mCKNIzu+QXMjUdLp9OO1h4Ve0kPcZzugESk6jU3Z/ZFNrNzGzjy0nS6FMurHlCqfq6Ie
         pc5zD4Nj6SkmTiiwLm3mEx/GKpTtc94e5wRlI7SfzSsRK2SreoXIn3svhuqdc5lcslKb
         JT5w==
X-Gm-Message-State: AC+VfDx6wOZByYk51yUxQ95MrdANaGd8wTBKmjxEhU5EOz4ICNMQAPS5
	1kzXsORyboG5q1DfI7u2vfrE5pgdVE1/aEBgrDESNiDU
X-Google-Smtp-Source: ACHHUZ4GJlYRw5sQhOMFC+yfY+NGowvFcUFxYSpFHK3hwLbSevbI8QoY3IsTyXIBdxTb9oiPTyAB+swTScLD2gajvh0=
X-Received: by 2002:a17:90a:688d:b0:259:17c9:fda7 with SMTP id
 a13-20020a17090a688d00b0025917c9fda7mr7130374pjd.4.1686555711613; Mon, 12 Jun
 2023 00:41:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <1685947150-4949-1-git-send-email-yangtiezhu@loongson.cn> <CAAhV-H5CXX+tVdXj8jpYjeprwFihDJw6O6K5t6dRZPH8bWZ94A@mail.gmail.com>
In-Reply-To: <CAAhV-H5CXX+tVdXj8jpYjeprwFihDJw6O6K5t6dRZPH8bWZ94A@mail.gmail.com>
From: Jeff Xie <xiehuan09@gmail.com>
Date: Mon, 12 Jun 2023 15:41:40 +0800
Message-ID: <CAEr6+EA9OCRANk+kVov=jZmrbxAV_vVhLV-F+5v7P7dYM2g7PQ@mail.gmail.com>
Subject: Re: [PATCH v5 0/6] Add uprobes support for LoongArch
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Tiezhu Yang <yangtiezhu@loongson.cn>, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org, loongson-kernel@lists.loongnix.cn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 7, 2023 at 4:52=E2=80=AFPM Huacai Chen <chenhuacai@kernel.org> =
wrote:
>
> Hi, Jeff,
>
> I queued this series at
> https://github.com/chenhuacai/linux/commits/loongarch-next, could you
> please test it when you have time? Thanks.

I have tested this series and saw no errors while using uprobe, the
patchset looks good to me.

Tested-by: Jeff Xie <xiehuan09@gmail.com>

>
> Huacai
>
> On Mon, Jun 5, 2023 at 2:39=E2=80=AFPM Tiezhu Yang <yangtiezhu@loongson.c=
n> wrote:
> >
> > v5:
> >   -- Rebased on 6.4rc5
> >   -- Like arm64, add user_enable_single_step() in arch_uprobe_pre_xol()=
,
> >      add user_disable_single_step() in arch_uprobe_{post,abort}_xol(),
> >      suggested by Jeff and Huacai offline
> >
> > v4:
> >   -- Rebased on 6.4rc1
> >   -- Fix problem about "perf probe -x /lib64/libc.so.6 malloc"
> >
> > v3:
> >   -- Check atomic instructions in insns_not_supported()
> >   -- Remove five DIE_* definitions in kdebug.h
> >
> > v2:
> >   -- Move the functions to inst.c in patch #1
> >   -- Pass around union for insns_not_supported(),
> >      insns_need_simulation() and arch_simulate_insn()
> >
> > v1:
> >   -- Split the RFC patch #2 into two patches
> >   -- Use larch_insn_gen_break() to generate break insns
> >      for kprobes and uprobes
> >   -- Pass around instruction word instead of union for
> >      insns_not_supported(), insns_need_simulation() and
> >      arch_simulate_insn() to avoid type conversion for callers
> >   -- Add a simple test case for uprobes in the commit message
> >
> > Tiezhu Yang (6):
> >   LoongArch: Move three functions from kprobes.c to inst.c
> >   LoongArch: Add larch_insn_gen_break() to generate break insns
> >   LoongArch: Use larch_insn_gen_break() for kprobes
> >   LoongArch: Add uprobes support
> >   LoongArch: Check atomic instructions in insns_not_supported()
> >   LoongArch: Remove five DIE_* definitions in kdebug.h
> >
> >  arch/loongarch/Kconfig               |   3 +
> >  arch/loongarch/include/asm/inst.h    |  42 ++++++++++
> >  arch/loongarch/include/asm/kdebug.h  |   5 --
> >  arch/loongarch/include/asm/kprobes.h |   2 +-
> >  arch/loongarch/include/asm/uprobes.h |  35 ++++++++
> >  arch/loongarch/kernel/Makefile       |   1 +
> >  arch/loongarch/kernel/inst.c         |  54 +++++++++++++
> >  arch/loongarch/kernel/kprobes.c      |  75 ++++-------------
> >  arch/loongarch/kernel/traps.c        |   9 +--
> >  arch/loongarch/kernel/uprobes.c      | 152 +++++++++++++++++++++++++++=
++++++++
> >  10 files changed, 306 insertions(+), 72 deletions(-)
> >  create mode 100644 arch/loongarch/include/asm/uprobes.h
> >  create mode 100644 arch/loongarch/kernel/uprobes.c
> >
> > --
> > 2.1.0
> >



--=20
Thanks,
JeffXie
