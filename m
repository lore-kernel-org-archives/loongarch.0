Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F8EF7B
	for <loongarch@lists.linux.dev>; Tue, 25 Apr 2023 07:36:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33C87C4339B
	for <loongarch@lists.linux.dev>; Tue, 25 Apr 2023 07:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1682408180;
	bh=h3JjIRIFSEeHtFly2vQTrzQtCi3LMI7yBvZ+iAVslBw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=AUWpYWVZ1RxvamXNn34MehezKgMnH04C59+5CYeHpWRLVaaAUkLEpGsalfkjwaEi+
	 F237kiwmpUL610LkysSi94CmWlNooaLdlRfIFpo+zIw1IAFq5GH1tVXF9eTMM7DqUZ
	 d905Um5sPE89HnhvrNi4qMDhUtjZ/vRb7Ef1zg2AS+XudKeLJlTvykmY1ZK0sqRRPv
	 EHEuK5VJM+/oZmzBc2951+6PdrQc0/Qo2UrL9ym5+PRI15Z61vhDLojByP2YnTjbb3
	 TEKAe8Ntsauh0Q/g2Z3lzNQHTcvCMTvRiaNVASK4nxN3mXhG59LvpfMUpC4T2w/N5g
	 EGYMfLC2aKUhQ==
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5067736607fso9352929a12.0
        for <loongarch@lists.linux.dev>; Tue, 25 Apr 2023 00:36:20 -0700 (PDT)
X-Gm-Message-State: AAQBX9eQPaijPIPmJl4710dZkE1g5TnZdso+HUWaIQygdvrB9KfvE0dq
	lR1IrSq28k1jUx5iYtjkK/TVoJoyUE0fziio+po=
X-Google-Smtp-Source: AKy350ZQPX+MHadZ3xhwsj9F4LI65SpcpisFQIBFwMpzZsshAOe/Z7xJ+PdNzyQSA0HdFnVOScw6j6N4PRv7AxsC+c8=
X-Received: by 2002:aa7:d7c7:0:b0:4fc:709f:7abd with SMTP id
 e7-20020aa7d7c7000000b004fc709f7abdmr14465406eds.2.1682408178427; Tue, 25 Apr
 2023 00:36:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230422173455.3354690-1-kernel@xen0n.name> <20230422173455.3354690-13-kernel@xen0n.name>
In-Reply-To: <20230422173455.3354690-13-kernel@xen0n.name>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Tue, 25 Apr 2023 15:36:06 +0800
X-Gmail-Original-Message-ID: <CAAhV-H7KD-APUhe-L79paihfc7o4Cwi-HvJXuCO7FOiNAGNvPw@mail.gmail.com>
Message-ID: <CAAhV-H7KD-APUhe-L79paihfc7o4Cwi-HvJXuCO7FOiNAGNvPw@mail.gmail.com>
Subject: Re: [PATCH v6 12/13] LoongArch: Include CSR.BADV in show_regs in case
 of BCE exceptions
To: WANG Xuerui <kernel@xen0n.name>
Cc: loongarch@lists.linux.dev, WANG Xuerui <git@xen0n.name>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This patch can be dropped because it is expected that BCE doesn't update BA=
DV.

On Sun, Apr 23, 2023 at 1:36=E2=80=AFAM WANG Xuerui <kernel@xen0n.name> wro=
te:
>
> From: WANG Xuerui <git@xen0n.name>
>
> According to the LoongArch ISA Manual's description for CSR.BADV
> (Volume 1, Section 7.4.8), CSR.BADV is supposed to be updated in case of
> BCE [Bound checking error] too, in addition to the current implemented
> list of exceptions.
>
> Note: in my experiments CSR.BADV actually does *not* seem to reflect the
> offending out-of-bounds value at all, regardless of the instruction used
> (neither asrt{gt,le} nor {ld,st}{gt,le}). My wild guess is that when the
> assertion fails, the execution of the instruction has not proceeded to
> MEM stage yet, and that only in this stage is CSR.BADV potentially
> updated. We show it nevertheless because it does not hurt and it is
> generally better to maintain consistency with the manuals.
>
> Signed-off-by: WANG Xuerui <git@xen0n.name>
> ---
>  arch/loongarch/kernel/traps.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/loongarch/kernel/traps.c b/arch/loongarch/kernel/traps.=
c
> index a87c74f2ed1a..6c8ecc05183a 100644
> --- a/arch/loongarch/kernel/traps.c
> +++ b/arch/loongarch/kernel/traps.c
> @@ -350,7 +350,7 @@ static void __show_regs(const struct pt_regs *regs)
>         print_ecfg(regs->csr_ecfg);
>         print_estat(regs->csr_estat);
>
> -       if (exccode >=3D EXCCODE_TLBL && exccode <=3D EXCCODE_ALE)
> +       if (exccode >=3D EXCCODE_TLBL && exccode <=3D EXCCODE_OOB)
>                 pr_cont(" BADV: %0*lx\n", field, regs->csr_badvaddr);
>
>         pr_cont(" PRID: %08x (%s)\n", read_cpucfg(LOONGARCH_CPUCFG0),
> --
> 2.40.0
>
