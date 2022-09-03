Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3383F7B
	for <loongarch@lists.linux.dev>; Sat,  3 Sep 2022 07:12:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFA1CC433C1
	for <loongarch@lists.linux.dev>; Sat,  3 Sep 2022 07:12:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662189144;
	bh=Kn2yc6CZQiAttDW9UyZZ39zS4Btyq23PdHxhiou4+y0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=elP9R+TmpGolZkm7MWI6ZLV8zmL6Ya2zSA54mzrO8/Jk/8yjZEy75N5/JPlXkYPBQ
	 qUoTqLEQtEEMUEwOZCz0S8igX5Sf/2TrR5YhG0tsDxCvhOyKTmK4BrI0icuD21ioGF
	 Hlu3KoAnJMp8BC3aVeZ5ABcli4a1lg7nEYBzr0CY8/Bj4OYQMHGkeojuxSpw4DR1hK
	 sNnlfG63No8aE5df1uddycMVY/ppLjw2O28aSrkXMrEOPE7cei52Iyg1JOEJHVPnxk
	 CP9mZoiLK/pHDjBl+2QAV1/KI31fZQ+kf166cVMgzuC2vO3lQ65YgvVp3PkUJnaOp2
	 sx7bN0A7OaJcg==
Received: by mail-vs1-f44.google.com with SMTP id d126so4087280vsd.13
        for <loongarch@lists.linux.dev>; Sat, 03 Sep 2022 00:12:24 -0700 (PDT)
X-Gm-Message-State: ACgBeo0rJ95jt+PZf6Cc9/WYC3JL6CnPrCvRC3XML9PAN7Bjcx3TavfQ
	6eOwNNiBBkTN3rG5ZfV43s2ykrjVBEy9q4mK908=
X-Google-Smtp-Source: AA6agR51C/qOFX3VjAto+WXDA9tjQR4pxUxhyqemSBEGEodQm1lsY2CxLq3boFfRbj7cUEPoRx5vrxokdlPpQg8IBHE=
X-Received: by 2002:a05:6102:390d:b0:387:78b9:bf9c with SMTP id
 e13-20020a056102390d00b0038778b9bf9cmr12129636vsu.43.1662189143886; Sat, 03
 Sep 2022 00:12:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <1661999249-10258-1-git-send-email-yangtiezhu@loongson.cn> <2219694c-5e4c-2b81-ee39-367467ac0733@iogearbox.net>
In-Reply-To: <2219694c-5e4c-2b81-ee39-367467ac0733@iogearbox.net>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sat, 3 Sep 2022 15:12:12 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5FK0NvPgzNGNqz9edUQ44uQbOgsLSaqfoqq007ZuLzKg@mail.gmail.com>
Message-ID: <CAAhV-H5FK0NvPgzNGNqz9edUQ44uQbOgsLSaqfoqq007ZuLzKg@mail.gmail.com>
Subject: Re: [PATCH bpf-next v3 0/4] Add BPF JIT support for LoongArch
To: Daniel Borkmann <daniel@iogearbox.net>
Cc: Tiezhu Yang <yangtiezhu@loongson.cn>, Alexei Starovoitov <ast@kernel.org>, 
	Andrii Nakryiko <andrii@kernel.org>, bpf <bpf@vger.kernel.org>, loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi, Daniel,

