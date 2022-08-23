Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8B641C07
	for <loongarch@lists.linux.dev>; Tue, 23 Aug 2022 12:09:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77E06C433D7
	for <loongarch@lists.linux.dev>; Tue, 23 Aug 2022 12:09:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661256545;
	bh=HJshxCeNGwXJZyi2uX/UEN2GZGeybEcTynXXCpJmkO4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Aefz8O8k2n0VL6lcXenjJq37jc3XytL31Pv/vS1vbRhRVbtavbpLbItLumrF9425D
	 LbK1v1R/i5c//avnOrrCRwYT8EF5oYaOActaamqWQDsN0eOAqQll6J6Oe4wesvKlvR
	 SxNwxrJRj/eQGjYzyRTxp6H4UINxswLl/P1Yi3r6XH/CeF5iAfelA4hfYC13cEPuth
	 Hvn4tAtYEYM452UUeV+BBxbv7q6+iOy+p8cE3kmDiWRBWCZB3KH8tMuLBtRgu9W0Gk
	 IwK/my+xwFH6jgx8naC5EN8C4BP4Y0GwhYaGxh5NkDPnGwpGmyZD9D9GibWIMkVkJF
	 ON5H18NuLTqnw==
Received: by mail-vk1-f174.google.com with SMTP id o14so3187505vkl.6
        for <loongarch@lists.linux.dev>; Tue, 23 Aug 2022 05:09:05 -0700 (PDT)
X-Gm-Message-State: ACgBeo3KRje5SlGCpNu2BjZBO8FigQrHgKf61SQDHPvKjdsHyVEWuaLY
	kiQbUqit5B9N6CtHhwaGZrJgB4uPDPtHzraLgB4=
X-Google-Smtp-Source: AA6agR6vvUVddKo+cJC/PGP435i2eqsLDAd1qBZDlzFcGKY628TDUoiMEQuof1NGSEXaXvq9GKHaTOYTSootdZ+8QRg=
X-Received: by 2002:a1f:1d4d:0:b0:382:59cd:596c with SMTP id
 d74-20020a1f1d4d000000b0038259cd596cmr9472460vkd.35.1661256544491; Tue, 23
 Aug 2022 05:09:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <1660996260-11337-1-git-send-email-yangtiezhu@loongson.cn>
 <7af3c82c-220b-1e9c-765f-105480264ae6@loongson.cn> <CAADnVQLx=V05UuyF2U5Scf=LUO9EtCCB=MkgWr_ycV9R0dgZQA@mail.gmail.com>
In-Reply-To: <CAADnVQLx=V05UuyF2U5Scf=LUO9EtCCB=MkgWr_ycV9R0dgZQA@mail.gmail.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Tue, 23 Aug 2022 20:08:52 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4eTQyhNC5CsH0Bbf8w6VD_goN98N44VxFdH5_dp=NQCg@mail.gmail.com>
Message-ID: <CAAhV-H4eTQyhNC5CsH0Bbf8w6VD_goN98N44VxFdH5_dp=NQCg@mail.gmail.com>
Subject: Re: [PATCH bpf-next v1 0/4] Add BPF JIT support for LoongArch
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: Tiezhu Yang <yangtiezhu@loongson.cn>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, bpf <bpf@vger.kernel.org>, 
	loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi, all,

On Tue, Aug 23, 2022 at 8:46 AM Alexei Starovoitov
<alexei.starovoitov@gmail.com> wrote:
>
> On Sun, Aug 21, 2022 at 6:36 PM Tiezhu Yang <yangtiezhu@loongson.cn> wrote:
> >
> >
> >
> > On 08/20/2022 07:50 PM, Tiezhu Yang wrote:
> > > The basic support for LoongArch has been merged into the upstream Linux
> > > kernel since 5.19-rc1 on June 5, 2022, this patch series adds BPF JIT
> > > support for LoongArch.
> > >
> > > Here is the LoongArch documention:
> > > https://www.kernel.org/doc/html/latest/loongarch/index.html
> > >
> > > With this patch series, the test cases in lib/test_bpf.ko have passed
> > > on LoongArch.
> > >
> > >   # echo 1 > /proc/sys/net/core/bpf_jit_enable
> > >   # modprobe test_bpf
> > >   # dmesg | grep Summary
> > >   test_bpf: Summary: 1026 PASSED, 0 FAILED, [1014/1014 JIT'ed]
> > >   test_bpf: test_tail_calls: Summary: 10 PASSED, 0 FAILED, [10/10 JIT'ed]
> > >   test_bpf: test_skb_segment: Summary: 2 PASSED, 0 FAILED
> > >
> > > It seems that this patch series can not be applied cleanly to bpf-next
> > > which is not synced to v6.0-rc1.
> >
> >
> > Hi Alexei, Daniel, Andrii,
> >
> > Do you know which tree this patch series will go through?
> > bpf-next or loongarch-next?
>
> Whichever way is easier.
> Looks like all changes are contained within arch/loongarch,
> so there should be no conflicts with generic JIT infra.
> In that sense it's fine to carry it in loongarch-next.
> We can take it through bpf-next too with arch maintainers acks.
OK, both ways look good to me.

Huacai
