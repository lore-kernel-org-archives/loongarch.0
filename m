Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2807FEC0
	for <loongarch@lists.linux.dev>; Tue, 29 Aug 2023 04:11:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94118C433CB
	for <loongarch@lists.linux.dev>; Tue, 29 Aug 2023 04:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693282316;
	bh=UE0fiU8lFv4dJudFnVMoBNTPI7KqE1uy1T28k5iHb4A=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=n0nsJEXFXvVbV4XCAcoylKgp8EdAvbi45Sf3MMemgHXm+PSrUUR99TobOIB/U11N3
	 4tJqsX16l+oFGq0hGbp47Gn+kh6soR4JvFxfkrIvHIf8gUyFKUygo0guJDIhm8pbXy
	 ELC0SwQz2g2Ig6XfpM7E/HOsnnhEkdXSbiRuRjN1T0GvY22k5K7lPFYIU5mCOGTB01
	 9IE1qAVkqzUmKCA1Y8f3InZFWE5kf5DeqVwlPvo6DrQ+8FEDVuc0w2sPFch4R7Sx+9
	 X0OeSmW3Bg92E92xEFzrNufBChBo+Wtl8FdPIH6Vnzm75S08xXl2TgadQEvnMMD6GJ
	 7KNkY71mKJbcA==
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-9a2a4a5472dso839083066b.1
        for <loongarch@lists.linux.dev>; Mon, 28 Aug 2023 21:11:56 -0700 (PDT)
X-Gm-Message-State: AOJu0Ywj8VoqEl7rGPwzxywaGou56OT1U6T5aM9lsi2Bp/RB5klzVG1B
	pSqEYpfACd6tfRL68R4I5pjcbZ1QxeidLLjFa3s=
X-Google-Smtp-Source: AGHT+IGBvfYoh1PFxGP/kniMUDcEPyq8i2LMVb8Vo8d8EdIgKhtuZOFQRYCX4xLp/Spw4FEe4q61imfQx/Sk4P4bTAk=
X-Received: by 2002:a17:907:868d:b0:9a5:7d34:e68a with SMTP id
 qa13-20020a170907868d00b009a57d34e68amr1497886ejc.28.1693282314885; Mon, 28
 Aug 2023 21:11:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230829002323.28303-1-rdunlap@infradead.org>
In-Reply-To: <20230829002323.28303-1-rdunlap@infradead.org>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Tue, 29 Aug 2023 12:11:42 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4ORNqMYh0maxkyZFjEn5HgC7vZHUZD8GicOn7pkN8C4g@mail.gmail.com>
Message-ID: <CAAhV-H4ORNqMYh0maxkyZFjEn5HgC7vZHUZD8GicOn7pkN8C4g@mail.gmail.com>
Subject: Re: [PATCH 2/2] Loongarch: KGDB: fix build when CPU_HAS_LBT not set
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kernel@vger.kernel.org, Qing Zhang <zhangqing@loongson.cn>, 
	Hui Li <lihui@loongson.cn>, Binbin Zhou <zhoubinbin@loongson.cn>, 
	WANG Xuerui <kernel@xen0n.name>, loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Randy,

On Tue, Aug 29, 2023 at 8:23=E2=80=AFAM Randy Dunlap <rdunlap@infradead.org=
> wrote:
>
> Fix build errors when CONFIG_CPU_HAS_LBT is not set:
>
> loongarch64-linux-ld: arch/loongarch/kernel/kgdb.o: in function `dbg_get_=
reg':
> arch/loongarch/kernel/kgdb.c:154:(.text+0xc7c): undefined reference to `_=
save_lbt'
> loongarch64-linux-ld: arch/loongarch/kernel/kgdb.o: in function `dbg_set_=
reg':
> arch/loongarch/kernel/kgdb.c:229:(.text+0x13a4): undefined reference to `=
_restore_lbt'
Thank you for your patch, this has been fixed in today's linux-next.

Huacai
>
> Fixes: 8968eb010689 ("LoongArch: Add basic KGDB & KDB support")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Qing Zhang <zhangqing@loongson.cn>
> Cc: Hui Li <lihui@loongson.cn>
> Cc: Binbin Zhou <zhoubinbin@loongson.cn>
> Cc: Huacai Chen <chenhuacai@kernel.org>
> Cc: WANG Xuerui <kernel@xen0n.name>
> Cc: loongarch@lists.linux.dev
> ---
>  arch/loongarch/kernel/kgdb.c |    6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff -- a/arch/loongarch/kernel/kgdb.c b/arch/loongarch/kernel/kgdb.c
> --- a/arch/loongarch/kernel/kgdb.c
> +++ b/arch/loongarch/kernel/kgdb.c
> @@ -150,7 +150,8 @@ char *dbg_get_reg(int regno, void *mem,
>         }
>
>         /* Handle LBT registers */
> -       if ((regs->csr_euen & CSR_EUEN_LBTEN)) {
> +       if (IS_ENABLED(CONFIG_CPU_HAS_LBT) &&
> +           (regs->csr_euen & CSR_EUEN_LBTEN)) {
>                 _save_lbt(&current->thread.lbt);
>
>                 switch (regno) {
> @@ -211,7 +212,8 @@ int dbg_set_reg(int regno, void *mem, st
>         }
>
>         /* Handle LBT registers */
> -       if ((regs->csr_euen & CSR_EUEN_LBTEN)) {
> +       if (IS_ENABLED(CONFIG_CPU_HAS_LBT) &&
> +           (regs->csr_euen & CSR_EUEN_LBTEN)) {
>                 switch (regno) {
>                 case DBG_FTOP:                          /* Process the ft=
op */
>                         memcpy((char *)&current->thread.fpu.ftop, mem, re=
g_size);
