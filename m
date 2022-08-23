Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 941827F
	for <loongarch@lists.linux.dev>; Tue, 23 Aug 2022 00:46:16 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id ce26so8746313ejb.11
        for <loongarch@lists.linux.dev>; Mon, 22 Aug 2022 17:46:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=mx6iH25MqAk0QMxhP/iujeqf4cbBmojIAuHogERGzHI=;
        b=G58MsPpT2IOBhBXfItNJ3DXENcYBd9TCyC1iO+Cg3M6qAR+RLmhocIiQFJqP929sBq
         W5p5zZYgm03MNASeydGCZi+irCf/Coii3vVDOvRrlhSxOmTaGFKUPkEqwSVFFgpxhWtc
         3sR00Ufs33cgZMUMOWzTrKX5Iu0wSxtw7FpnKZivKBNi4lbFW/vjlH5diCJdyHKP8Py5
         rF8rw8GDHfb68kYofyOjpbQ8tMClnDSkFr3f1KSKLsCNftYZtFa9msQb6Q2pcjfU7Eqm
         SKPrX/grXzFrm6oF+0YwK8qgNXszMrY+EZPXOmHnvffI34Fbe8/J2JTEfIO8FDjnzPm/
         ZicQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=mx6iH25MqAk0QMxhP/iujeqf4cbBmojIAuHogERGzHI=;
        b=Usoxc2ttdmoftdqW1NxIgSfrsGOgnKSKq6roOSWB6O1dKsCDNEmuvaHw8brvCR1b0L
         tpeknY7BF9IJI5eeI4tgyphaa11v7BFM9/Fw5MeBFx7Le2dURIlTC2Ui2UBCnLOA/O/+
         f4ayCYatjJWNlYbJ04L0jMDpiqEsF9jhi0vtTkv/mxrzjUtfuRMKzlYoKh82D15B0Rom
         Cq2oDR+SA4ICnHAIpJ3TMNwc0n0bTj7IKPWeZqKjmSlLZnBmpH5MsAPwmyVA2SqJ5Xon
         WWIxMAch7Kopr2HfqhRYP15AgakVDM5HP+2zwlbZkPBYsAhUmJjzICePMNFiPbPXCsZY
         hzwA==
X-Gm-Message-State: ACgBeo0C+wuCplX1FiM4GRhh79O62HsVnxTl8vvKmIO+bMPCDmlzNm5C
	PjbG85NJyPBDP2xEEBwahxomA4wwPBZvFgyYSbA=
X-Google-Smtp-Source: AA6agR7dRV5U3KpYlRSuKaXhGaqBP7AHE4avMkDS00GOVn9+YIQXqnJ7XlPdFRR39bpPaDVfkk9twHMnz7xEaq/1Iic=
X-Received: by 2002:a17:907:e8d:b0:730:a4e8:27ed with SMTP id
 ho13-20020a1709070e8d00b00730a4e827edmr14073219ejc.58.1661215574661; Mon, 22
 Aug 2022 17:46:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <1660996260-11337-1-git-send-email-yangtiezhu@loongson.cn> <7af3c82c-220b-1e9c-765f-105480264ae6@loongson.cn>
In-Reply-To: <7af3c82c-220b-1e9c-765f-105480264ae6@loongson.cn>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Mon, 22 Aug 2022 17:46:03 -0700
Message-ID: <CAADnVQLx=V05UuyF2U5Scf=LUO9EtCCB=MkgWr_ycV9R0dgZQA@mail.gmail.com>
Subject: Re: [PATCH bpf-next v1 0/4] Add BPF JIT support for LoongArch
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: Huacai Chen <chenhuacai@kernel.org>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, bpf <bpf@vger.kernel.org>, 
	loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Sun, Aug 21, 2022 at 6:36 PM Tiezhu Yang <yangtiezhu@loongson.cn> wrote:
>
>
>
> On 08/20/2022 07:50 PM, Tiezhu Yang wrote:
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
> >   # echo 1 > /proc/sys/net/core/bpf_jit_enable
> >   # modprobe test_bpf
> >   # dmesg | grep Summary
> >   test_bpf: Summary: 1026 PASSED, 0 FAILED, [1014/1014 JIT'ed]
> >   test_bpf: test_tail_calls: Summary: 10 PASSED, 0 FAILED, [10/10 JIT'ed]
> >   test_bpf: test_skb_segment: Summary: 2 PASSED, 0 FAILED
> >
> > It seems that this patch series can not be applied cleanly to bpf-next
> > which is not synced to v6.0-rc1.
>
>
> Hi Alexei, Daniel, Andrii,
>
> Do you know which tree this patch series will go through?
> bpf-next or loongarch-next?

Whichever way is easier.
Looks like all changes are contained within arch/loongarch,
so there should be no conflicts with generic JIT infra.
In that sense it's fine to carry it in loongarch-next.
We can take it through bpf-next too with arch maintainers acks.