On Fri, Sep 2, 2022 at 9:34 PM Daniel Borkmann <daniel@iogearbox.net> wrote:
>
> On 9/1/22 4:27 AM, Tiezhu Yang wrote:
> > The basic support for LoongArch has been merged into the upstream Linux
> > kernel since 5.19-rc1 on June 5, 2022, this patch series adds BPF JIT
> > support for LoongArch.
> >
> > Here is the LoongArch documention:
> > https://www.kernel.org/doc/html/latest/loongarch/index.html
> >
> > With this patch series, the test cases in lib/test_bpf.ko have passed
> > on LoongArch.
> >
> >    # echo 1 > /proc/sys/net/core/bpf_jit_enable
> >    # modprobe test_bpf
> >    # dmesg | grep Summary
> >    test_bpf: Summary: 1026 PASSED, 0 FAILED, [1014/1014 JIT'ed]
> >    test_bpf: test_tail_calls: Summary: 10 PASSED, 0 FAILED, [10/10 JIT'ed]
> >    test_bpf: test_skb_segment: Summary: 2 PASSED, 0 FAILED
> >
> > It seems that this patch series can not be applied cleanly to bpf-next
> > which is not synced to v6.0-rc3.
>
> For bpf-next tree this doesn't apply cleanly. Huacai, probably easier if you
> take it in. Otherwise this needs rebase (and your Ack as arch maintainer), but
> then there'll be merge conflict later anyway.
This series can be cleanly applied on loongarch-next. So if this
series is good to you, please give an Acked-by, and I will apply them
to loongarch-next, thanks.

Huacai

>
> [...]
> Applying: LoongArch: Move {signed,unsigned}_imm_check() to inst.h
> Applying: LoongArch: Add some instruction opcodes and formats
> error: patch failed: arch/loongarch/include/asm/inst.h:18
> error: arch/loongarch/include/asm/inst.h: patch does not apply
> Patch failed at 0002 LoongArch: Add some instruction opcodes and formats
> [...]
>
> Thanks,
> Daniel
>
> > v3:
> >    -- Remove CONFIG_TEST_BPF in loongson3_defconfig
> >
> > v2:
> >    -- Rebased series on v6.0-rc3
> >    -- Make build_epilogue() static
> >    -- Use alsl.d, bstrpick.d, [ld/st]ptr.[w/d] to save some instructions
> >    -- Replace move_imm32() and move_imm64() with move_imm() and optimize it
> >    -- Add code comments to explain the considerations of conditional jump
> >    https://lore.kernel.org/bpf/1661857809-10828-1-git-send-email-yangtiezhu@loongson.cn/
> >
> > v1:
> >    -- Rebased series on v6.0-rc1
> >    -- Move {signed,unsigned}_imm_check() to inst.h
> >    -- Define the imm field as "unsigned int" in the instruction format
> >    -- Use DEF_EMIT_*_FORMAT to define the same kind of instructions
> >    -- Use "stack_adjust += sizeof(long) * 8" in build_prologue()
> >    https://lore.kernel.org/bpf/1660996260-11337-1-git-send-email-yangtiezhu@loongson.cn/
> >
> > RFC:
> >    https://lore.kernel.org/bpf/1660013580-19053-1-git-send-email-yangtiezhu@loongson.cn/
> >
> > Tiezhu Yang (4):
> >    LoongArch: Move {signed,unsigned}_imm_check() to inst.h
> >    LoongArch: Add some instruction opcodes and formats
> >    LoongArch: Add BPF JIT support
> >    LoongArch: Enable BPF_JIT in default config
> >
> >   arch/loongarch/Kbuild                      |    1 +
> >   arch/loongarch/Kconfig                     |    1 +
> >   arch/loongarch/configs/loongson3_defconfig |    1 +
> >   arch/loongarch/include/asm/inst.h          |  383 ++++++++-
> >   arch/loongarch/kernel/module.c             |   10 -
> >   arch/loongarch/net/Makefile                |    7 +
> >   arch/loongarch/net/bpf_jit.c               | 1160 ++++++++++++++++++++++++++++
> >   arch/loongarch/net/bpf_jit.h               |  282 +++++++
> >   8 files changed, 1830 insertions(+), 15 deletions(-)
> >   create mode 100644 arch/loongarch/net/Makefile
> >   create mode 100644 arch/loongarch/net/bpf_jit.c
> >   create mode 100644 arch/loongarch/net/bpf_jit.h
> >
>
