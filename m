Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0481E1BC40
	for <loongarch@lists.linux.dev>; Sat, 15 Jun 2024 09:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718443698; cv=none; b=kiS3HZqQesbSaflKPlYlyt1mxpBUJjvA08avXXzycVSteSy8ZRqaENSlBNzdxPeIB5aea/V9Emu9MS7lgscBPUsPFSQm+wN0YlQaL6Rqb5WEJ2oI+vGj5jdWT21EmdXzMf9+a21HcBIUk0T3o1TMrmrGeRw8V2HHjgnZvlh/txI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718443698; c=relaxed/simple;
	bh=Q+Er8DHifQEOEp7wEbxJcdx+1O5y6jcn/zql9yg6Q1g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XQkhyY80JJzZtjbUcijzJShzLGsrgf+0+R/zKWHgjiqnTBC+bUevf+llm4SGTGsLK7vbgoYXkwpQUXEFudWrVwBX0JNgzsYobYF7oHfD3AG+0FVaR5DpERbPwn1ULoa/TvMc3g/G7CZkWe3iHHmQHQZFdB/TUyXe0TDcvGRXM4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dc5MBF9s; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dc5MBF9s"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D090C116B1
	for <loongarch@lists.linux.dev>; Sat, 15 Jun 2024 09:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718443697;
	bh=Q+Er8DHifQEOEp7wEbxJcdx+1O5y6jcn/zql9yg6Q1g=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=dc5MBF9sI0xWhnO6FxeMp5NWEbTL4yCUeSV0tqPBCyqYW1aMkwQ35RzKJ5uuljk71
	 2zsFQq0cMAphhyyWyqNvEMasl4Mp7cKYahMfZjttxCSL5qfAVWQjKuFxyGVUbf6nqA
	 lLalr5ei6D4EZ/s6gXyCffi8WFSBhrnVkMQC3npqUWdMWUTD+HO4ROCw7vl3vBqXcC
	 +cXAG+WSRyhcbEKlKxSfE+dfNC3ERFbEN3Tuwx7mdiClVsoj1aRBEaHKHHSdqkDtug
	 VUyIw6kt3yvk/4Nj9F51Nj/wIrZEL39iWuyYztE/TloRH+nbuW7gjD9SSXIgili5Zg
	 rrc5+06KqjZ4A==
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-57a44c2ce80so3416715a12.0
        for <loongarch@lists.linux.dev>; Sat, 15 Jun 2024 02:28:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXYrzcNbl6Wdq3WDvu5adSWw/eEsBUT4PaFqFqFEZ9qDklar6sWXEUAJpO+Yg8WfvMFgnmfcQOBWpZUQMRyZIqem3Kydy1XVVK1
X-Gm-Message-State: AOJu0Yxb9bUgparbuwRcADoWAfa5Rsp55HAiD7nV2dBAfdkCXZCLXF0d
	Pun0x7V12AYom+V6gm2i+ex1eSuHYNqAlaxIPfv+VZ2oFWWhsLvepz0by9+tulpSmLZhOw9ELvB
	F8SfChE/jaHMFl1C+gW+JxK9CCXs=
X-Google-Smtp-Source: AGHT+IFEEJ3bjwjbc57I5mm8cppTPBU4Xmztd+RcXiJ/IqhUg56apNi0RzYkSNmY5wtKT/MmQkSIM2xJlzjgvRQF6z4=
X-Received: by 2002:a50:cd09:0:b0:57c:947c:f9cf with SMTP id
 4fb4d7f45d1cf-57cbd6839b8mr3444930a12.11.1718443695985; Sat, 15 Jun 2024
 02:28:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240611114939.23586-1-lihui@loongson.cn> <CAAhV-H6+to0-s+RhA8ZcExgU4e39+gEx_Yr8C+z2DL49XaDyag@mail.gmail.com>
 <7727385a-2ce7-fe4f-8f2b-968185f9d3b0@loongson.cn>
In-Reply-To: <7727385a-2ce7-fe4f-8f2b-968185f9d3b0@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sat, 15 Jun 2024 17:28:03 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5y3Mzmdzb_JF0SYr3tpjJJSuWPk-GnUJ2jbOg=9w-hdg@mail.gmail.com>
Message-ID: <CAAhV-H5y3Mzmdzb_JF0SYr3tpjJJSuWPk-GnUJ2jbOg=9w-hdg@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] LoongArch: ptrace: Fix some watchpoint function
To: Jinyang He <hejinyang@loongson.cn>
Cc: Hui Li <lihui@loongson.cn>, loongarch@lists.linux.dev, 
	loongson-kernel@lists.loongnix.cn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 15, 2024 at 5:04=E2=80=AFPM Jinyang He <hejinyang@loongson.cn> =
wrote:
>
> Thanks for your reminder. These fix look good to me at present.
> (But these commit msg looks strange.) And thanks for his work.
OK, then Li Hui, please submit V3 to get it merged.

Huacai

>
> Jinyang
>
> On 2024-06-15 16:47, Huacai Chen wrote:
> > Hi, Jinyang,
> >
> > Do you have any additional comments about this series?
> >
> > Huacai
> >
> > On Tue, Jun 11, 2024 at 7:49=E2=80=AFPM Hui Li <lihui@loongson.cn> wrot=
e:
> >> LoongArch defines hardware watchpoint functions for fetch and load/sto=
re
> >> operations. After the software configures the watchpoints for fetch an=
d
> >> load/store, the processor hardware will monitor the access addresses o=
f
> >> the fetch and load/store operations and trigger a watchpoint exception
> >> when the watchpoint setting conditions are met.
> >>
> >> Fix some hardware watchpoint issues on user-space and kernel interface=
.
> >>
> >> All changes are made according to the LoongArch Reference Manual:
> >> https://loongson.github.io/LoongArch-Documentation/LoongArch-Vol1-EN.h=
tml#control-and-status-registers-related-to-watchpoints
> >>
> >> Testing for this series can use this gdb patch:
> >> https://sourceware.org/pipermail/gdb-patches/2024-June/209856.html
> >>
> >> Changes v1 -> v2:
> >> Suggested by Jinyang and Huacai:
> >> - Modify the commit message.
> >> - Modify the privilege level judgment in ptrace_hbp_set_ctrl() and
> >>    move the settings of regs->csr_prmd to hw_breakpoint_control().
> >> - Add judgment in ptrace_hbp_set_addr() to ensure that kernel-space
> >>    address cannot be monitored in user mode.
> >>
> >> Hui Li (3):
> >>    LoongArch: ptrace: Fix watchpoint setting error
> >>    LoongArch: Trigger user-space watchpoints correctly
> >>    LoongArch: Fix multiple hardware watchpoint issues
> >>
> >>   arch/loongarch/include/asm/hw_breakpoint.h |  3 +-
> >>   arch/loongarch/kernel/hw_breakpoint.c      | 86 ++++++++++++--------=
--
> >>   arch/loongarch/kernel/ptrace.c             | 48 +++++++-----
> >>   3 files changed, 77 insertions(+), 60 deletions(-)
> >>
> >> --
> >> 2.38.1
> >>
>
